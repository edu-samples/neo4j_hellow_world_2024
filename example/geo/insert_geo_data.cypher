// Add more continents
CREATE (:Continent {name: 'Oceania'});
CREATE (:Continent {name: 'Antarctica'});

// Add more countries
CREATE (:Country {name: 'Russia', population: 144100000});
CREATE (:Country {name: 'Turkey', population: 84339067});
CREATE (:Country {name: 'France', population: 67391582});
CREATE (:Country {name: 'Sudan', population: 43849260});
CREATE (:Country {name: 'Peru', population: 32971854});

// Add more cities
CREATE (:City {name: 'Moscow', population: 12506468});
CREATE (:City {name: 'Istanbul', population: 15190336});
CREATE (:City {name: 'Paris', population: 2161000});
CREATE (:City {name: 'Khartoum', population: 5274321});
CREATE (:City {name: 'Lima', population: 9674755});

// Add more rivers
CREATE (:River {name: 'Danube', length: 2850});
CREATE (:River {name: 'Congo', length: 4700});

// Connect countries to multiple continents
MATCH (c:Country {name: 'Russia'}), (e:Continent {name: 'Europe'}), (a:Continent {name: 'Asia'})
CREATE (c)-[:LOCATED_IN]->(e), (c)-[:LOCATED_IN]->(a);

MATCH (c:Country {name: 'Turkey'}), (e:Continent {name: 'Europe'}), (a:Continent {name: 'Asia'})
CREATE (c)-[:LOCATED_IN]->(e), (c)-[:LOCATED_IN]->(a);

MATCH (c:Country {name: 'France'}), (e:Continent {name: 'Europe'}), (sa:Continent {name: 'South America'})
CREATE (c)-[:LOCATED_IN]->(e), (c)-[:LOCATED_IN]->(sa);

// Connect new cities to countries
MATCH (city:City {name: 'Moscow'}), (country:Country {name: 'Russia'})
CREATE (city)-[:BELONGS_TO]->(country);
MATCH (city:City {name: 'Istanbul'}), (country:Country {name: 'Turkey'})
CREATE (city)-[:BELONGS_TO]->(country);
MATCH (city:City {name: 'Paris'}), (country:Country {name: 'France'})
CREATE (city)-[:BELONGS_TO]->(country);
MATCH (city:City {name: 'Khartoum'}), (country:Country {name: 'Sudan'})
CREATE (city)-[:BELONGS_TO]->(country);
MATCH (city:City {name: 'Lima'}), (country:Country {name: 'Peru'})
CREATE (city)-[:BELONGS_TO]->(country);

// Connect rivers to multiple countries
MATCH (r:River {name: 'Nile'}), (e:Country {name: 'Egypt'}), (s:Country {name: 'Sudan'})
CREATE (r)-[:FLOWS_THROUGH]->(e), (r)-[:FLOWS_THROUGH]->(s);

MATCH (r:River {name: 'Amazon'}), (b:Country {name: 'Brazil'}), (p:Country {name: 'Peru'})
CREATE (r)-[:FLOWS_THROUGH]->(b), (r)-[:FLOWS_THROUGH]->(p);

MATCH (r:River {name: 'Danube'}), (g:Country {name: 'Germany'})
CREATE (r)-[:FLOWS_THROUGH]->(g);

// Add more relationships for existing data
MATCH (c:Country {name: 'Egypt'}), (a:Continent {name: 'Asia'})
CREATE (c)-[:LOCATED_IN]->(a);

MATCH (c:Country {name: 'Sudan'}), (cont:Continent {name: 'Africa'})
CREATE (c)-[:LOCATED_IN]->(cont);

MATCH (c:Country {name: 'Peru'}), (cont:Continent {name: 'South America'})
CREATE (c)-[:LOCATED_IN]->(cont);
