---
name: FR#PMP-2 – Update Practice Details
about: Functional Requirement - Update Practice Details
labels: enhancement, functional-requirement
assignees: ''
---


## Functional Requirement Reference
- **Requirement ID:** FR#PMP-2
- **Module:** Practice Management
- **Source Document:** Requirement/Functional/V1/1#PracticeManagement/FR#PMP-2 - Update Practice Details.md

## Technical References
- OpenAPI Contract: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateContracts.openapi.yml`
- Entity Definition: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateEntities.openapi.yml`

## Description
System should allow Master Admin to update existing practice details while maintaining data integrity and audit trail.

## User Roles
- Master Admin

## Personas and Permissions
- [Master Admin] Can update any practice details. Not bound to any practice.
- Other roles cannot update practice details.

## Preconditions
- Practice must exist in the system
- Practice must be active
- User must be authenticated as Master Admin
- Updated practice name (if changed) must be unique

## Postconditions
- Practice details are updated
- Audit fields are updated
- Success message is returned
- Update history is recorded

## Fields & Business Rules
| Field Name    | Description                 | Type    | Validation                                 | Required | Default Value | Example                        |
|--------------|-----------------------------|---------|---------------------------------------------|----------|---------------|---------------------------------|
| PracticeID   | Unique identifier           | guid    | Must be valid existing PracticeID           | Yes      | None          | "12345678-1234-1234-1234-123456789012" |
| PracticeName | Name of the practice        | string  | Must be unique if changed, Min 2, Max 50 characters | Yes | Existing Value | ".NET"                         |
| Description  | Description of the practice | string  | Max 500 characters                         | No       | Existing Value | "Microsoft .NET Development Practice" |
| IsActive     | Practice status             | boolean | Must be true or false                      | Yes      | Existing Value | true                            |
| UpdatedBy    | ID of user updating practice| string  | Must be current user ID                    | Yes      | None          | "user123"                      |
| Source       | Application source          | string  | Must be valid Application SourceID         | Yes      | None          | "WebApp"                        |

## System-Level Business Rules
- Cannot modify PracticeID

---
**Checklist:**
- [ ] Requirement reviewed and confirmed
- [ ] All fields and rules captured
- [ ] Linked to relevant documentation
