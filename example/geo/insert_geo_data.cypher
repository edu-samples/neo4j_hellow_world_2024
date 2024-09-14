// Creating Continents
CREATE (:Continent {name: 'Africa'});
CREATE (:Continent {name: 'Asia'});
CREATE (:Continent {name: 'Europe'});
CREATE (:Continent {name: 'South America'});
CREATE (:Continent {name: 'North America'});

// Creating Countries
CREATE (:Country {name: 'Kenya', population: 53700000});
CREATE (:Country {name: 'Japan', population: 125800000});
CREATE (:Country {name: 'Germany', population: 83200000});
CREATE (:Country {name: 'Egypt', population: 104300000});
CREATE (:Country {name: 'China', population: 1439300000});
CREATE (:Country {name: 'Brazil', population: 212600000});
CREATE (:Country {name: 'United States', population: 331000000});

// Creating Cities
CREATE (:City {name: 'Nairobi', population: 4397073});
CREATE (:City {name: 'Tokyo', population: 37393128});
CREATE (:City {name: 'Berlin', population: 3645000});
CREATE (:City {name: 'Cairo', population: 20901000});
CREATE (:City {name: 'Shanghai', population: 27058000});
CREATE (:City {name: 'São Paulo', population: 22043028});
CREATE (:City {name: 'New York City', population: 8804190});

// Creating Rivers
CREATE (:River {name: 'Nile', length: 6650});
CREATE (:River {name: 'Amazon', length: 6400});
CREATE (:River {name: 'Yangtze', length: 6300});
CREATE (:River {name: 'Mississippi', length: 3766});

// Connecting Countries to Continents
MATCH (c:Country {name: 'Kenya'}), (cont:Continent {name: 'Africa'})
CREATE (c)-[:LOCATED_IN]->(cont);
MATCH (c:Country {name: 'Japan'}), (cont:Continent {name: 'Asia'})
CREATE (c)-[:LOCATED_IN]->(cont);
MATCH (c:Country {name: 'Germany'}), (cont:Continent {name: 'Europe'})
CREATE (c)-[:LOCATED_IN]->(cont);
MATCH (c:Country {name: 'Egypt'}), (cont:Continent {name: 'Africa'})
CREATE (c)-[:LOCATED_IN]->(cont);
MATCH (c:Country {name: 'China'}), (cont:Continent {name: 'Asia'})
CREATE (c)-[:LOCATED_IN]->(cont);
MATCH (c:Country {name: 'Brazil'}), (cont:Continent {name: 'South America'})
CREATE (c)-[:LOCATED_IN]->(cont);
MATCH (c:Country {name: 'United States'}), (cont:Continent {name: 'North America'})
CREATE (c)-[:LOCATED_IN]->(cont);

// Connecting Cities to Countries
MATCH (city:City {name: 'Nairobi'}), (country:Country {name: 'Kenya'})
CREATE (city)-[:BELONGS_TO]->(country);
MATCH (city:City {name: 'Tokyo'}), (country:Country {name: 'Japan'})
CREATE (city)-[:BELONGS_TO]->(country);
MATCH (city:City {name: 'Berlin'}), (country:Country {name: 'Germany'})
CREATE (city)-[:BELONGS_TO]->(country);
MATCH (city:City {name: 'Cairo'}), (country:Country {name: 'Egypt'})
CREATE (city)-[:BELONGS_TO]->(country);
MATCH (city:City {name: 'Shanghai'}), (country:Country {name: 'China'})
CREATE (city)-[:BELONGS_TO]->(country);
MATCH (city:City {name: 'São Paulo'}), (country:Country {name: 'Brazil'})
CREATE (city)-[:BELONGS_TO]->(country);
MATCH (city:City {name: 'New York City'}), (country:Country {name: 'United States'})
CREATE (city)-[:BELONGS_TO]->(country);

// Connecting Rivers to Countries
MATCH (r:River {name: 'Nile'}), (c:Country {name: 'Egypt'})
CREATE (r)-[:FLOWS_THROUGH]->(c);
MATCH (r:River {name: 'Amazon'}), (c:Country {name: 'Brazil'})
CREATE (r)-[:FLOWS_THROUGH]->(c);
MATCH (r:River {name: 'Yangtze'}), (c:Country {name: 'China'})
CREATE (r)-[:FLOWS_THROUGH]->(c);
MATCH (r:River {name: 'Mississippi'}), (c:Country {name: 'United States'})
CREATE (r)-[:FLOWS_THROUGH]->(c);
