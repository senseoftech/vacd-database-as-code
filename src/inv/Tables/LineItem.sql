CREATE TABLE [inv].[LineItem](
    
    [Id]                     UNIQUEIDENTIFIER    NOT NULL PRIMARY KEY DEFAULT NEWID(),
    [Reference]              NVARCHAR(25)        NOT NULL, 
    [InternalReference]      NVARCHAR(100)       NULL, 
    [Name]                   NVARCHAR(50)        NULL, 
    [Description]            NVARCHAR(255)       NULL, 
    [Quantity]               DECIMAL(10,3)       NOT NULL DEFAULT 0,
    [UnitPrice]              DECIMAL(10,3)       NOT NULL DEFAULT 0,
    [Vat]                    DECIMAL(10,3)       NOT NULL DEFAULT 0,
    [FixedDiscount]          DECIMAL(10,3)       NOT NULL DEFAULT 0,
    [PercentDiscount]        DECIMAL(10,3)       NOT NULL DEFAULT 0,

    [InvoiceId]              UNIQUEIDENTIFIER    NOT NULL,

    [IsDeleted]              BIT                 NOT NULL DEFAULT 0,
    [CreatedTime]            DATETIME            NOT NULL DEFAULT GETDATE(),
    [CreatedBy]              NVARCHAR(25)        NOT NULL DEFAULT '',
    [UpdatedTime]            DATETIME            NOT NULL DEFAULT GETDATE(),
    [UpdatedBy]              NVARCHAR(25)        NOT NULL DEFAULT '',

    CONSTRAINT [FK_inv.LineItem.InvoiceId]       FOREIGN KEY  ([InvoiceId]) REFERENCES [inv].[Invoice] (Id)

);
GO;

CREATE INDEX [IX_inv.LineItem.IsDeleted] on [inv].[LineItem] (IsDeleted);