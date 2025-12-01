---
name: FR#LUR-20 – Get All Job Descriptions List (Simplified)
about: Minimal template for Get All Job Descriptions List
labels: enhancement, functional-requirement, lookup
assignees: ''
---

## Requirement Reference
- **Requirement ID:** FR#LUR-20
- **Source Document:** Requirement/Functional/V1/2#LookupReterival/FR#LUR-20 - Get All Job Descriptions List.md

## Description
System should allow retrieval of all job descriptions (paginated, filterable).

## Request/Response
- **Request:** PageNumber, PageSize, IsActive, SearchTerm
- **Response:** Items (array), TotalCount, PageNumber, PageSize, TotalPages

## User Roles
- Master Admin
- Practice Admin

## Checklist
- [ ] Requirement reviewed
- [ ] Fields and rules captured
- [ ] Refer to `agent.md` for coding standards
