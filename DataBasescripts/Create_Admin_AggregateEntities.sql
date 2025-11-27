USE SLOTIQDB;
GO

-- Ensure schema exists
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'SHL')
    EXEC('CREATE SCHEMA SHL');
GO

/* ----------------------------------------------------
   STEP 1: DROP TABLES IN REVERSE DEPENDENCY ORDER
---------------------------------------------------- */
IF OBJECT_ID('SHL.RolePermissionsMapping', 'U') IS NOT NULL DROP TABLE SHL.RolePermissionsMapping;
IF OBJECT_ID('SHL.OpportunityCategory', 'U') IS NOT NULL DROP TABLE SHL.OpportunityCategory;
IF OBJECT_ID('SHL.CandidateDesignation', 'U') IS NOT NULL DROP TABLE SHL.CandidateDesignation;
IF OBJECT_ID('SHL.InterviewRescheduleReason', 'U') IS NOT NULL DROP TABLE SHL.InterviewRescheduleReason;
IF OBJECT_ID('SHL.AvailabilityRePlanHistoryReason', 'U') IS NOT NULL DROP TABLE SHL.AvailabilityRePlanHistoryReason;
IF OBJECT_ID('SHL.InterviewType', 'U') IS NOT NULL DROP TABLE SHL.InterviewType;
IF OBJECT_ID('SHL.InterviewScheduleType', 'U') IS NOT NULL DROP TABLE SHL.InterviewScheduleType;
IF OBJECT_ID('SHL.AvailabilityPlanType', 'U') IS NOT NULL DROP TABLE SHL.AvailabilityPlanType;
IF OBJECT_ID('SHL.InterviewScheduleStatus', 'U') IS NOT NULL DROP TABLE SHL.InterviewScheduleStatus;
IF OBJECT_ID('SHL.Source', 'U') IS NOT NULL DROP TABLE SHL.Source;
GO

/* ----------------------------------------------------
   STEP 2: CREATE BASE TABLE FIRST (SHL.Source)
---------------------------------------------------- */
CREATE TABLE SHL.Source (
    SourceID INT PRIMARY KEY,
    Name NVARCHAR(20) NOT NULL
);
GO

INSERT INTO SHL.Source (SourceID, Name) VALUES
    (1, 'Web'),
    (2, 'Mobile'),
    (3, 'API'),
    (4, 'Thirdparty'),
    (5, 'Manual');
GO

/* ----------------------------------------------------
   STEP 3: CREATE DEPENDENT TABLES (REFERENCING SHL.Source)
---------------------------------------------------- */

CREATE TABLE SHL.CandidateDesignation (
    CandidateDesignationID INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    displayName NVARCHAR(100) NOT NULL,
    isActive BIT NOT NULL,
    createdDate DATETIME2(7) NOT NULL,
    modifiedDate DATETIME2(7) NOT NULL,
    modUser NVARCHAR(50) NOT NULL,
    source INT NOT NULL FOREIGN KEY REFERENCES SHL.Source(SourceID)
);
GO

CREATE TABLE SHL.InterviewRescheduleReason (
    InterviewRescheduleReasonID INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    displayName NVARCHAR(100) NOT NULL,
    isActive BIT NOT NULL,
    createdDate DATETIME2(7) NOT NULL,
    modifiedDate DATETIME2(7) NOT NULL,
    modUser NVARCHAR(50) NOT NULL,
    source INT NOT NULL FOREIGN KEY REFERENCES SHL.Source(SourceID)
);
GO

CREATE TABLE SHL.AvailabilityRePlanHistoryReason (
    AvailabilityRePlanHistoryReasonID INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    displayName NVARCHAR(100) NOT NULL,
    isActive BIT NOT NULL,
    createdDate DATETIME2(7) NOT NULL,
    modifiedDate DATETIME2(7) NOT NULL,
    modUser NVARCHAR(50) NOT NULL,
    source INT NOT NULL FOREIGN KEY REFERENCES SHL.Source(SourceID)
);
GO

CREATE TABLE SHL.InterviewType (
    InterviewTypeID INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    displayName NVARCHAR(100) NOT NULL,
    isActive BIT NOT NULL,
    createdDate DATETIME2(7) NOT NULL,
    modifiedDate DATETIME2(7) NOT NULL,
    modUser NVARCHAR(50) NOT NULL,
    source INT NOT NULL FOREIGN KEY REFERENCES SHL.Source(SourceID)
);
GO

CREATE TABLE SHL.InterviewScheduleType (
    InterviewScheduleTypeID INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    displayName NVARCHAR(100) NOT NULL,
    isActive BIT NOT NULL,
    createdDate DATETIME2(7) NOT NULL,
    modifiedDate DATETIME2(7) NOT NULL,
    modUser NVARCHAR(50) NOT NULL,
    source INT NOT NULL FOREIGN KEY REFERENCES SHL.Source(SourceID)
);
GO

