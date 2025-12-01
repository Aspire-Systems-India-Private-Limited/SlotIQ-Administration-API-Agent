---
name: FR#LUR-8 – Get Recruitment Position Details
about: Functional Requirement - Get Recruitment Position Details
labels: enhancement, functional-requirement, lookup
assignees: ''
---

## Functional Requirement Reference
- **Requirement ID:** FR#LUR-8
- **Module:** Lookup Data Management
- **Source Document:** Requirement/Functional/V1/2#LookupReterival/FR#LUR-8 - Get Recruitment Position Details.md

## Technical References
- OpenAPI Contract: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateContracts.openapi.yml`
- Entity Definition: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateEntities.openapi.yml`

## Description
System should allow authorized users to retrieve detailed information about recruitment positions used for categorizing job roles in the interview process.

## User Roles
- Master Admin
- Practice Admin
- Tech Team Panel Member
- TA Team Admin

## Personas and Permissions
- [All Roles] Can view recruitment position details as these are essential reference data
- [Master Admin] Can view all positions including inactive ones
- [Other Roles] Can view only active positions

## Preconditions
- Recruitment position must exist in the system
- User must be authenticated
- User must have appropriate permissions

## Postconditions
- Recruitment position details are returned if authorized
- Access attempt is logged

## Request Parameters
| Field Name              | Description         | Type | Validation                | Required | Default Value | Example                                 |
|------------------------|---------------------|------|--------------------------|----------|---------------|-----------------------------------------|
| RecruitmentPositionID   | Unique identifier   | guid | Must be valid existing ID | Yes      | None          | "12345678-1234-1234-1234-123456789012" |

## Response Fields
| Field Name              | Description         | Type  | Example                                 |
|------------------------|---------------------|-------|-----------------------------------------|
| RecruitmentPositionID   | Unique identifier   | guid  | "12345678-1234-1234-1234-123456789012" |
| Name                   | System name         | string| "SoftwareEngineer"                      |
| DisplayName            | Display name        | string| "Software Engineer"                     |

---
**Checklist:**
- [ ] Requirement reviewed and confirmed
- [ ] All fields and rules captured
- [ ] Linked to relevant documentation
