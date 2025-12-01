---
name: FR#LUR-7 – Get Schedule Status Details
about: Functional Requirement - Get Schedule Status Details
labels: enhancement, functional-requirement, lookup
assignees: ''
---

## Functional Requirement Reference
- **Requirement ID:** FR#LUR-7
- **Module:** Lookup Data Management
- **Source Document:** Requirement/Functional/V1/2#LookupReterival/FR#LUR-7 - Get Schedule Status Details.md

## Technical References
- OpenAPI Contract: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateContracts.openapi.yml`
- Entity Definition: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateEntities.openapi.yml`

## Description
System should allow authorized users to retrieve detailed information about schedule statuses used for tracking the state of interview schedules.

## User Roles
- Master Admin
- Practice Admin
- Tech Team Panel Member
- TA Team Admin

## Personas and Permissions
- [All Roles] Can view schedule status details as these are essential reference data
- [Master Admin] Can view all statuses including inactive ones
- [Other Roles] Can view only active statuses

## Preconditions
- Schedule status must exist in the system
- User must be authenticated
- User must have appropriate permissions

## Postconditions
- Schedule status details are returned if authorized
- Access attempt is logged

## Request Parameters
| Field Name              | Description         | Type | Validation                | Required | Default Value | Example                                 |
|------------------------|---------------------|------|--------------------------|----------|---------------|-----------------------------------------|
| ScheduleStatusID       | Unique identifier   | guid | Must be valid existing ID | Yes      | None          | "12345678-1234-1234-1234-123456789012" |

## Response Fields
| Field Name              | Description         | Type  | Example                                 |
|------------------------|---------------------|-------|-----------------------------------------|
| ScheduleStatusID       | Unique identifier   | guid  | "12345678-1234-1234-1234-123456789012" |
| Name                   | System name         | string| "Scheduled"                            |
| DisplayName            | Display name        | string| "Interview Scheduled"                   |

---
**Checklist:**
- [ ] Requirement reviewed and confirmed
- [ ] All fields and rules captured
- [ ] Linked to relevant documentation
