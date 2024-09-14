.PHONY: run run2

run:
	docker run \
	--publish=7474:7474 --publish=7687:7687 \
	--volume=$$HOME/.config/neo4j/data:/data \
	neo4j

run2:
	docker run \
	--name testneo4j \
	-p7474:7474 -p7687:7687 \
	-d \
	-v $HOME/.config/neo4j/data:/data \
	-v $HOME/.config/neo4j/logs:/logs \
	-v $HOME/.config/neo4j/import:/var/lib/neo4j/import \
	-v $HOME/.config/neo4j/plugins:/plugins \
	--env NEO4J_AUTH=neo4j/test \
	neo4j:latest  # https://neo4j.com/developer/docker-run-neo4j/
