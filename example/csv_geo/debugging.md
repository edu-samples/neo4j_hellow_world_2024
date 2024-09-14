
## WIP: for some reason csv does not work

### Potential reasons:

Solution: Move CSV Files to Neo4j's Import Directory
You need to place your CSV files in the import directory of the Neo4j database installation. Follow these steps to resolve the issue:

Linux/macOS: /var/lib/neo4j/import or /path/to/neo4j/import

Alternative: Change Neo4j Configuration to Allow External Access (Less Secure)
If you prefer not to move the files, you can change Neo4j's configuration to allow access to external directories. This is less secure and generally not recommended for production environments.

Open the neo4j.conf file.

Add or modify the following line to allow file access outside the import directory:

```
dbms.security.allow_csv_import_from_file_urls=true
```

Restart the Neo4j server:


```bash
neo4j restart
```

After doing this, try running your import command again.


### draft for CSV import

Using `cypher-shell`:

```
(
NEO4J_PASSWORD=test
cd example/csv_geo && ../../cypher-shell -u neo4j -p "$NEO4J_PASSWORD" -f geo.import.cypher
)
```

Using `neo4j-admin`:

```
./neo4j-admin import --mode=csv \
    --database=neo4j \
    --nodes=Continent=example/csv_geo/continents.csv \
    --nodes=Country=example/csv_geo/countries.csv \
    --nodes=City=example/csv_geo/cities.csv \
    --nodes=River=example/csv_geo/rivers.csv
```
