---
name: FR#LUR-16 – Get All Schedule Statuses List (Simplified)
about: Minimal template for Get All Schedule Statuses List
labels: enhancement, functional-requirement, lookup
assignees: ''
---

## Requirement Reference
- **Requirement ID:** FR#LUR-16
- **Source Document:** Requirement/Functional/V1/2#LookupReterival/FR#LUR-16 - Get All Schedule Statuses List.md

## Description
System should allow retrieval of all schedule statuses (paginated, filterable).

## Request/Response
- **Request:** PageNumber, PageSize, IsActive, SearchTerm
- **Response:** Items (array)

## User Roles
- Master Admin
- Practice Admin
- Tech Team Panel Member
- TA Team Admin

## Checklist
- [ ] Requirement reviewed
- [ ] Fields and rules captured
- [ ] Refer to `agent.md` for coding standards
