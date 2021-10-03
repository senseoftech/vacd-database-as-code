CREATE TABLE [inv].[InvoicingProfile]
(    
    [Id]                     UNIQUEIDENTIFIER    NOT NULL PRIMARY KEY DEFAULT NEWID(),
    [InternalReference]      NVARCHAR(100)       NOT NULL DEFAULT '',
    [Firstname]              NVARCHAR(100)       NULL,
    [Lastname]               NVARCHAR(100)       NULL,
    [CompanyName]            NVARCHAR(100)       NULL,
    [Mail]                   NVARCHAR(255)       NULL,
    [MobileNumber]           NVARCHAR(20)        NULL,
    [FaxNumber]              NVARCHAR(20)        NULL,
    [PhoneNumber]            NVARCHAR(20)        NULL,
    [VatNumber]              NVARCHAR(100)       NULL,
    [AddressLine1]           NVARCHAR(255)       NOT NULL DEFAULT '',
    [AddressLine2]           NVARCHAR(255)       NULL,
    [PostCode]               NVARCHAR(10)        NOT NULL DEFAULT '',
    [City]                   NVARCHAR(50)        NOT NULL DEFAULT '',
    [State]                  NVARCHAR(50)        NOT NULL DEFAULT '',
    [Country]                NVARCHAR(50)        NOT NULL DEFAULT '',

    [Prefix]                 NVARCHAR(20)        NOT NULL DEFAULT '',
    [LastQuoteNumber]        INT                 NOT NULL DEFAULT 0,
    [LastProformaNumber]     INT                 NOT NULL DEFAULT 0,
    [LastInvoiceNumber]      INT                 NOT NULL DEFAULT 0,

    [IsDeleted]              BIT                 NOT NULL DEFAULT 0,
    [CreatedTime]            DATETIME            NOT NULL DEFAULT GETDATE(),
    [CreatedBy]              NVARCHAR(25)        NOT NULL DEFAULT '',
    [UpdatedTime]            DATETIME            NOT NULL DEFAULT GETDATE(),
    [UpdatedBy]              NVARCHAR(25)        NOT NULL DEFAULT ''
);
GO;

CREATE INDEX [IX_inv.InvoicingProfile.IsDeleted] on [inv].[InvoicingProfile] (IsDeleted);