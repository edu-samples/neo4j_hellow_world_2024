# Neo4j Docker Setup

This project provides a convenient way to set up and run Neo4j using Docker with various configurations. It offers quick, basic, and advanced setup options to suit different needs.

## About

Neo4j is a graph database management system. This project uses Docker to containerize Neo4j, making it easy to deploy and manage in different environments.

## Usage

To run Neo4j, use one of the following commands:

```
make run-quick
make run-basic
make run-advanced
```

To clean up containers:

```
make clean-quick
make clean-basic
make clean-advanced
make clean        # Cleans all containers
make clean-all    # Cleans all containers and removes the Neo4j image
```

To stop all running containers:

```
make stop
```

## Run Target Comparison

| Feature                | run-quick | run-basic | run-advanced |
|------------------------|-----------|-----------|--------------|
| Port Mapping           | ✅        | ✅        | ✅           |
| Custom Authentication  | ✅        | ✅        | ✅           |
| Data Persistence       | ❌        | ✅        | ✅           |
| Logs Persistence       | ❌        | ❌        | ✅           |
| Import Dir Persistence | ❌        | ❌        | ✅           |
| Plugins Persistence    | ❌        | ❌        | ✅           |
| Detached Mode          | ❌        | ❌        | ✅           |
| Named Container        | ✅        | ✅        | ✅           |

## Default Credentials

```
NEO4J_USER=neo4j
NEO4J_PASSWORD=test
```

You can modify these in the Makefile by changing the `NEO4J_USER` and `NEO4J_PASSWORD` variables.

## Example Dataset

This repository includes an example geography dataset in the `example/geo` directory. This dataset includes information about continents, countries, cities, and rivers.

To import this dataset into Neo4j, you can use either the `cypher-shell` or `neo4j-admin` command:

### Import just as cypher file

`example/geo/insert_geo_data.cypher` contains cypher queries to insert data, so can be run using:

```
./cypher-shell -u neo4j -p "$NEO4J_PASSWORD" -f example/geo/insert_geo_data.cypher
```

example queries (can also be run in web browser under <http://localhost:7474> ):

```
./cypher-shell "MATCH (c:Continent) RETURN c;"

./cypher-shell -u neo4j -p test -a bolt://localhost:7687 "MATCH (c:Continent) RETURN c;"

./cypher-shell "MATCH (c:Country)-[:LOCATED_IN]->(cont:Continent {name: 'Africa'}) RETURN c;"

# display all nodes and relationships:
./cypher-shell "MATCH (n)-[r]->(m) RETURN n, r, m;"

```

More interesting queries in `example/geo/example_queries.md`.

## Accessing Neo4j

- Browser interface: http://localhost:7474
- Bolt port: 7687

## Additional Information

For more details on using Neo4j with Docker, refer to:
- [Neo4j Docker Hub](https://hub.docker.com/_/neo4j)
- [Neo4j Developer Guide for Docker](https://neo4j.com/developer/docker-run-neo4j/)
