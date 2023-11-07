CREATE VIEW park_manager_info AS
SELECT p.Id AS park_id, p.ParkName, f.FirstName, f.LastName, f.MiddleName, a.City, a.Street, a.BuildingNumber, p.PhoneNumber
FROM park p
         LEFT JOIN fullName f ON p.ManagerFullNameId = f.Id
         JOIN address a ON p.AddressId = a.Id;

CREATE VIEW client_car_info AS
SELECT c.Id AS client_id, f.FirstName, f.LastName, f.MiddleName, c.PhoneNumber,
       p.Number AS passport_number, p.Series AS passport_series,
       d.Number AS driver_license_number, d.Series AS driver_license_series,
       car.Number AS car_number, car.Region, m.Producer, m.Model
FROM client c
         JOIN fullName f ON c.FullNameId = f.Id
         JOIN passport p ON c.PassportID = p.Id
         JOIN driverLicense d ON c.DriverLicenseId = d.Id
         JOIN car ON c.Id = car.Id
         JOIN mainCarInfo m ON car.MainInfoCarId = m.Id;