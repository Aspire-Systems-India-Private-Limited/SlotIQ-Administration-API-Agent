---
name: FR#LUR-9 – Get Applicable Level Details
about: Functional Requirement - Get Applicable Level Details
labels: enhancement, functional-requirement, lookup
assignees: ''
---

## Functional Requirement Reference
- **Requirement ID:** FR#LUR-9
- **Module:** Lookup Data Management
- **Source Document:** Requirement/Functional/V1/2#LookupReterival/FR#LUR-9 - Get Applicable Level Details.md

## Technical References
- OpenAPI Contract: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateContracts.openapi.yml`
- Entity Definition: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateEntities.openapi.yml`

## Description
System should allow authorized users to retrieve detailed information about applicable levels used for categorizing experience and seniority levels in the recruitment process.

## User Roles
- Master Admin
- Practice Admin
- Tech Team Panel Member
- TA Team Admin

## Personas and Permissions
- [All Roles] Can view applicable level details as these are essential reference data
- [Master Admin] Can view all levels including inactive ones
- [Other Roles] Can view only active levels

## Preconditions
- Applicable level must exist in the system
- User must be authenticated
- User must have appropriate permissions

## Postconditions
- Applicable level details are returned if authorized
- Access attempt is logged

## Request Parameters
| Field Name              | Description         | Type | Validation                | Required | Default Value | Example                                 |
|------------------------|---------------------|------|--------------------------|----------|---------------|-----------------------------------------|
| ApplicableLevelID       | Unique identifier   | guid | Must be valid existing ID | Yes      | None          | "12345678-1234-1234-1234-123456789012" |

## Response Fields
| Field Name              | Description         | Type  | Example                                 |
|------------------------|---------------------|-------|-----------------------------------------|
| ApplicableLevelID       | Unique identifier   | guid  | "12345678-1234-1234-1234-123456789012" |
| Name                   | System name         | string| "L1Developer"                          |
| DisplayName            | Display name        | string| "Level 1 Developer"                     |

---
**Checklist:**
- [ ] Requirement reviewed and confirmed
- [ ] All fields and rules captured
- [ ] Linked to relevant documentation
