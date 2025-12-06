CREATE TABLE country
(Name VARCHAR(50) NOT NULL UNIQUE,
 Code VARCHAR(4) CONSTRAINT countryKey PRIMARY KEY,
 Capital VARCHAR(50),
 province VARCHAR(50),
 Area DECIMAL CONSTRAINT countryArea
   CHECK (Area >= 0),
 population DECIMAL CONSTRAINT countryPop
   CHECK (population >= 0));

CREATE TABLE city
(Name VARCHAR(50),
 country VARCHAR(4),
 province VARCHAR(50),
 population DECIMAL CONSTRAINT cityPop
   CHECK (population >= 0),
 Latitude DECIMAL CONSTRAINT cityLat
   CHECK ((Latitude >= -90) AND (Latitude <= 90)) ,
 Longitude DECIMAL CONSTRAINT cityLon
   CHECK ((Longitude >= -180) AND (Longitude <= 180)) ,
 Elevation DECIMAL ,
 CONSTRAINT cityKey PRIMARY KEY (Name, country, province));

CREATE TABLE province
(Name VARCHAR(50) CONSTRAINT PrName NOT NULL ,
 country  VARCHAR(4) CONSTRAINT Prcountry NOT NULL ,
 population DECIMAL CONSTRAINT PrPop
   CHECK (population >= 0),
 Area DECIMAL CONSTRAINT PrAr
   CHECK (Area >= 0),
 Capital VARCHAR(50),
 CapProv VARCHAR(50),
 CONSTRAINT PrKey PRIMARY KEY (Name, country));

CREATE TABLE economy
(country VARCHAR(4) CONSTRAINT economyKey PRIMARY KEY,
 GDP DECIMAL CONSTRAINT economyGDP
   CHECK (GDP >= 0),
 Agriculture DECIMAL,
 Service DECIMAL,
 Industry DECIMAL,
 Inflation DECIMAL,
 Unemployment DECIMAL);

CREATE TABLE population
(country VARCHAR(4) CONSTRAINT PopKey PRIMARY KEY,
 population_Growth DECIMAL,
 Infant_Mortality DECIMAL);

CREATE TABLE politics
(country VARCHAR(4) CONSTRAINT politicsKey PRIMARY KEY,
 Independence DATE,
 WasDependent VARCHAR(50),
 Dependent  VARCHAR(4),
 Government VARCHAR(120));

CREATE TABLE Religion
(country VARCHAR(4),
 Name VARCHAR(50),
 Percentage DECIMAL CONSTRAINT ReligionPercent 
   CHECK ((Percentage > 0) AND (Percentage <= 100)),
 CONSTRAINT ReligionKey PRIMARY KEY (Name, country));

CREATE TABLE EthnicGroup
(country VARCHAR(4),
 Name VARCHAR(50),
 Percentage DECIMAL CONSTRAINT EthnicPercent 
   CHECK ((Percentage > 0) AND (Percentage <= 100)),
 CONSTRAINT EthnicKey PRIMARY KEY (Name, country));

CREATE TABLE language
(country VARCHAR(4),
 Name VARCHAR(50),
 Percentage DECIMAL CONSTRAINT languagePercent 
   CHECK ((Percentage > 0) AND (Percentage <= 100)),
 CONSTRAINT languageKey PRIMARY KEY (Name, country));

CREATE TABLE sublanguage
(Sublang VARCHAR(50) ,
 Suplang VARCHAR(50),
 CONSTRAINT sublanguageKey PRIMARY KEY (Sublang));

CREATE TABLE countrypops
(country VARCHAR(4),
 Year DECIMAL CONSTRAINT countryPopsYear
   CHECK (Year >= 0),
 population DECIMAL CONSTRAINT countryPopsPop
   CHECK (population >= 0),
 CONSTRAINT countryPopsKey PRIMARY KEY (country, Year));

CREATE TABLE countryothername
(country VARCHAR(4),
 othername VARCHAR(50),
 CONSTRAINT countryOthernameKey PRIMARY KEY (country, othername));

CREATE TABLE countrylocalname
(country VARCHAR(4),
 localname VARCHAR(300),
 CONSTRAINT countrylocalnameKey PRIMARY KEY (country));

CREATE TABLE provpops
(province VARCHAR(50),
 country VARCHAR(4),
 Year DECIMAL CONSTRAINT provpopsYear
   CHECK (Year >= 0),
 population DECIMAL CONSTRAINT provpopsPop
   CHECK (population >= 0),
 CONSTRAINT ProvPopKey PRIMARY KEY (country, province, Year));

CREATE TABLE provinceothername
(province VARCHAR(50),
 country VARCHAR(4),
 othername VARCHAR(50),
 CONSTRAINT ProvOthernameKey PRIMARY KEY (country, province, othername));

CREATE TABLE provincelocalname
(province VARCHAR(50),
 country VARCHAR(4),
 localname VARCHAR(300),
 CONSTRAINT ProvlocalnameKey PRIMARY KEY (country, province));

