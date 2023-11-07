CREATE TABLE driverLicense
(
    Id SERIAL PRIMARY KEY,
    Number char(6) not null CHECK (LENGTH(Number) = 6),
    Series char(4) not null CHECK (LENGTH(Series) = 4)
);
CREATE UNIQUE INDEX idx_driverLicense_number_series ON driverLicense (Number, Series);

CREATE TABLE passport
(
    Id SERIAL PRIMARY KEY,
    Number char(6) not null CHECK (LENGTH(Number) = 6),
    Series char(4) not null CHECK (LENGTH(Series) = 4),
    WhenIssued date not null,
    IssuedBy varchar not null
);
CREATE UNIQUE INDEX idx_passport_number_series ON passport (Number, Series);

CREATE TABLE address
(
    Id SERIAL PRIMARY KEY,
    City varchar not null,
    Street varchar not null,
    BuildingNumber varchar not null
);
CREATE INDEX idx_address_street_building ON address (Street, BuildingNumber);
ALTER TABLE address
ADD CONSTRAINT unique_address
UNIQUE (City, Street, BuildingNumber);

CREATE TABLE fullName
(
    Id SERIAL PRIMARY KEY,
    FirstName varchar not null,
    LastName varchar not null,
    MiddleName varchar not null
);
ALTER TABLE fullName
ADD CONSTRAINT unique_fullName
UNIQUE (FirstName, LastName, MiddleName);


CREATE TABLE description
(
    Id SERIAL PRIMARY KEY,
    EngineCapacity float not null,
    AutoTransmission bool not null,
    FourWD bool not null
);
ALTER TABLE description
ADD CONSTRAINT unique_description
UNIQUE (EngineCapacity, AutoTransmission, FourWD);

CREATE TABLE mainCarInfo
(
    Id SERIAL PRIMARY KEY,
    Producer varchar not null,
    Model varchar not null
);
ALTER TABLE mainCarInfo
ADD CONSTRAINT unique_mainCarInfo
UNIQUE (Producer, Model);

CREATE TABLE tariff
(
    Id SERIAL PRIMARY KEY,
    TariffName varchar not null,
    MinutePayment float not null,
    ParkingPayment float not null
);
ALTER TABLE tariff
ADD CONSTRAINT unique_tariff
UNIQUE (TariffName, MinutePayment, ParkingPayment);

CREATE TABLE park
(
    Id SERIAL PRIMARY KEY,
    ParkName varchar not null,
    ManagerFullNameId integer,
    AddressId integer not null,
    PhoneNumber char(10) not null CHECK (LENGTH(PhoneNumber) = 10),

    FOREIGN KEY(ManagerFullNameId) REFERENCES fullName(Id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(AddressId) REFERENCES address(Id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (AddressId)
);
ALTER TABLE park
ADD CONSTRAINT unique_park
UNIQUE (ParkName, ManagerFullNameId, AddressId, PhoneNumber);

CREATE TABLE car
(
    Id SERIAL PRIMARY KEY,
    MainInfoCarId integer not null,
    Number char(6) not null CHECK (LENGTH(Number) = 6),
    Region varchar not null,
    TariffId integer not null,
    ParkId integer not null,
    DescriptionId integer not null,

    FOREIGN KEY(MainInfoCarId) REFERENCES mainCarInfo(Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(TariffId) REFERENCES tariff(Id) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY(ParkId) REFERENCES park(Id) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY(DescriptionId) REFERENCES description(Id) ON DELETE NO ACTION ON UPDATE CASCADE,
    UNIQUE (DescriptionId)
);
CREATE UNIQUE INDEX idx_car_number_region ON car (Number, Region);

CREATE TABLE client
(
    Id SERIAL PRIMARY KEY,
    FullNameId integer not null,
    Birthday date not null,
    PhoneNumber char(10) not null CHECK (LENGTH(PhoneNumber) = 10),
    Email varchar not null,
    PassportID integer not null,
    DriverLicenseId integer not null,
    AddressID integer not null,

    UNIQUE (PhoneNumber),
    FOREIGN KEY(FullNameId) REFERENCES fullName(Id) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY(PassportID) REFERENCES passport(Id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (PassportID),
    FOREIGN KEY(DriverLicenseId) REFERENCES driverLicense(Id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (DriverLicenseId),
    FOREIGN KEY(AddressID) REFERENCES address(Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX idx_client_fullname_phone ON client (FullNameId, PhoneNumber);
ALTER TABLE client
ADD CONSTRAINT unique_client
UNIQUE (FullNameId, Birthday);

CREATE TYPE transaction_status AS ENUM ('waiting', 'active', 'completed', 'cancelled', 'expired', 'error');
CREATE TABLE transaction
(
    Id SERIAL PRIMARY KEY,
    TransactionDate date not null,
    Price float not null,
    Status  transaction_status not null
);
ALTER TABLE transaction
ADD CONSTRAINT unique_transaction
UNIQUE (TransactionDate, Price, Status);

CREATE TABLE rental
(
    Id SERIAL PRIMARY KEY,
    ClientId integer not null,
    CarId integer not null ,
    StartRent date not null,
    EndRent date,
    TransactionId integer not null,

    FOREIGN KEY(ClientId) REFERENCES client(Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(CarId) REFERENCES car(Id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(TransactionId) REFERENCES transaction(Id) ON DELETE NO ACTION ON UPDATE CASCADE,
    UNIQUE (TransactionId)
);
ALTER TABLE rental
ADD CONSTRAINT unique_rental
UNIQUE (ClientId, CarId, StartRent,EndRent,TransactionId);

