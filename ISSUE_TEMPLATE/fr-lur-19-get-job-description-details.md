---
name: FR#LUR-19 – Get Job Description Details
about: Functional Requirement - Get Job Description Details
labels: enhancement, functional-requirement, lookup
assignees: ''
---

## Functional Requirement Reference
- **Requirement ID:** FR#LUR-19
- **Module:** Lookup Data Management
- **Source Document:** Requirement/Functional/V1/2#LookupReterival/FR#LUR-19 - Get Job Description Details.md

## Technical References
- OpenAPI Contract: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateContracts.openapi.yml`
- Entity Definition: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateEntities.openapi.yml`

## Description
System should allow authorized users to retrieve detailed information about a specific job description used for categorizing job roles.

## User Roles
- Master Admin
- Practice Admin

## Personas and Permissions
- [All Roles] Can view job description details as these are essential reference data

## Preconditions
- Job description must exist in the system
- User must be authenticated
- User must have appropriate permissions

## Postconditions
- Job description details are returned if authorized
- Access attempt is logged

## Request Parameters
| Field Name | Description         | Type | Validation                | Required | Default Value | Example |
|------------|---------------------|------|--------------------------|----------|---------------|---------|
| ID         | Unique identifier   | int  | Must be valid existing ID | Yes      | None          | 1       |

## Response Fields
| Field Name      | Description             | Type     | Example                 |
|-----------------|------------------------|----------|-------------------------|
| ID              | Unique identifier      | int      | 1                       |
| JobDescription  | Description of the job | string   | "Senior .NET Developer" |
| IsActive        | Status                 | boolean  | true                    |
| CreatedDate     | Creation timestamp     | datetime | "2025-11-24T10:00:00Z"  |
| ModifiedDate    | Last update timestamp  | datetime | "2025-11-24T10:00:00Z"  |
| CreatedBy       | Creator's ID           | string   | "admin"                 |
| ModifiedBy      | Last updater's ID      | string   | "user123"               |

---
**Checklist:**
- [ ] Requirement reviewed and confirmed
- [ ] All fields and rules captured
- [ ] Linked to relevant documentation
