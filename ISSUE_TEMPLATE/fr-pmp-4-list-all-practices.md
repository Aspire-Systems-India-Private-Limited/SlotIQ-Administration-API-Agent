---
name: FR#PMP-4 – List All Practices
about: Functional Requirement - List All Practices
labels: enhancement, functional-requirement
assignees: ''
---


## Functional Requirement Reference
- **Requirement ID:** FR#PMP-4
- **Module:** Practice Management
- **Source Document:** Requirement/Functional/V1/1#PracticeManagement/FR#PMP-4 - List All Practices.md

## Technical References
- OpenAPI Contract: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateContracts.openapi.yml`
- Entity Definition: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateEntities.openapi.yml`

## Description
System should allow authorized users to retrieve a paginated list of all practices with filtering and sorting capabilities.

## User Roles
- Master Admin
- Practice Admin
- Tech Team Panel Member
- TA Team Admin

## Personas and Permissions
- [Master Admin] Can view all practices with full details
- [Practice Admin] Can view list of all practices with limited details
- [Tech Team Panel Member] Can view list of all practices with limited details
- [TA Team Admin] Can view list of all practices with limited details

## Preconditions
- User must be authenticated
- User must have appropriate permissions

## Postconditions
- Filtered and paginated practice list is returned
- Access attempt is logged

## Request Parameters
| Field Name    | Description           | Type    | Validation                      | Required | Default Value | Example                        |
|--------------|-----------------------|---------|----------------------------------|----------|---------------|---------------------------------|
| PageNumber   | Page number for pagination | integer | Must be > 0                  | No       | 1             | 1                               |
| PageSize     | Items per page        | integer | Must be > 0 and ≤ 100           | No       | 10            | 20                              |
| SearchTerm   | Search text           | string  | Max 50 characters               | No       | None          | ".NET"                         |
| SortBy       | Field to sort by      | string  | Must be valid field name         | No       | "PracticeName"| "Location"                     |
| SortOrder    | Sort direction        | string  | "ASC" or "DESC"                 | No       | "ASC"         | "DESC"                         |
| IsActive     | Filter by active status| boolean | true/false                      | No       | None          | true                            |

---
**Checklist:**
- [ ] Requirement reviewed and confirmed
- [ ] All fields and rules captured
- [ ] Linked to relevant documentation