CREATE TABLE citypops
(city VARCHAR(50),
 country VARCHAR(4),
 province VARCHAR(50),
 Year DECIMAL CONSTRAINT cityPopsYear
   CHECK (Year >= 0),
 population DECIMAL CONSTRAINT cityPopsPop
   CHECK (population >= 0),
 CONSTRAINT cityPopKey PRIMARY KEY (country, province, city, Year));

CREATE TABLE cityothername
(city VARCHAR(50),
 country VARCHAR(4),
 province VARCHAR(50),
 othername VARCHAR(50),
 CONSTRAINT cityOthernameKey PRIMARY KEY (country, province, city, othername));

CREATE TABLE citylocalname
(city VARCHAR(50),
 country VARCHAR(4),
 province VARCHAR(50),
 localname VARCHAR(300),
 CONSTRAINT citylocalnameKey PRIMARY KEY (country, province, city));

CREATE TABLE continent
(Name VARCHAR(20) CONSTRAINT continentKey PRIMARY KEY,
 Area DECIMAL(10));

CREATE TABLE borders
(country1 VARCHAR(4),
 country2 VARCHAR(4),
 Length DECIMAL 
   CHECK (Length > 0),
 CONSTRAINT BorderKey PRIMARY KEY (country1,country2) );

CREATE TABLE encompasses
(country VARCHAR(4) NOT NULL,
 continent VARCHAR(20) NOT NULL,
 Percentage DECIMAL,
   CHECK ((Percentage > 0) AND (Percentage <= 100)),
 CONSTRAINT EncompassesKey PRIMARY KEY (country,continent));

CREATE TABLE organization
(Abbreviation VARCHAR(12) Constraint OrgKey PRIMARY KEY,
 Name VARCHAR(100) NOT NULL,
 city VARCHAR(50) ,
 country VARCHAR(4) , 
 province VARCHAR(50) ,
 Established DATE,
 CONSTRAINT OrgNameUnique UNIQUE (Name));

CREATE TABLE isMember
(country VARCHAR(4),
 organization VARCHAR(12),
 Type VARCHAR(60) DEFAULT 'member',
 CONSTRAINT MemberKey PRIMARY KEY (country,organization) );

CREATE TYPE geoCoord AS
(Latitude DECIMAL,
 Longitude DECIMAL);


CREATE TABLE mountain
(Name VARCHAR(50) CONSTRAINT mountainKey PRIMARY KEY,
 mountains VARCHAR(50),
 Elevation DECIMAL,
 Type VARCHAR(10),
 Coordinates geoCoord CONSTRAINT mountainCoord
     CHECK (((Coordinates).Latitude >= -90) AND 
            ((Coordinates).Latitude <= 90) AND
            ((Coordinates).Longitude > -180) AND
            ((Coordinates).Longitude <= 180)));

CREATE TABLE desert
(Name VARCHAR(50) CONSTRAINT desertKey PRIMARY KEY,
 Area DECIMAL,
 Coordinates geoCoord CONSTRAINT DesCoord
     CHECK (((Coordinates).Latitude >= -90) AND 
            ((Coordinates).Latitude <= 90) AND
            ((Coordinates).Longitude > -180) AND
            ((Coordinates).Longitude <= 180)));

CREATE TABLE island
(Name VARCHAR(50) CONSTRAINT islandKey PRIMARY KEY,
 islands VARCHAR(50),
 Area DECIMAL CONSTRAINT islandAr check (Area >= 0),
 Elevation DECIMAL,
 Type VARCHAR(15),
 Coordinates geoCoord CONSTRAINT islandCoord
     CHECK (((Coordinates).Latitude >= -90) AND 
            ((Coordinates).Latitude <= 90) AND
            ((Coordinates).Longitude > -180) AND
            ((Coordinates).Longitude <= 180)));

CREATE TABLE lake
(Name VARCHAR(50) CONSTRAINT lakeKey PRIMARY KEY,
 river VARCHAR(50),
 Area DECIMAL CONSTRAINT lakeAr CHECK (Area >= 0),
 Elevation DECIMAL,
 Depth DECIMAL CONSTRAINT lakeDpth CHECK (Depth >= 0),
 Height DECIMAL CONSTRAINT DamHeight CHECK (Height > 0),
 Type VARCHAR(12),
 Coordinates geoCoord CONSTRAINT lakeCoord
     CHECK (((Coordinates).Latitude >= -90) AND 
            ((Coordinates).Latitude <= 90) AND
            ((Coordinates).Longitude > -180) AND
            ((Coordinates).Longitude <= 180)));

CREATE TABLE sea
(Name VARCHAR(50) CONSTRAINT seaKey PRIMARY KEY,
 Area DECIMAL CONSTRAINT seaAr CHECK (Area >= 0),
 Depth DECIMAL CONSTRAINT seaDepth CHECK (Depth >= 0));

