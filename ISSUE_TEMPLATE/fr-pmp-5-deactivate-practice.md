---
name: FR#PMP-5 – Deactivate Practice
about: Functional Requirement - Deactivate Practice
labels: enhancement, functional-requirement
assignees: ''
---


## Functional Requirement Reference
- **Requirement ID:** FR#PMP-5
- **Module:** Practice Management
- **Source Document:** Requirement/Functional/V1/1#PracticeManagement/FR#PMP-5 - Deactivate Practice.md

## Technical References
- OpenAPI Contract: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateContracts.openapi.yml`
- Entity Definition: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateEntities.openapi.yml`

## Description
System should allow Master Admin to deactivate a practice while maintaining data integrity and handling associated members.

## User Roles
- Master Admin

## Personas and Permissions
- [Master Admin] Can deactivate any active practice. Not bound to any practice.
- Other roles cannot deactivate practices.

## Preconditions
- Practice must exist and be active
- User must be authenticated as Master Admin
- Practice must not have any active members
- All associated resources must be properly handled

## Postconditions
- Practice is marked as inactive
- Audit fields are updated
- Success message is returned
- Associated resources are properly handled
- Deactivation history is recorded

## Fields & Business Rules
| Field Name    | Description                 | Type    | Validation                                 | Required | Default Value | Example                        |
|--------------|-----------------------------|---------|---------------------------------------------|----------|---------------|---------------------------------|
| PracticeID   | Unique identifier           | guid    | Must be valid existing PracticeID           | Yes      | None          | "12345678-1234-1234-1234-123456789012" |
| Reason       | Deactivation reason         | string  | Max 500 characters                         | Yes      | None          | "Practice merged with .NET Core practice" |
| UpdatedBy    | ID of user deactivating     | string  | Must be current user ID                    | Yes      | None          | "user123"                      |
| Source       | Application source          | string  | Must be valid Application SourceID         | Yes      | None          | "WebApp"                        |

## System-Level Business Rules
- Cannot deactivate already inactive practice
- Must verify no active members exist

---
**Checklist:**
- [ ] Requirement reviewed and confirmed
- [ ] All fields and rules captured
- [ ] Linked to relevant documentation
