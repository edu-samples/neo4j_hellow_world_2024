LOAD CSV WITH HEADERS FROM 'file:///continents.csv' AS row
CREATE (:Continent {name: row.continent});

LOAD CSV WITH HEADERS FROM 'file:///countries.csv' AS row
MATCH (continent:Continent {name: row.continent})
CREATE (:Country {name: row.country})-[:IN]->(continent);

LOAD CSV WITH HEADERS FROM 'file:///cities.csv' AS row
MATCH (country:Country {name: row.country})
CREATE (:City {name: row.city})-[:IN]->(country);

LOAD CSV WITH HEADERS FROM 'file:///rivers.csv' AS row
MATCH (country:Country {name: row.country})
CREATE (:River {name: row.river})-[:IN]->(country);
