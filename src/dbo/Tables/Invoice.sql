CREATE TABLE [inv].[Invoice]
(    
    [Id]                     UNIQUEIDENTIFIER    NOT NULL PRIMARY KEY DEFAULT NEWID(),
    [CustomerId]             UNIQUEIDENTIFIER    NOT NULL DEFAULT '',
    [InvoicingProfileId]     UNIQUEIDENTIFIER    NOT NULL DEFAULT '',
    [SubscriptionId]         UNIQUEIDENTIFIER    NOT NULL DEFAULT '',
    [Number]                 NVARCHAR(25)        NOT NULL DEFAULT '',
    [Status]                 INT                 NOT NULL DEFAULT 0,
    [InvoiceCreatedTime]     DATETIME            NOT NULL DEFAULT GETDATE(),

    [IsDeleted]              BIT                 NOT NULL DEFAULT 0,
    [CreatedTime]            DATETIME            NOT NULL DEFAULT GETDATE(),
    [CreatedBy]              NVARCHAR(25)        NOT NULL DEFAULT '',
    [UpdatedTime]            DATETIME            NOT NULL DEFAULT GETDATE(),
    [UpdatedBy]              NVARCHAR(25)        NOT NULL DEFAULT '',

    CONSTRAINT [FK_inv.Invoice.CustomerId]            FOREIGN KEY  ([CustomerId]) REFERENCES [inv].[Customer] (Id),
    CONSTRAINT [FK_inv.Invoice.InvoicingProfileId]    FOREIGN KEY  ([InvoicingProfileId]) REFERENCES [inv].[InvoicingProfile] (Id),
);
GO;

CREATE INDEX [IX_inv.Invoice.IsDeleted] on [inv].[Invoice] (IsDeleted);