# Copilot Instructions for SlotIQ Administration Solution

This guide enables AI coding agents to work productively in the SlotIQ Interview codebase. It summarizes architecture, conventions, workflows, and critical patterns unique to this solution.

## Global Variables
All instruction files use standardized variables for consistent code generation:

| Variable               | Description                                 | Example Values        |
|------------------------|---------------------------------------------|-----------------------|
| `{{EntityName}}`       | Singular entity name                        | Member, AvailabilityPlan, AvailabilityRePlanRequest |
| `{{EntityNamePlural}}` | Plural form of entity name                  | Members, AvailabilityPlans, AvailabilityRePlanRequests |
| `{{ProjectPrefix}}`    | Solution namespace prefix                   | SlotIQ.Administration |


## Layer-Specific Implementation Rules

For detailed implementation patterns and code generation guidance, refer to the following layer-specific rules:

### 1. **Common Layer** - 
- Shared types, constants, enums, and models used across all layers
- Result pattern implementation with `Result<T>` and `PaginatedResult<T>`
- ApiResponse wrapper for consistent API responses
- Error message constants and JsonStringEnumConverter patterns
- Extension methods for Result<T> operations

### 2. **Data Layer** - 
- Entity structure with `Guid {{EntityName}}ID` primary keys and BaseEntity inheritance
- Repository pattern with Dapper ORM and external SQL files
- Infrastructure components (DbConnectionFactory, SqlQueryLoader, UnitOfWork)
- SQL query file organization and parameterized queries
- Error handling and structured logging patterns
- **Detailed Implementation Guide**: See [Data Layer Instructions](../.github/Instructions/data.Instructions.md) for complete patterns, SQL examples, and entity relationship guidance

### 3. **Logic Layer** - 
- Custom CQRS implementation with record types (no MediatR)
- Command and query patterns with generic interfaces
- DTO structure patterns (Main, Create, Update DTOs)
- Command/query handlers with transaction management
- AutoMapper configuration and mapping profiles

### 4. **API Layer** - 
- Minimal API endpoint patterns with static methods
- Direct handler injection and TypedResults responses
- OpenAPI documentation and endpoint metadata
- Global exception handling middleware
- Health checks and authentication patterns

### 5. **Unit Testing** - 
- Comprehensive testing patterns with xUnit, Moq, and FluentAssertions
- Repository testing with in-memory SQLite
- Command/query handler testing with mocked dependencies
- API endpoint testing with mocked handlers
- Test organization and naming conventions

## Critical Implementation Notes

### Naming Conventions
- **Primary Keys**: Use `{{EntityName}}ID` suffix (not `{{EntityName}}Id`)
- **File Scoped Namespaces**: All C# files use file-scoped namespaces
- **SQL Files**: Use PascalCase naming in `SlotIQ.Administration.Data/Sql/` folder

### Key Differences from Standard Patterns
- **No MediatR**: Custom CQRS implementation
- **Minimal APIs**: Static endpoint methods instead of controllers
- **Direct Handler Injection**: Handlers injected directly in endpoints
- **SQL Query Files**: External SQL files instead of inline queries
- **ID Suffix**: Primary keys use `ID` instead of `Id`


## Technology Stack

### Framework & Runtime
- **Target Framework**: .NET 9.0
- **Language**: C# 12.0
- **API Framework**: ASP.NET Core 9.0 with Minimal APIs
- **HTTP Responses**: TypedResults pattern

### Data & Persistence
- **Database**: SQL Server
- **ORM**: Dapper v2.1.35
- **Query Storage**: External .sql files (no inline SQL)
- **Transaction Pattern**: Unit of Work

### Object Mapping & Validation
- **Mapper**: AutoMapper v12.0.1
- **Validation**: FluentValidation v11.9.2

### Testing Tools
- **Framework**: xUnit v2.9.2
- **Assertions**: FluentAssertions v6.12.1
- **Mocking**: Moq v4.20.72
- **Repository Testing**: In-memory SQLite

### Common Patterns
- **Serialization**: System.Text.Json with JsonStringEnumConverter
- **Async Pattern**: Async/Await with CancellationToken support
- **Logging**: Structured logging with Serilog
- **Monitoring**: Health checks at /health endpoint

