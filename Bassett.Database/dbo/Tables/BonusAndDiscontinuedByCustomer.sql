﻿CREATE TABLE [dbo].[BonusAndDiscontinuedByCustomer] (
    [company_code]                VARCHAR (3)  NOT NULL,
    [customer_number]             VARCHAR (10) NOT NULL,
    [item_number]                 VARCHAR (12) NOT NULL,
    [discontinued_effective_date] DATETIME     NULL,
    [py_01]                       INT          NULL,
    [py_02]                       INT          NULL,
    [py_03]                       INT          NULL,
    [py_04]                       INT          NULL,
    [py_05]                       INT          NULL,
    [py_06]                       INT          NULL,
    [py_07]                       INT          NULL,
    [py_08]                       INT          NULL,
    [py_09]                       INT          NULL,
    [py_10]                       INT          NULL,
    [py_11]                       INT          NULL,
    [py_12]                       INT          NULL,
    [cy_01]                       INT          NULL,
    [cy_02]                       INT          NULL,
    [cy_03]                       INT          NULL,
    [cy_04]                       INT          NULL,
    [cy_05]                       INT          NULL,
    [cy_06]                       INT          NULL,
    [cy_07]                       INT          NULL,
    [cy_08]                       INT          NULL,
    [cy_09]                       INT          NULL,
    [cy_10]                       INT          NULL,
    [cy_11]                       INT          NULL,
    [cy_12]                       INT          NULL,
    [ny_01]                       INT          NULL,
    [ny_02]                       INT          NULL,
    [ny_03]                       INT          NULL,
    [ny_04]                       INT          NULL,
    [ny_05]                       INT          NULL,
    [ny_06]                       INT          NULL,
    [ny_07]                       INT          NULL,
    [ny_08]                       INT          NULL,
    [ny_09]                       INT          NULL,
    [ny_10]                       INT          NULL,
    [ny_11]                       INT          NULL,
    [ny_12]                       INT          NULL,
    [timestamp]                   ROWVERSION   NOT NULL,
    CONSTRAINT [PK_BonusAndDiscontinuedByCustomer] PRIMARY KEY CLUSTERED ([company_code] ASC, [customer_number] ASC, [item_number] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_BonusAndDiscontinuedByCustomer_Customer] FOREIGN KEY ([company_code], [customer_number]) REFERENCES [dbo].[Customer] ([company_code], [customer_number]),
    CONSTRAINT [FK_BonusAndDiscontinuedByCustomer_Item] FOREIGN KEY ([company_code], [item_number]) REFERENCES [dbo].[Item] ([company_code], [item_number])
);

