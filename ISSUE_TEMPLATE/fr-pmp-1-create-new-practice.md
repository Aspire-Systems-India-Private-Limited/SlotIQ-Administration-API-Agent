---
name: FR#PMP-1 – Create New Practice
about: Functional Requirement - Create New Practice
labels: enhancement, functional-requirement
assignees: ''
---


## Functional Requirement Reference
- **Requirement ID:** FR#PMP-1
- **Module:** Practice Management
- **Source Document:** Requirement/Functional/V1/1#PracticeManagement/FR#PMP-1 - Create New Practice.md

## Technical References
- OpenAPI Contract: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateContracts.openapi.yml`
- Entity Definition: `Requirement/Technical/AdministrationAggregate/AdministrationAggregateEntities.openapi.yml`

## Description
System should allow Master Admin to create new practices in the system. Each practice represents a business unit or department that can have its own members and administrators.

## User Roles
- Master Admin

## Personas and Permissions
- [Master Admin] Can create new practices. Not bound to any practice.
- Other roles cannot create practices.

## Preconditions
- User must be authenticated
- User must have Master Admin role
- Practice name must be unique in the system

## Postconditions
- New practice is created in the system
- Practice ID is generated
- Audit fields are set
- Success message is returned with PracticeID

## Fields & Business Rules
| Field Name    | Description                   | Type    | Validation                                 | Required | Default Value | Example                        |
|--------------|-------------------------------|---------|---------------------------------------------|----------|---------------|---------------------------------|
| PracticeName | Name of the practice          | string  | Must be unique, Min 2, Max 50 characters   | Yes      | None          | ".NET"                         |
| Description  | Description of the practice   | string  | Max 500 characters                         | No       | None          | "Microsoft .NET Development Practice" |
| IsActive     | Practice status               | boolean | Must be true for new practice              | Yes      | true          | true                            |
| UpdatedBy    | ID of user creating practice  | string  | Must be current user ID                    | Yes      | None          | "user123"                      |
| Source       | Application source            | string  | Must be valid Application SourceID         | Yes      | None          | "WebApp"                        |

## System-Level Business Rules
- PracticeID is a system-generated GUID
- CreatedDate and ModifiedDate must be set to current date and time
- ModUser must be set to current user ID

---
**Checklist:**
- [ ] Requirement reviewed and confirmed
- [ ] All fields and rules captured
- [ ] Linked to relevant documentation
