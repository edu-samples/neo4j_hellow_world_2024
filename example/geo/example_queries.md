The updated dataset now includes a more complex relationship structure with countries belonging to multiple continents and rivers flowing through multiple countries. Here are some example queries to explore this enhanced dataset using both the `cypher-shell` command-line interface and the Neo4j Browser.

### Example Queries

#### 1. List all rivers and the countries they flow through

**Cypher Query:**
```cypher
MATCH (r:River)-[:FLOWS_THROUGH]->(c:Country) RETURN r.name AS River, collect(c.name) AS Countries;
```

**Cypher-Shell Command:**
```bash
cypher-shell -u neo4j -p test -a bolt://localhost:7687 "MATCH (r:River)-[:FLOWS_THROUGH]->(c:Country) RETURN r.name AS River, collect(c.name) AS Countries;"
```

**Web UI Instructions:**
- Enter the query in the query editor and click "Run" to view the rivers and the list of countries they flow through.

#### 2. Find all countries that belong to multiple continents

**Cypher Query:**
```cypher
MATCH (c:Country)-[:LOCATED_IN]->(cont:Continent)
WITH c, count(cont) AS numContinents
WHERE numContinents > 1
RETURN c.name AS Country, numContinents;
```

**Cypher-Shell Command:**
```bash
cypher-shell -u neo4j -p test -a bolt://localhost:7687 "MATCH (c:Country)-[:LOCATED_IN]->(cont:Continent) WITH c, count(cont) AS numContinents WHERE numContinents > 1 RETURN c.name AS Country, numContinents;"
```

**Web UI Instructions:**
- Execute the query to find countries located in more than one continent, highlighting the complexity of geopolitical relationships.

#### 3. Visualize the entire graph of a continent, including its countries and cities

**Cypher Query:**
```cypher
MATCH path = (cont:Continent {name: 'Asia'})<-[:LOCATED_IN]-(country:Country)-[:BELONGS_TO]->(city:City)
RETURN path;
```

**Cypher-Shell Command:**
```bash
cypher-shell -u neo4j -p test -a bolt://localhost:7687 "MATCH path = (cont:Continent {name: 'Asia'})<-[:LOCATED_IN]-(country:Country)-[:BELONGS_TO]->(city:City) RETURN path;"
```

**Web UI Instructions:**
- Run this query in the Neo4j Browser to visualize how cities and countries are connected within the continent of Asia.

#### 4. Query to find the longest rivers and the continents they flow through

**Cypher Query:**
```cypher
MATCH (r:River)-[:FLOWS_THROUGH]->(c:Country)-[:LOCATED_IN]->(cont:Continent)
RETURN r.name AS River, r.length AS Length, collect(DISTINCT cont.name) AS Continents
ORDER BY r.length DESC LIMIT 3;
```

**Cypher-Shell Command:**
```bash
cypher-shell -u neo4j -p test -a bolt://localhost:7687 "MATCH (r:River)-[:FLOWS_THROUGH]->(c:Country)-[:LOCATED_IN]->(cont:Continent) RETURN r.name AS River, r.length AS Length, collect(DISTINCT cont.name) AS Continents ORDER BY r.length DESC LIMIT 3;"
```

**Web UI Instructions:**
- Useful for seeing which rivers are the longest and across which continents they span, using the Neo4j Browser for a graphical view.

#### 5. Explore the relationship between cities and rivers through their countries

**Cypher Query:**
```cypher
MATCH (city:City)-[:BELONGS_TO]->(country:Country)<-[:FLOWS_THROUGH]-(river:River)
RETURN city.name AS City, country.name AS Country, river.name AS River;
```

**Cypher-Shell Command:**
```bash
cypher-shell -u neo4j -p test -a bolt://localhost:7687 "MATCH (city:City)-[:BELONGS_TO]->(country:Country)<-[:FLOWS_THROUGH]-(river:River) RETURN city.name AS City, country.name AS Country, river.name AS River;"
```

**Web UI Instructions:**
- This query helps to understand how cities are connected to rivers through their country association, providing insights into geographical and ecological relationships.

### Summary of Instructions for Neo4j Browser

- **Access**: Open the Neo4j Browser at [http://localhost:7474](http://localhost:7474).
- **Query Entry**: Type or paste the Cypher queries into the query editor.
- **Execution**: Click "Run" to execute the queries and view the results graphically or as a table.

These queries and instructions should help you effectively explore and visualize the relationships and data structures within your enhanced Neo4j dataset. If you need more queries or different types of analysis, let me know!
