.PHONY: all run-quick run-basic run-advanced clean clean-quick clean-basic clean-advanced clean-all

all: run-quick # Default target

# Neo4j authentication variables
NEO4J_USER := neo4j
NEO4J_PASSWORD := test


# Quick start: Run Neo4j with default settings and custom auth
#
# It sets up port mapping and custom authentication but doesn't persist data.
run-quick:
	docker run --name test-neor4j-quick -p7474:7474 -p7687:7687 -e NEO4J_AUTH=$(NEO4J_USER)/$(NEO4J_PASSWORD) neo4j:latest

# Basic setup: Run Neo4j with data persistence
#
# This target offers a basic setup with data persistence.
# It maps the necessary ports and mounts a volume for data storage.
run-basic:
	docker run \
	--name test-neo4j-basic \
	--publish=7474:7474 --publish=7687:7687 \
	--volume=$$HOME/.config/neo4j/data:/data \
	-e NEO4J_AUTH=$(NEO4J_USER)/$(NEO4J_PASSWORD) \
	neo4j:latest

# Advanced setup: Run Neo4j with full configuration and persistence.
#
# This target provides an advanced configuration with full persistence
# and additional options.
# It includes named container, detached mode (!),
# multiple volume mounts, and custom authentication.
run-advanced:
	docker run \
	--name test-neo4j-advanced \
	-p7474:7474 -p7687:7687 \
	-d \
	-v $$HOME/.config/neo4j/data:/data \
	-v $$HOME/.config/neo4j/logs:/logs \
	-v $$HOME/.config/neo4j/import:/var/lib/neo4j/import \
	-v $$HOME/.config/neo4j/plugins:/plugins \
	-e NEO4J_AUTH=$(NEO4J_USER)/$(NEO4J_PASSWORD)
	neo4j:latest
	# https://neo4j.com/developer/docker-run-neo4j/

# Clean up the quick setup
clean-quick:
	docker stop test-neor4j-quick || true
	docker rm test-neor4j-quick || true

# Clean up the basic setup
clean-basic:
	docker stop test-neo4j-basic || true
	docker rm test-neo4j-basic || true

# Clean up the advanced setup
clean-advanced:
	docker stop test-neo4j-advanced || true
	docker rm test-neo4j-advanced || true

# Clean up all Neo4j containers
clean:
	docker stop test-neor4j-quick test-neo4j-basic test-neo4j-advanced || true
	docker rm test-neor4j-quick test-neo4j-basic test-neo4j-advanced || true

# Clean up all Neo4j containers and remove the Neo4j image
clean-all: clean
	docker rmi neo4j:latest || true

# Stop all running Neo4j containers
stop:
	docker stop test-neor4j-quick test-neo4j-basic test-neo4j-advanced || true

