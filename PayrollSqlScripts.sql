CREATE DATABASE JRPayroll;
GO

USE JRPayroll;
GO

CREATE TABLE Employee
(EmployeeId INT
 PRIMARY KEY IDENTITY(1, 1) NOT NULL, 
 FirstName  VARCHAR(30) NULL, 
 LastName   VARCHAR(30) NULL, 
 Phone      VARCHAR(14) NULL, 
 Zip        VARCHAR(15) NULL, 
 HireDate   DATETIME NULL,
);
GO

CREATE OR ALTER PROCEDURE SpEmployee
(@EmployeeId INT         = 0, 
 @FirstName  VARCHAR(30) = '', 
 @LastName   VARCHAR(30) = '', 
 @Phone      VARCHAR(14) = '', 
 @Zip        VARCHAR(15) = '', 
 @HireDate   DATETIME    = NULL
)
AS
    BEGIN
        IF NOT EXISTS
        (
            SELECT 'X'
            FROM Employee
            WHERE EmployeeId = @EmployeeId
        )
            BEGIN
                INSERT INTO Employee
                (FirstName, 
                 LastName, 
                 Phone, 
                 Zip, 
                 HireDate
                )
                VALUES
                (@FirstName, 
                 @LastName, 
                 @Phone, 
                 @Zip, 
                 @HireDate
                );
        END;
            ELSE
            BEGIN
                UPDATE Employee
                  SET 
                      FirstName = @FirstName, 
                      LastName = @LastName, 
                      Phone = @Phone, 
                      Zip = @Zip, 
                      HireDate = @HireDate
                WHERE EmployeeId = @EmployeeId;
        END;
    END;
GO
CREATE OR ALTER PROCEDURE SpGetEmployee(@SearchStr VARCHAR(30) = '')
AS
    BEGIN
        IF ISNULL(@SearchStr, '') != ''
            BEGIN
                SELECT Employee.EmployeeId, 
                       Employee.FirstName, 
                       Employee.LastName, 
                       Employee.Phone, 
                       Employee.Zip, 
                       Employee.HireDate
                FROM Employee
                WHERE LastName LIKE '%' + @SearchStr + '%'
                      OR Phone LIKE '%' + @SearchStr + '%'
                ORDER BY HireDate ASC;
        END;
            ELSE
            IF ISNULL(@SearchStr, '') = ''
                BEGIN
                    SELECT Employee.EmployeeId, 
                           Employee.FirstName, 
                           Employee.LastName, 
                           Employee.Phone, 
                           Employee.Zip, 
                           Employee.HireDate
                    FROM Employee
                    ORDER BY HireDate ASC;
            END;
    END;
GO

CREATE OR ALTER PROCEDURE SpGetEmployeeById(@EmployeeId INT = 0)
AS
    BEGIN
        SELECT Employee.EmployeeId, 
               Employee.FirstName, 
               Employee.LastName, 
               Employee.Phone, 
               Employee.Zip, 
               Employee.HireDate
        FROM Employee
        WHERE EmployeeId = @EmployeeId;
    END;
GO

GRANT EXECUTE ON dbo.SpEmployee TO payroll_user;
GRANT EXECUTE ON dbo.SpGetEmployeeById TO payroll_user;
GRANT EXECUTE ON dbo.SpGetEmployee TO payroll_user;

EXEC SpEmployee NULL, 'Jaime A.', 'Rivera', '(503) 730-8110', '000', '2008-02-04', 'Insert'
EXEC SpEmployee NULL, 'Alex', 'Artero', '(503) 220-8321', '754', '2012-22-01', 'Insert'
EXEC SpGetEmployee 'Rive'