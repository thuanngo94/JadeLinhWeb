CREATE TABLE [dbo].[Table]
(
	[CustomerId] INT NOT NULL PRIMARY KEY, 
    [CustomerName] NVARCHAR(MAX) NULL, 
    [CustomerEmail] NVARCHAR(MAX) NULL, 
    [CustomerPhoneNumber] VARCHAR(50) NULL, 
    [CustomerPassword] NCHAR(10) NULL
)
