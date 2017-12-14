
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/14/2017 22:35:06
-- Generated from EDMX file: C:\Users\balaz\Desktop\WAF\FoodOrderSystem\FoodOrderSystem\Models\FoodOrderModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [FoodOrderDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_FoodCategoryToFood]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Food] DROP CONSTRAINT [FK_FoodCategoryToFood];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderItemToFood]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItem] DROP CONSTRAINT [FK_OrderItemToFood];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderItemToOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItem] DROP CONSTRAINT [FK_OrderItemToOrder];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Food]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Food];
GO
IF OBJECT_ID(N'[dbo].[FoodCategory]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FoodCategory];
GO
IF OBJECT_ID(N'[dbo].[Order]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order];
GO
IF OBJECT_ID(N'[dbo].[OrderItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderItem];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Food'
CREATE TABLE [dbo].[Food] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [FoodCategoryId] int  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Hot] bit  NOT NULL,
    [Vega] bit  NOT NULL,
    [Price] int  NOT NULL
);
GO

-- Creating table 'FoodCategory'
CREATE TABLE [dbo].[FoodCategory] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Order'
CREATE TABLE [dbo].[Order] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Postcode] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Completed] bit  NOT NULL
);
GO

-- Creating table 'OrderItem'
CREATE TABLE [dbo].[OrderItem] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Quantity] int  NOT NULL,
    [FoodId] int  NOT NULL,
    [OrderId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Food'
ALTER TABLE [dbo].[Food]
ADD CONSTRAINT [PK_Food]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FoodCategory'
ALTER TABLE [dbo].[FoodCategory]
ADD CONSTRAINT [PK_FoodCategory]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Order'
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT [PK_Order]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [PK_OrderItem]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [FoodCategoryId] in table 'Food'
ALTER TABLE [dbo].[Food]
ADD CONSTRAINT [FK_FoodCategoryToFood]
    FOREIGN KEY ([FoodCategoryId])
    REFERENCES [dbo].[FoodCategory]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FoodCategoryToFood'
CREATE INDEX [IX_FK_FoodCategoryToFood]
ON [dbo].[Food]
    ([FoodCategoryId]);
GO

-- Creating foreign key on [FoodId] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [FK_OrderItemToFood]
    FOREIGN KEY ([FoodId])
    REFERENCES [dbo].[Food]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderItemToFood'
CREATE INDEX [IX_FK_OrderItemToFood]
ON [dbo].[OrderItem]
    ([FoodId]);
GO

-- Creating foreign key on [OrderId] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [FK_OrderItemToOrder]
    FOREIGN KEY ([OrderId])
    REFERENCES [dbo].[Order]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderItemToOrder'
CREATE INDEX [IX_FK_OrderItemToOrder]
ON [dbo].[OrderItem]
    ([OrderId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------