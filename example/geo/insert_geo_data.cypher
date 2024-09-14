// Creating Continents
CREATE (:Continent {name: 'Africa'});
CREATE (:Continent {name: 'Asia'});
CREATE (:Continent {name: 'Europe'});

// Creating Countries
CREATE (:Country {name: 'Kenya', continent: 'Africa'});
CREATE (:Country {name: 'Japan', continent: 'Asia'});
CREATE (:Country {name: 'Germany', continent: 'Europe'});

// Creating Cities
CREATE (:City {name: 'Nairobi', country: 'Kenya'});
CREATE (:City {name: 'Tokyo', country: 'Japan'});
CREATE (:City {name: 'Berlin', country: 'Germany'});

// Creating Rivers
CREATE (:River {name: 'Nile', length: 6650});
CREATE (:River {name: 'Amazon', length: 6400});
CREATE (:River {name: 'Yangtze', length: 6300});

