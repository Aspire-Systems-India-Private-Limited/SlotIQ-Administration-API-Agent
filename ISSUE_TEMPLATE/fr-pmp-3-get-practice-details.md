---
name: FR#PMP-3 – Get Practice Details
about: Functional Requirement - Get Practice Details
labels: enhancement, functional-requirement
assignees: ''
---


## Functional Requirement Reference
- **Requirement ID:** FR#PMP-3
- **Module:** Practice Management
- **Source Document:** Requirement/Functional/V1/1#PracticeManagement/FR#PMP-3 - Get Practice Details.md

## Technical References
- OpenAPI Contract: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateContracts.openapi.yml`
- Entity Definition: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateEntities.openapi.yml`

## Description
System should allow authorized users to retrieve detailed information about a specific practice.

## User Roles
- Master Admin
- Practice Admin
- Tech Team Panel Member
- TA Team Admin

## Personas and Permissions
- [Master Admin] Can view details of any practice
- [Practice Admin] Can view details of their assigned practice only
- [Tech Team Panel Member] Can view details of their assigned practice only
- [TA Team Admin] Can view details of their assigned practice only

## Preconditions
- Practice must exist in the system
- User must be authenticated
- User must have appropriate permissions

## Postconditions
- Practice details are returned if authorized
- Access attempt is logged

## Fields & Business Rules
| Field Name    | Description           | Type    | Validation                      | Required | Default Value | Example                        |
|--------------|-----------------------|---------|----------------------------------|----------|---------------|---------------------------------|
| PracticeID   | Unique identifier     | guid    | Must be valid existing PracticeID| Yes      | None          | "12345678-1234-1234-1234-123456789012" |

## Response Fields
| Field Name    | Description           | Type    | Example                        |
|--------------|-----------------------|---------|---------------------------------|
| PracticeID   | Unique identifier     | guid    | "12345678-1234-1234-1234-123456789012" |
| PracticeName | Name of the practice  | string  | ".NET"                         |

---
**Checklist:**
- [ ] Requirement reviewed and confirmed
- [ ] All fields and rules captured
- [ ] Linked to relevant documentation
