# Demos

This directory contains demonstration materials for Segment 2.

## Available Demos

### Demo 1: End-to-End Data Protection
Comprehensive demonstration of implementing layered security controls and how Copilot respects protection policies.

### Demo 2: DLP in Action
Live demonstration of DLP policies blocking sensitive data, user experience with policy tips, and administrator alert workflows.

### Demo 3: Sensitivity Labels with Copilot
Applying labels to documents, Copilot interaction with labeled content, and demonstrating access restrictions.

### Demo 4: Compliance Reporting
Overview of compliance score, improvement actions, audit log analysis, and eDiscovery investigations.

## Running the Demos

1. Sign in to the Microsoft Purview portal at purview.microsoft.com
2. Have sample sensitive data ready for testing
3. Configure demo environment with test policies
4. Follow demo scripts step-by-step
5. Show both user and admin perspectives

## Prerequisites

- Microsoft Purview portal access (purview.microsoft.com). Do **NOT** use the retired compliance.microsoft.com.
- Global Administrator or Compliance Administrator role
- Test documents with various sensitivity levels
- Sample sensitive information for DLP testing
- Non-production environment recommended

## Live demo cautions

- Verify the DSPM entries in the portal before you screen-share. Learners will see **DSPM**, **Data Security Posture Management (classic)**, and **DSPM for AI (classic)** side by side.
- Content Search is inside **eDiscovery** now. There is no standalone Content Search node.
- The current sensitive-data discovery tool is **Data explorer** under Information Protection. The old one is labeled **Content Explorer (classic)** under Data Lifecycle Management.
