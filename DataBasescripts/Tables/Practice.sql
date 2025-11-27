-- Create Practice Table
CREATE TABLE [dbo].[Practice] (
    [PracticeID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    [PracticeName] NVARCHAR(50) NOT NULL,
    [Description] NVARCHAR(500) NULL,
    [Location] NVARCHAR(100) NOT NULL,
    [IsActive] BIT NOT NULL DEFAULT 1,
    [CreatedDate] DATETIME2 NOT NULL,
    [ModifiedDate] DATETIME2 NOT NULL,
    [CreatedBy] NVARCHAR(100) NOT NULL,
    [ModifiedBy] NVARCHAR(100) NOT NULL,
    [Source] NVARCHAR(50) NOT NULL,
    CONSTRAINT [UQ_Practice_PracticeName] UNIQUE ([PracticeName])
);

-- Create Practice Deactivation History Table
CREATE TABLE [dbo].[PracticeDeactivationHistory] (
    [PracticeDeactivationHistoryID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    [PracticeID] UNIQUEIDENTIFIER NOT NULL,
    [Reason] NVARCHAR(500) NOT NULL,
    [DeactivatedBy] NVARCHAR(100) NOT NULL,
    [DeactivatedDate] DATETIME2 NOT NULL,
    [Source] NVARCHAR(50) NOT NULL,
    CONSTRAINT [FK_PracticeDeactivationHistory_Practice] FOREIGN KEY ([PracticeID]) 
        REFERENCES [dbo].[Practice]([PracticeID])
);