/****** Object:  StoredProcedure [dbo].[InsertPerson_p]    Script Date: 11/24/2025 8:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertPerson_p]
  @FirstName   NVARCHAR(100),
  @LastName    NVARCHAR(100),
  @AddressType NVARCHAR(20),
  @AddressLine NVARCHAR(200),
  @City        NVARCHAR(100)
AS
BEGIN
  SET NOCOUNT ON;
  BEGIN TRY
    BEGIN TRAN;
    DECLARE @NewPersonID INT = NEXT VALUE FOR dbo.Persons_seq;
    INSERT INTO dbo.Persons (PersonID, FirstName, LastName)
    VALUES (@NewPersonID, @FirstName, @LastName);
    INSERT INTO dbo.Address (PersonID, AddressType, AddressLine, City)
    VALUES (@NewPersonID, @AddressType, @AddressLine, @City);
    COMMIT TRAN;
    SELECT @NewPersonID AS PersonID;
  END TRY
  BEGIN CATCH
    IF XACT_STATE() <> 0 ROLLBACK TRAN;
    DECLARE @ErrMsg NVARCHAR(4000) = ERROR_MESSAGE();
    RAISERROR('InsertPerson_p failed: %s', 16, 1, @ErrMsg);
  END CATCH;
END;
