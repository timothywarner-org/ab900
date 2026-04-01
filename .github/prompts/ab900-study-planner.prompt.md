---
name: ab900-study-planner
description: "Generate a personalized AB-900 study plan based on your confidence ratings across the three exam domains."
argument-hint: "Rate your confidence: 'Domain 1: Strong, Domain 2: Weak, Domain 3: Moderate'"
agent: ab900-cert-buddy-agent
tools:
  - ab900buddy-context7/*
  - ab900buddy-markitdown/*
  - ab900buddy-mslearn/*
---

# AB-900 Study Planner

Generate a **personalized AB-900 study plan** based on your confidence across the three exam domains.

## Use this skill

You must follow the workspace skill **ab900-study-planner** for workflow, domain-specific guidance, output format, and **delivery rules** (full plan in a single message).

## Inputs (from chat)

- Domain 1 confidence: ${input:domain1:Strong | Moderate | Weak | Unknown}
- Domain 2 confidence: ${input:domain2:Strong | Moderate | Weak | Unknown}
- Domain 3 confidence: ${input:domain3:Strong | Moderate | Weak | Unknown}

## Grounding and validation rules

1. Ground all Microsoft Learn module links in **Microsoft Learn** using the **Microsoft Learn MCP** server and Copilot web search. Do not invent Learn URLs.
2. Use the AB-900 exam skills outline for objective mapping.
3. Prioritize weak domains first. Within equal confidence levels, prioritize by exam weight (Domain 2 first at 35-40%).

## Terminology

Always use current Microsoft product names. Apply all mappings from the agent terminology table silently. Never use "Azure AD" (use "Microsoft Entra ID"), "compliance.microsoft.com" (use "purview.microsoft.com"), "per message" (use "per Copilot Credit"), "AI hub" (use "DSPM for AI (classic)"), or "Billing > Billing policies" (use "Copilot > Billing & usage").

## Output format

Use the Markdown output format defined in the **ab900-study-planner** skill exactly. The output must include: domain priority order, confidence rating, estimated study hours, focus objectives, high-priority topics, Microsoft Learn module links, total hours, and an offer to start practicing.

## Style rules

- No contractions.
- Do not skip any domain, even if rated Strong (include a light review recommendation).
- Treat "Unknown" the same as "Weak."
- Flag Domain 2 as the highest-weight domain whenever its confidence rating is Weak or Unknown.
- All product names and navigation paths must use current terminology.
