---
name: FR#LUR-20 – Get All Job Descriptions List
about: Functional Requirement - Get All Job Descriptions List
labels: enhancement, functional-requirement, lookup
assignees: ''
---

## Functional Requirement Reference
- **Requirement ID:** FR#LUR-20
- **Module:** Lookup Data Management
- **Source Document:** Requirement/Functional/V1/2#LookupReterival/FR#LUR-20 - Get All Job Descriptions List.md

## Technical References
- OpenAPI Contract: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateContracts.openapi.yml`
- Entity Definition: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateEntities.openapi.yml`

## Description
System should allow authorized users to retrieve a paginated list of all job descriptions with filtering options for active/inactive status.

## User Roles
- Master Admin
- Practice Admin

## Personas and Permissions
- [All Roles] Can view list of job descriptions

## Preconditions
- User must be authenticated
- User must have appropriate permissions

## Postconditions
- Filtered list of job descriptions is returned
- Access attempt is logged

## Request Parameters
| Field Name   | Description                | Type    | Validation           | Required | Default Value | Example     |
|--------------|----------------------------|---------|----------------------|----------|---------------|-------------|
| PageNumber   | Page number for pagination | integer | Must be > 0          | No       | 1             | 1           |
| PageSize     | Items per page             | integer | Must be > 0 and ≤ 100| No       | 20            | 20          |
| IsActive     | Filter by active status    | boolean | None                 | No       | true          | true        |
| SearchTerm   | Search by job description  | string  | Max length 200       | No       | null          | "Developer"|

## Response Fields
| Field Name  | Description                      | Type    | Example     |
|-------------|----------------------------------|---------|-------------|
| Items       | Array of job descriptions        | array   | [{ ... }]   |
| TotalCount  | Total number of matching records | integer | 50          |
| PageNumber  | Current page number              | integer | 1           |
| PageSize    | Items per page                   | integer | 20          |
| TotalPages  | Total number of pages            | integer | 3           |

---
**Checklist:**
- [ ] Requirement reviewed and confirmed
- [ ] All fields and rules captured
- [ ] Linked to relevant documentation
