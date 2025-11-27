## FR#LUR-20 – Get All Job Descriptions List

### Description
System should allow authorized users to retrieve a paginated list of all job descriptions with filtering options for active/inactive status.

### User Roles
- Master Admin
- Practice Admin

### Personas and Permissions
- [All Roles] Can view list of job descriptions

### Preconditions and Postconditions
- [Preconditions]
    - User must be authenticated
    - User must have appropriate permissions

- [Postconditions]
    - Filtered list of job descriptions is returned
    - Access attempt is logged

### Module Name
- Lookup Data Management

### Request Parameters
FieldName | Description | Type | Validation | Required | Default Value | Example
----------|-------------|------|------------|----------|---------------|----------
`PageNumber` | Page number for pagination | integer | Must be > 0 | No | 1 | 1
`PageSize` | Items per page | integer | Must be > 0 and ≤ 100 | No | 20 | 20
`IsActive` | Filter by active status | boolean | None | No | true | true
`SearchTerm` | Search by job description | string | Max length 200 | No | null | "Developer"

### Response Fields
FieldName | Description | Type | Example
----------|-------------|------|----------
`Items` | Array of job descriptions | array | [{ ... }]
`TotalCount` | Total number of matching records | integer | 50
`PageNumber` | Current page number | integer | 1
`PageSize` | Items per page | integer | 20
`TotalPages` | Total number of pages | integer | 3
`HasNextPage` | More pages available | boolean | true
`HasPreviousPage` | Previous pages available | boolean | false

### Item Fields
FieldName | Description | Type | Example
----------|-------------|------|----------
`ID` | Unique identifier | int | 1
`JobDescription` | Description of the job | string | "Senior .NET Developer"
`IsActive` | Status | boolean | true
`CreatedDate` | Creation timestamp | datetime | "2025-11-24T10:00:00Z"
`ModifiedDate` | Last update timestamp | datetime | "2025-11-24T10:00:00Z"
`CreatedBy` | Creator's ID | string | "admin"
`ModifiedBy` | Last updater's ID | string | "user123"

### System-Level Business Rules
- Return empty list if no job descriptions match filters
- Implement server-side pagination
- Cache frequently accessed lists
- Sort by JobDescription by default
- Filter inactive items for non-admin users
- All fields from BaseEntity must be included in response
- Response must follow GetJobDescriptionListResponse schema

### API Level Business Rules
Result Name | ResultType | Response and ActionsValidation | Example | Should be logged | Response Category
------------|------------|--------------------------------|---------|------------------|------------------
JOB_DESCRIPTION_LIST_SUCCESS | Success | Returns paginated list | {"successCode": "JOB_DESCRIPTION_LIST_SUCCESS", "successMessage": "Job descriptions retrieved successfully", "data": {...}} | No | Informational
UNAUTHORIZED_ERROR | Failure | Returns error code and message | {"ErrorCode": "UNAUTHORIZED_ERROR", "Message": "You are not authorized to view job descriptions"} | Yes | Error
INVALID_PARAMETERS | Failure | Returns validation errors | {"ErrorCode": "INVALID_PARAMETERS", "Message": "Invalid page number"} | Yes | Error
SYSTEM_ERROR | Failure | Returns error code and message | {"ErrorCode": "SYSTEM_ERROR", "Message": "Failed to retrieve job descriptions"} | Yes | Critical

### Security and Compliances
- [Access Control] Basic authentication required
- [Audit] Log all access attempts
- [Caching] Cache list results for 5 minutes
- [Performance] Implement efficient pagination
- [Rate Limiting] Apply standard API rate limits

### User Stories

1. **View All Job Descriptions**
   ```
   As an authorized user
   I want to retrieve a list of job descriptions
   So that I can view and select from available options
   ```

2. **Filter Active Job Descriptions**
   ```
   As a regular user
   I want to see only active job descriptions
   So that I can make valid selections
   ```

3. **Search Job Descriptions**
   ```
   As an authorized user
   I want to search job descriptions by text
   So that I can quickly find specific jobs
   ```

4. **Navigate Pages**
   ```
   As an authorized user
   I want to navigate through pages of job descriptions
   So that I can view all available options
   ```

### Glossary
- [Job Description] Description of a job role (e.g., Senior .NET Developer)
- [Pagination] Division of results into pages for efficient data retrieval
- [Search Term] Text to filter job descriptions by description
- [Active Status] Whether a job description is currently in use