## Root Directory Structure
```
SlotIQ-Administration-API-Co/
├── README.md
├── SlotIQ.Administration.sln
├── .github/
│   ├── Instructions/
│   ├── Prompts/
│   ├── chatmodes/
│   └── workflow/
├── Requirement/
│   ├── Functional/
│   └── Technical/
└── ScaffoldInstructions/
    ├── GENERATE.md
    ├── New-ScaffoldSolution.ps1
    └── scaffold.config.json
```

## Solution Projects Structure

### SlotIQ.Administration.Common
**Purpose**: Shared types, constants, enums, and models used across all layers.

```
SlotIQ.Administration.Common/
├── Constants/                        # Centralized constants (ErrorMessages, etc.)
├── Enums/                            # Domain enums with JSON serialization
├── Helpers/                          # Extension methods and utility classes
├── Models/                           # Result pattern, ApiResponse, PaginatedResult
└── SlotIQ.Administration.Common.csproj    # Project configuration file
```

### SlotIQ.Administration.Data
**Purpose**: Domain entities and data access layer using Dapper ORM with external SQL files.

```
SlotIQ.Administration.Data/
├── Entities/                         # Domain entities with BaseEntity inheritance
├── Repositories/                     # Data access implementations
│   └── Contracts/                    # Repository interfaces for dependency injection
├── Sql/                              # External SQL query files (no inline SQL)
├── DbConnectionFactory.cs            # Database connection management
├── IDbConnectionFactory.cs           # Connection factory interface
├── ISqlQueryLoader.cs                # SQL file loader interface
├── IUnitOfWork.cs                    # Transaction management interface
├── SqlQueryLoader.cs                 # SQL file loading implementation
├── UnitOfWork.cs                     # Transaction management implementation
└── SlotIQ.Administration.Data.csproj      # Project configuration file
```

### SlotIQ.Administration.Logic
**Purpose**: Business logic layer implementing custom CQRS patterns with DTOs and handlers.

```
SlotIQ.Administration.Logic/
├── Commands/                         # Write operations (Create, Update, Delete)
├── Dtos/                             # Data transfer objects for API communication
├── Handlers/                         # Business logic processors
│   ├── Commands/                     # Command handlers for write operations
│   └── Queries/                      # Query handlers for read operations
├── Mapping/                          # AutoMapper profiles for entity-DTO mapping
├── Queries/                          # Read operations (GetById, GetAll, GetPaged)
└── SlotIQ.Administration.Logic.csproj     # Project configuration file
```

### SlotIQ.Administration.API
**Purpose**: Presentation layer using ASP.NET Core Minimal APIs with static endpoint methods.

```
SlotIQ.Administration.API/
├── Configuration/                    # Dependency injection and service configuration
├── Endpoints/                        # Minimal API static endpoint methods
├── HealthChecks/                     # Application health monitoring
├── Middleware/                       # Global request/response processing
├── Properties/                       # Launch and debugging settings
├── Program.cs                        # Application entry point and startup
├── appsettings.json                  # Production configuration settings
├── appsettings.Development.json      # Development-specific settings
└── SlotIQ.Administration.API.csproj       # Project configuration file
```

### SlotIQ.Administration.Integration
**Purpose**: External service integration layer for third-party APIs and services (currently empty).

```
SlotIQ.Administration.Integration/
└── SlotIQ.Administration.Integration.csproj # Project configuration file
```

### SlotIQ.Administration.UnitTests
**Purpose**: Comprehensive unit test coverage using xUnit, Moq, and in-memory SQLite for testing.

```
SlotIQ.Administration.UnitTests/
├── Tests/                            # Test organization mirroring source structure
│   ├── Endpoints/                    # API endpoint tests with mocked handlers
│   ├── Handlers/                     # Command/query handler tests with mocks
│   └── Repositories/                 # Repository tests with in-memory SQLite
└── SlotIQ.Administration.UnitTests.csproj # Test project configuration file
```

## Directory Naming Conventions
- **PascalCase**: All directory names use PascalCase
- **Plural**: Collection directories are plural (e.g., `Entities`, `Repositories`, `Commands`)
- **Singular**: Interface directories are singular (e.g., `Contracts`)
- **Descriptive**: Directory names clearly indicate their purpose and contents

## Project Organization Rules
1. **Clean Separation**: Each project has a distinct responsibility
2. **Dependency Flow**: Dependencies flow inward (API → Logic → Data → Common)
3. **Interface Segregation**: Interfaces are separated in `Contracts` folders
4. **External Resources**: SQL files and configurations are in dedicated folders
6. **Test Organization**: Tests mirror the source project structure