CREATE TABLE SHL.AvailabilityPlanType (
    AvailabilityPlanTypeID INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    displayName NVARCHAR(100) NOT NULL,
    isActive BIT NOT NULL,
    createdDate DATETIME2(7) NOT NULL,
    modifiedDate DATETIME2(7) NOT NULL,
    modUser NVARCHAR(50) NOT NULL,
    source INT NOT NULL FOREIGN KEY REFERENCES SHL.Source(SourceID)
);
GO

CREATE TABLE SHL.InterviewScheduleStatus (
    InterviewScheduleStatusID INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    displayName NVARCHAR(100) NOT NULL,
    isActive BIT NOT NULL,
    createdDate DATETIME2(7) NOT NULL,
    modifiedDate DATETIME2(7) NOT NULL,
    modUser NVARCHAR(50) NOT NULL,
    source INT NOT NULL FOREIGN KEY REFERENCES SHL.Source(SourceID)
);
GO

CREATE TABLE SHL.OpportunityCategory (
    opportunityCategoryID INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    displayName NVARCHAR(100) NOT NULL,
    isActive BIT NOT NULL,
    createdDate DATETIME2(7) NOT NULL,
    modifiedDate DATETIME2(7) NOT NULL,
    modUser NVARCHAR(50) NOT NULL,
    source INT NOT NULL FOREIGN KEY REFERENCES SHL.Source(SourceID)
);
GO

/* ----------------------------------------------------
   STEP 4: INSERT DATA INTO LOOKUP TABLES
---------------------------------------------------- */

INSERT INTO SHL.CandidateDesignation (CandidateDesignationID, name, displayName, isActive, createdDate, modifiedDate, modUser, source) VALUES
(1, 'FullStackSSE', 'Full Stack Senior Software Engineer', 1, GETDATE(), GETDATE(), 'System', 1),
(2, 'FrontEndSSE', 'Front End Senior Software Engineer', 1, GETDATE(), GETDATE(), 'System', 1),
(3, 'BackEndSSE', 'Back End Senior Software Engineer', 1, GETDATE(), GETDATE(), 'System', 1),
(4, 'DBDeveloper', 'Database Developer', 1, GETDATE(), GETDATE(), 'System', 1);
GO

INSERT INTO SHL.InterviewRescheduleReason (InterviewRescheduleReasonID, name, displayName, isActive, createdDate, modifiedDate, modUser, source) VALUES
(1, 'UnplannedLeave', 'Unplanned Leave', 1, GETDATE(), GETDATE(), 'System', 1),
(2, 'ProjectPriority', 'Project Priority', 1, GETDATE(), GETDATE(), 'System', 1),
(3, 'ClientCalls', 'Client Calls', 1, GETDATE(), GETDATE(), 'System', 1);
GO

INSERT INTO SHL.AvailabilityRePlanHistoryReason (AvailabilityRePlanHistoryReasonID, name, displayName, isActive, createdDate, modifiedDate, modUser, source) VALUES
(1, 'PlannedLeave', 'Planned Leave', 1, GETDATE(), GETDATE(), 'System', 1),
(2, 'ProjectPriority', 'Project Priority', 1, GETDATE(), GETDATE(), 'System', 1),
(3, 'Others', 'Others', 1, GETDATE(), GETDATE(), 'System', 1);
GO

INSERT INTO SHL.InterviewType (InterviewTypeID, name, displayName, isActive, createdDate, modifiedDate, modUser, source) VALUES
(1, 'WeekDaysScheduled', 'Weekdays Scheduled', 1, GETDATE(), GETDATE(), 'System', 1),
(2, 'WeekDayWalkin', 'Weekday Walk-in', 1, GETDATE(), GETDATE(), 'System', 1),
(3, 'WeekendScheduled', 'Weekend Scheduled', 1, GETDATE(), GETDATE(), 'System', 1),
(4, 'WeekendWalkin', 'Weekend Walk-in', 1, GETDATE(), GETDATE(), 'System', 1);
GO

INSERT INTO SHL.InterviewScheduleType (InterviewScheduleTypeID, name, displayName, isActive, createdDate, modifiedDate, modUser, source) VALUES
(1, 'New', 'New', 1, GETDATE(), GETDATE(), 'System', 1),
(2, 'Rescheduled', 'Rescheduled', 1, GETDATE(), GETDATE(), 'System', 1);
GO

INSERT INTO SHL.AvailabilityPlanType (AvailabilityPlanTypeID, name, displayName, isActive, createdDate, modifiedDate, modUser, source) VALUES
(1, 'New', 'New', 1, GETDATE(), GETDATE(), 'System', 1),
(2, 'Replan', 'Replan', 1, GETDATE(), GETDATE(), 'System', 1);
GO

INSERT INTO SHL.InterviewScheduleStatus (InterviewScheduleStatusID, name, displayName, isActive, createdDate, modifiedDate, modUser, source) VALUES
(1, 'Completed', 'Completed', 1, GETDATE(), GETDATE(), 'System', 1),
(2, 'Scheduled', 'Scheduled', 1, GETDATE(), GETDATE(), 'System', 1),
(3, 'Cancelled', 'Cancelled', 1, GETDATE(), GETDATE(), 'System', 1);
GO
