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

- Username: test
- Password: test

You can modify these in the Makefile by changing the `NEO4J_USER` and `NEO4J_PASSWORD` variables.

## Example Dataset

This repository includes an example geography dataset in the `example/geo` directory. This dataset includes information about continents, countries, cities, and rivers.

To import this dataset into Neo4j, you can use either the `cypher-shell` or `neo4j-admin` command:

Using `cypher-shell`:

```
./cypher-shell -u neo4j -p your_password -f example/geo/geo.import.cypher
```

Using `neo4j-admin`:

```
./neo4j-admin import --mode=csv \
    --database=neo4j \
    --nodes=Continent=example/geo/continents.csv \
    --nodes=Country=example/geo/countries.csv \
    --nodes=City=example/geo/cities.csv \
    --nodes=River=example/geo/rivers.csv
```

## Accessing Neo4j

- Browser interface: http://localhost:7474
- Bolt port: 7687

## Additional Information

For more details on using Neo4j with Docker, refer to:
- [Neo4j Docker Hub](https://hub.docker.com/_/neo4j)
- [Neo4j Developer Guide for Docker](https://neo4j.com/developer/docker-run-neo4j/)
