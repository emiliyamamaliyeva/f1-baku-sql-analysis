-- ============================================
-- F1 Baku SQL Analysis — Database Schema
-- PostgreSQL
-- ============================================
-- Tables are created in an order that respects dependencies
-- (independent tables first, then tables that reference them via FOREIGN KEY)

-- 1. Circuits (does not depend on other tables)
CREATE TABLE circuits(
	circuitid INT NOT NULL PRIMARY KEY,
	circuitRef VARCHAR(50) NOT NULL,
	name TEXT NOT NULL,
	location TEXT NOT NULL,
	country VARCHAR(50) NOT NULL,
	lat NUMERIC NOT NULL,
	lng NUMERIC NOT NULL,
	alt INT,
	url TEXT NOT NULL
);

-- 2. Drivers (does not depend on other tables)
CREATE TABLE drivers(
	driverId INT NOT NULL PRIMARY KEY,
	driverRef TEXT NOT NULL,
	number INT,
	code VARCHAR(10),
	forename VARCHAR(50) NOT NULL,
	surname VARCHAR(50) NOT NULL,
	dob DATE NOT NULL,
	nationality VARCHAR(50) NOT NULL,
	url TEXT NOT NULL
);

-- 3. Constructors/teams (does not depend on other tables)
CREATE TABLE constructors(
	constructorId INT NOT NULL PRIMARY KEY,
	constructorRef TEXT NOT NULL,
	name TEXT NOT NULL,
	nationality VARCHAR(50) NOT NULL,
	url TEXT NOT NULL
);

-- 4. Races (references circuits)
CREATE TABLE races(
	raceId INT NOT NULL PRIMARY KEY,
	year INT NOT NULL,
	round INT NOT NULL,
	circuitId INT NOT NULL REFERENCES circuits(circuitId),
	name TEXT NOT NULL,
	date DATE NOT NULL,
	time TIME,
	url TEXT NOT NULL,
	fp1_date DATE,
	fp1_time TIME,
	fp2_date DATE,
	fp2_time TIME,
	fp3_date DATE,
	fp3_time TIME,
	quali_date DATE,
	quali_time TIME,
	sprint_date DATE,
	sprint_time TIME
);

-- 5. Race results (references races, drivers, constructors)
CREATE TABLE results(
	resultId INT NOT NULL PRIMARY KEY,
	raceId INT NOT NULL REFERENCES races(raceId),
	driverId INT NOT NULL REFERENCES drivers(driverId),
	constructorId INT NOT NULL REFERENCES constructors(constructorId),
	number INT,
	grid INT,
	position INT,
	positionText TEXT NOT NULL,
	positionOrder INT NOT NULL,
	points NUMERIC NOT NULL,
	laps INT NOT NULL,
	time TEXT,
	milliseconds INT,
	fastestLap INT,
	rank INT,
	fastestLapTime TEXT,
	fastestLapSpeed NUMERIC,
	statusId INT NOT NULL	
);
