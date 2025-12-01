---
name: FR#LUR-1 – Get Opportunity Category Details
about: Functional Requirement - Get Opportunity Category Details
labels: enhancement, functional-requirement, lookup
assignees: ''
---

## Functional Requirement Reference
- **Requirement ID:** FR#LUR-1
- **Module:** Lookup Data Management
- **Source Document:** Requirement/Functional/V1/2#LookupReterival/FR#LUR-1 - Get Opportunity Category Details.md

## Technical References
- OpenAPI Contract: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateContracts.openapi.yml`
- Entity Definition: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateEntities.openapi.yml`

## Description
System should allow authorized users to retrieve detailed information about specific opportunity categories used for categorizing hiring opportunities.

## User Roles
- Master Admin
- Practice Admin
- Tech Team Panel Member
- TA Team Admin

## Personas and Permissions
- [All Roles] Can view opportunity category details as these are essential reference data
- [Master Admin] Can view all categories including inactive ones
- [Other Roles] Can view only active categories

## Preconditions
- Opportunity category must exist in the system
- User must be authenticated
- User must have appropriate permissions

## Postconditions
- Category details are returned if authorized
- Access attempt is logged

## Request Parameters
| Field Name              | Description         | Type | Validation                | Required | Default Value | Example                                 |
|------------------------|---------------------|------|--------------------------|----------|---------------|-----------------------------------------|
| OpportunityCategoryID   | Unique identifier   | guid | Must be valid existing ID | Yes      | None          | "12345678-1234-1234-1234-123456789012" |

## Response Fields
| Field Name              | Description         | Type  | Example                                 |
|------------------------|---------------------|-------|-----------------------------------------|
| OpportunityCategoryID   | Unique identifier   | guid  | "12345678-1234-1234-1234-123456789012" |
| Name                   | System name         | string| "Forecast"                             |
| DisplayName            | Display name        | string| "Forecast Hiring"                       |

---
**Checklist:**
- [ ] Requirement reviewed and confirmed
- [ ] All fields and rules captured
- [ ] Linked to relevant documentation
