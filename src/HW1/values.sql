-- заполнение из csv

COPY driverLicense (Number, Series)
    FROM '/src/HW1/driverLicense.csv'
    DELIMITER ','
    CSV HEADER;

COPY passport (Number, Series, WhenIssued, IssuedBy)
    FROM '/src/HW1/passport.csv'
    DELIMITER ','
    CSV HEADER;

COPY address (City, Street, BuildingNumber)
    FROM '/src/HW1/address.csv'
    DELIMITER ','
    CSV HEADER;

COPY fullName (FirstName, LastName, MiddleName)
    FROM '/src/HW1/fullName.csv'
    DELIMITER ','
    CSV HEADER;

COPY description (EngineCapacity, AutoTransmission, FourWD)
    FROM '/src/HW1/description.csv'
    DELIMITER ','
    CSV HEADER;

COPY mainCarInfo(Producer, Model)
    FROM '/src/HW1/maincarinfo.csv'
    DELIMITER ','
    CSV HEADER;

COPY tariff (TariffName,MinutePayment,ParkingPayment)
    FROM '/src/HW1/tariff.csv'
    DELIMITER ','
    CSV HEADER;

COPY transaction (TransactionDate, Price, Status)
    FROM '/src/HW1/transaction.csv'
    DELIMITER ','
    CSV HEADER;

-- заполнение insert`ом

INSERT INTO park (ParkName, ManagerFullNameId, AddressId, PhoneNumber)
VALUES
    ('City Park', 1, 2, '9876543210'),
    ('National Park', 2, 3, '5555555555'),
    ('Community Park', NULL, 4, '1111111111');

INSERT INTO car (MainInfoCarId, Number, Region, TariffId, ParkId, DescriptionId)
VALUES
    (1, 'DEF456', '154', 1, 1, 1),
    (2, 'DEF454', '154', 1, 1, 2),
    (2, 'GHI789', '54', 1, 1, 3),
    (2, 'JKL012', '54', 1, 1, 4),
    (2, 'MNO345', '154', 2, 1, 5),
    (2, 'PQR678', '54', 3, 1, 6),
    (3, 'STU901', '54', 4, 1, 7),
    (3, 'VWX234', '154', 5, 1, 8),
    (3, 'YZA567', '154', 6, 2, 9),
    (6, 'BCD890', '154', 1, 2, 10),
    (8, 'EFG123', '154', 2, 2, 11),
    (9, 'HIJ456', '54', 3, 3, 12),
    (10, 'KLM789', '154', 3, 3, 13),
    (11, 'NOP012', '54', 4, 3, 14),
    (12, 'QRS345', '54', 2, 3, 15);

INSERT INTO client (FullNameId, Birthday, PhoneNumber, Email, PassportID, DriverLicenseId, AddressID)
VALUES
    (1, '1991-02-02', '2345678901', 'example2@example.com', 1, 1, 2),
    (2, '1992-03-03', '3456789012', 'example3@example.com', 2, 2, 3),
    (3, '1993-04-04', '4567890123', 'example4@example.com', 3, 3, 4),
    (4, '1994-05-05', '5678901234', 'example5@example.com', 4, 4, 5),
    (5, '1995-06-06', '6789012345', 'example6@example.com', 5, 5, 6),
    (6, '1996-07-07', '7890123456', 'example7@example.com', 6, 6, 7),
    (7, '1997-08-08', '8901234567', 'example8@example.com', 7, 7, 8),
    (8, '1998-09-09', '9012345678', 'example9@example.com', 8, 8, 9),
    (9, '1999-10-10', '0123456789', 'example10@example.com', 9, 9, 10),
    (10, '2000-11-11', '1234567890', 'example11@example.com', 10, 10, 11),
    (11, '2001-12-12', '4567876543', 'example12@example.com', 11, 11, 12),
    (12, '2002-01-01', '3456876546', 'example13@example.com', 12, 12, 13),
    (13, '2003-02-02', '5673456545', 'example14@example.com', 13, 13, 14),
    (14, '2004-03-03', '4564567543', 'example15@example.com', 14, 14, 15),
    (14, '1991-02-02', '5676567876', 'example2@example.com', 15, 15, 15);

INSERT INTO rental (ClientId, CarId, StartRent, EndRent, TransactionId)
VALUES
    (1, 1, '2024-03-01', '2024-03-05', 1),
    (2, 2, '2023-02-01', '2023-02-05', 2),
    (3, 3, '2023-03-01', '2023-03-05', 3),
    (4, 4, '2023-04-01', '2023-04-05', 4),
    (5, 5, '2023-05-01', '2023-05-05', 5),
    (6, 6, '2023-06-01', '2023-06-05', 6),
    (7, 7, '2023-07-01', '2023-07-05', 7),
    (8, 8, '2023-08-01', '2023-08-05', 8),
    (9, 9, '2023-09-01', '2023-09-05', 9),
    (10, 10, '2023-10-01', '2023-10-05', 10),
    (11, 11, '2023-11-01', '2023-11-05', 11),
    (12, 12, '2023-12-01', '2023-12-05', 12),
    (13, 13, '2024-01-01', '2024-01-05', 13),
    (14, 14, '2024-02-01', '2024-02-05', 14),
    (14, 13, '2024-02-02', '2024-02-02', 15);



