---
name: FR#LUR-18 – Get All Applicable Levels List
about: Functional Requirement - Get All Applicable Levels List
labels: enhancement, functional-requirement, lookup
assignees: ''
---

## Functional Requirement Reference
- **Requirement ID:** FR#LUR-18
- **Module:** Lookup Data Management
- **Source Document:** Requirement/Functional/V1/2#LookupReterival/FR#LUR-18 - Get All Applicable Levels List.md

## Technical References
- OpenAPI Contract: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateContracts.openapi.yml`
- Entity Definition: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateEntities.openapi.yml`

## Description
System should allow authorized users to retrieve a paginated list of all applicable levels with filtering options for active/inactive status.

## User Roles
- Master Admin
- Practice Admin
- Tech Team Panel Member
- TA Team Admin

## Personas and Permissions
- [All Roles] Can view list of applicable levels
- [Master Admin] Can view both active and inactive levels
- [Other Roles] Can view only active levels

## Preconditions
- User must be authenticated
- User must have appropriate permissions

## Postconditions
- Filtered list of applicable levels is returned
- Access attempt is logged

## Request Parameters
| Field Name   | Description                | Type    | Validation           | Required | Default Value | Example     |
|--------------|----------------------------|---------|----------------------|----------|---------------|-------------|
| PageNumber   | Page number for pagination | integer | Must be > 0          | No       | 1             | 1           |
| PageSize     | Items per page             | integer | Must be > 0 and ≤ 100| No       | 20            | 20          |
| IsActive     | Filter by active status    | boolean | None                 | No       | true          | true        |
| SearchTerm   | Search by name             | string  | Max length 50        | No       | null          | "Level"    |

## Response Fields
| Field Name | Description                      | Type  | Example     |
|------------|----------------------------------|-------|-------------|
| Items      | Array of applicable levels       | array | [{ ... }]   |

---
**Checklist:**
- [ ] Requirement reviewed and confirmed
- [ ] All fields and rules captured
- [ ] Linked to relevant documentation
