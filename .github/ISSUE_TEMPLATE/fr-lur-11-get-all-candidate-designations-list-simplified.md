---
name: FR#LUR-11 – Get All Candidate Designations List (Simplified)
about: Minimal template for Get All Candidate Designations List
labels: enhancement, functional-requirement, lookup
assignees: ''
---

## Requirement Reference
- **Requirement ID:** FR#LUR-11
- **Source Document:** Requirement/Functional/V1/2#LookupReterival/FR#LUR-11 - Get All Candidate Designations List.md

## Description
System should allow retrieval of all candidate designations (paginated, filterable).

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