CREATE TABLE river
(Name VARCHAR(50) CONSTRAINT riverKey PRIMARY KEY,
 river VARCHAR(50),
 lake VARCHAR(50),
 sea VARCHAR(50),
 Length DECIMAL CONSTRAINT riverLength
   CHECK (Length >= 0),
 Area DECIMAL CONSTRAINT riverArea
   CHECK (Area >= 0),
 Source geoCoord CONSTRAINT SourceCoord
     CHECK (((Source).Latitude >= -90) AND 
            ((Source).Latitude <= 90) AND
            ((Source).Longitude > -180) AND
            ((Source).Longitude <= 180)),
 mountains VARCHAR(50),
 SourceElevation DECIMAL,
 Estuary geoCoord CONSTRAINT EstCoord
     CHECK (((Estuary).Latitude >= -90) AND 
            ((Estuary).Latitude <= 90) AND
            ((Estuary).Longitude > -180) AND
            ((Estuary).Longitude <= 180)),
 EstuaryElevation DECIMAL,
 CONSTRAINT RivFlowsInto 
     CHECK ((river IS NULL AND lake IS NULL)
            OR (river IS NULL AND sea IS NULL)
            OR (lake IS NULL AND sea is NULL)));

CREATE TABLE riverThrough
(river VARCHAR(50),
 lake  VARCHAR(50),
 CONSTRAINT RThroughKey PRIMARY KEY (river,lake) );

CREATE TABLE geo_mountain
(mountain VARCHAR(50) ,
 country VARCHAR(4) ,
 province VARCHAR(50) ,
 CONSTRAINT GmountainKey PRIMARY KEY (province,country,mountain) );

CREATE TABLE geo_desert
(desert VARCHAR(50) ,
 country VARCHAR(4) ,
 province VARCHAR(50) ,
 CONSTRAINT GdesertKey PRIMARY KEY (province, country, desert) );

CREATE TABLE geo_island
(island VARCHAR(50) , 
 country VARCHAR(4) ,
 province VARCHAR(50) ,
 CONSTRAINT GislandKey PRIMARY KEY (province, country, island) );

CREATE TABLE geo_river
(river VARCHAR(50) , 
 country VARCHAR(4) ,
 province VARCHAR(50) ,
 CONSTRAINT GriverKey PRIMARY KEY (province ,country, river) );

CREATE TABLE geo_sea
(sea VARCHAR(50) ,
 country VARCHAR(4)  ,
 province VARCHAR(50) ,
 CONSTRAINT GseaKey PRIMARY KEY (province, country, sea) );

CREATE TABLE geo_lake
(lake VARCHAR(50) ,
 country VARCHAR(4) ,
 province VARCHAR(50) ,
 CONSTRAINT GlakeKey PRIMARY KEY (province, country, lake) );

CREATE TABLE geo_Source
(river VARCHAR(50) ,
 country VARCHAR(4) ,
 province VARCHAR(50) ,
 CONSTRAINT GSourceKey PRIMARY KEY (province, country, river) );

CREATE TABLE geo_Estuary
(river VARCHAR(50) ,
 country VARCHAR(4) ,
 province VARCHAR(50) ,
 CONSTRAINT GEstuaryKey PRIMARY KEY (province, country, river) );

CREATE TABLE mergesWith
(sea1 VARCHAR(50) ,
 sea2 VARCHAR(50) ,
 CONSTRAINT MergesWithKey PRIMARY KEY (sea1, sea2) );

CREATE TABLE located
(city VARCHAR(50) ,
 province VARCHAR(50) ,
 country VARCHAR(4) ,
 river VARCHAR(50),
 lake VARCHAR(50),
 sea VARCHAR(50) );

CREATE TABLE locatedOn
(city VARCHAR(50) ,
 province VARCHAR(50) ,
 country VARCHAR(4) ,
 island VARCHAR(50) ,
 CONSTRAINT locatedOnKey PRIMARY KEY (city, province, country, island) );

CREATE TABLE islandIn
(island VARCHAR(50) ,
 sea VARCHAR(50) ,
 lake VARCHAR(50) ,
 river VARCHAR(50) );

CREATE TABLE mountainOnisland
(mountain VARCHAR(50),
 island   VARCHAR(50),
 CONSTRAINT mountainIslKey PRIMARY KEY (mountain, island) );

CREATE TABLE lakeOnisland
(lake    VARCHAR(50),
 island  VARCHAR(50),
 CONSTRAINT lakeIslKey PRIMARY KEY (lake, island) );

CREATE TABLE riverOnisland
(river   VARCHAR(50),
 island  VARCHAR(50),
 CONSTRAINT riverIslKey PRIMARY KEY (river, island) );

CREATE TABLE airport
(IATACode VARCHAR(3) PRIMARY KEY,
 Name VARCHAR(100) ,
 country VARCHAR(4) ,
 city VARCHAR(50) ,
 province VARCHAR(50) ,
 island VARCHAR(50) ,
 Latitude DECIMAL CONSTRAINT AirpLat
   CHECK ((Latitude >= -90) AND (Latitude <= 90)) ,
 Longitude DECIMAL CONSTRAINT AirpLon
   CHECK ((Longitude >= -180) AND (Longitude <= 180)) ,
 Elevation DECIMAL ,
 gmtOffset DECIMAL );