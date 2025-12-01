---
name: FR#LUR-5 – Get Reschedule Reason Details
about: Functional Requirement - Get Reschedule Reason Details
labels: enhancement, functional-requirement, lookup
assignees: ''
---

## Functional Requirement Reference
- **Requirement ID:** FR#LUR-5
- **Module:** Lookup Data Management
- **Source Document:** Requirement/Functional/V1/2#LookupReterival/FR#LUR-5 - Get Reschedule Reason Details.md

## Technical References
- OpenAPI Contract: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateContracts.openapi.yml`
- Entity Definition: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateEntities.openapi.yml`

## Description
System should allow authorized users to retrieve detailed information about reschedule reasons used for documenting and tracking interview rescheduling.

## User Roles
- Master Admin
- Practice Admin
- Tech Team Panel Member
- TA Team Admin

## Personas and Permissions
- [All Roles] Can view reschedule reason details as these are essential reference data
- [Master Admin] Can view all reasons including inactive ones
- [Other Roles] Can view only active reasons

## Preconditions
- Reschedule reason must exist in the system
- User must be authenticated
- User must have appropriate permissions

## Postconditions
- Reschedule reason details are returned if authorized
- Access attempt is logged

## Request Parameters
| Field Name              | Description         | Type | Validation                | Required | Default Value | Example                                 |
|------------------------|---------------------|------|--------------------------|----------|---------------|-----------------------------------------|
| RescheduleReasonID     | Unique identifier   | guid | Must be valid existing ID | Yes      | None          | "12345678-1234-1234-1234-123456789012" |

## Response Fields
| Field Name              | Description         | Type  | Example                                 |
|------------------------|---------------------|-------|-----------------------------------------|
| RescheduleReasonID     | Unique identifier   | guid  | "12345678-1234-1234-1234-123456789012" |
| Name                   | System name         | string| "PanelUnavailable"                     |
| DisplayName            | Display name        | string| "Panel Member Unavailable"              |

---
**Checklist:**
- [ ] Requirement reviewed and confirmed
- [ ] All fields and rules captured
- [ ] Linked to relevant documentation
