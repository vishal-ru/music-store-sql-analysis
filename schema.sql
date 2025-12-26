CREATE TABLE artist (
    artistid INT PRIMARY KEY,
    name VARCHAR(255)
);
CREATE TABLE album (
    albumid INT PRIMARY KEY,
    title VARCHAR(255),
    artistid INT REFERENCES artist(artistid)
);
CREATE TABLE genre (
    genreid INT PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE track (
    trackid INT PRIMARY KEY,
    name VARCHAR(255),
    albumid INT REFERENCES album(albumid),
    mediatypeid INT,
    genreid INT REFERENCES genre(genreid),
    composer VARCHAR(255),
    milliseconds INT,
    bytes BIGINT,
    unitprice NUMERIC(10,2)
);
CREATE TABLE customer (
    customerid INT PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    company VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postalcode VARCHAR(20),
    phone VARCHAR(50),
    fax VARCHAR(50),
    email VARCHAR(255),
    supportrepid INT
);
CREATE TABLE invoice (
    invoiceid INT PRIMARY KEY,
    customerid INT REFERENCES customer(customerid),
    invoicedate TIMESTAMP,
    billingaddress VARCHAR(255),
    billingcity VARCHAR(100),
    billingstate VARCHAR(100),
    billingcountry VARCHAR(100),
    billingpostalcode VARCHAR(20),
    total NUMERIC(10,2)
);
CREATE TABLE invoice_line (
    invoicelineid INT PRIMARY KEY,
    invoiceid INT REFERENCES invoice(invoiceid),
    trackid INT REFERENCES track(trackid),
    unitprice NUMERIC(10,2),
    quantity INT
);
CREATE TABLE employee (
    employeeid INT PRIMARY KEY,
    lastname VARCHAR(100),
    firstname VARCHAR(100),
    title VARCHAR(100),
    reportsto INT,
    birthdate TEXT,
    hiredate TEXT,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    postalcode VARCHAR(20),
    phone VARCHAR(50),
    fax VARCHAR(50),
    levels TEXT
    email VARCHAR(255)
);
CREATE TABLE media_type (
    mediatypeid INT,
    name TEXT
);
CREATE TABLE playlist (
    playlistid INT,
    name TEXT
);
CREATE TABLE playlist_track (
    playlistid INT,
    trackid INT
);

