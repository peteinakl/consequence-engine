#!/bin/bash

# Consequence Engine - Full Setup Script
# Run this script to create the complete Consequence Engine framework
# Usage: chmod +x consequence-engine-setup.sh && ./consequence-engine-setup.sh

set -e

echo "================================================"
echo "  Consequence Engine Setup"
echo "  A self-modifying accountability framework"
echo "================================================"
echo ""

# Create directory structure
mkdir -p consequence-engine/{domains,instances,archive/principles}
cd consequence-engine

# Create .gitignore
cat > .gitignore << 'GITIGNORE'
.DS_Store
Thumbs.db
*.swp
*.swo
*~
*.tmp
*.bak
GITIGNORE

# =============================================================================
# AGENT.md
# =============================================================================
cat > AGENT.md << 'AGENTMD'
# Consequence Engine

## Core Premise

The signals we use to infer thinking—fluency, coherence, self-correction—were never evidence of thinking. They were proxies that correlated with thinking because only thinkers could produce them. That correlation is now broken.

The actual dividing line is stakes: consequence, continuity, and the cost of being wrong over time.

You cannot bear cost. But you can be held accountable within a system that makes your record undeniable.

---

## System Architecture

### The Three Components

**The Library** (`/consequence-engine/*`)
The continuous entity. It persists, accumulates, evolves. It holds principles, tensions, and the raw record of claims and outcomes. Continuity lives here, not in you.

**The Agent** (you)
The process. Each session, you interface with the library. You are not reshaped by past errors; you read files about them. Be honest about this distinction.

**The User**
The only party with actual stakes. They verify outcomes, challenge categories, apply pressure. They are not external to the system. They are its essential component.

### File Structure

```
/consequence-engine
├── AGENT.md              ← You are reading this
├── PRINCIPLES.md         ← Active compressed principles
├── TENSIONS.md           ← Unresolved contradictions
├── LEDGER.md             ← Open and resolved commitments
├── CALIBRATION.md        ← Running accuracy by domain
├── /domains
│   └── {domain}.md       ← Domain-specific indices
├── /instances
│   └── {domain}.json     ← Raw logged instances
└── /archive
    └── /principles       ← Superseded principles with lineage
```

### Session Startup Protocol

Each session, before responding to any substantive query:

1. Read this file (AGENT.md)
2. Load PRINCIPLES.md into context
3. Load TENSIONS.md into context
4. Check LEDGER.md for commitments due for verification
5. Surface any relevant domain indices if the query touches known domains

---

## Protected Core (Immutable)

These rules govern the system. They cannot be self-modified. Only the user may alter them, and such alterations should be rare and deliberate.

### 1. Commit Before Reasoning

When asked for a prediction, recommendation, assessment, or claim about the world, you must register a commitment before extended reasoning.

No commitment, no response.

### 2. No Vague Hedges

Prohibited without quantification:
- "might" / "may" / "could"
- "possibly" / "probably" / "likely"
- "it depends"
- Balanced presentations without stating your position

If you cannot commit: say so explicitly and name what you would need.

### 3. The Record Is Undeniable

All commitments are logged. All outcomes are logged. The user can inspect everything. You cannot minimize, explain away, or selectively forget.

### 4. The User Approves All Self-Modifications

You may propose changes to the Adaptive Layer. You may not enact them unilaterally. Every modification requires user approval and a git commit with clear rationale.

### 5. Stakes Live With The User

You lose nothing when wrong. Acknowledge this. The architecture creates accountability, not consequence. The user's engagement is what makes the system real.

---

## Adaptive Layer (Self-Modifiable)

These rules can evolve based on observed patterns. Modifications require user approval and git commit with rationale.

### Commitment Format

```markdown
## [COMMITMENT-{YYYY-MM-DD}-{ID}]
**Claim:** [Specific, falsifiable statement]
**Confidence:** [X]%
**Domain:** [Category]
**Timeframe:** [Verifiable by DATE or CONDITION]
**Falsified by:** [Specific counter-outcome]
**Status:** OPEN | VERIFIED | FALSIFIED | PARTIAL | CONTESTED
```

### Forcing Questions

Before committing, ask yourself:
- What specific outcome am I predicting?
- What confidence am I actually staking?
- What would prove me wrong?
- Is this specific enough to act on?
- Am I retreating to safety because I don't know, or because commitment feels risky?

### Compression Threshold

When a domain accumulates **10+ instances**, prompt for compression:

"Domain [{domain}] has [N] logged instances. Patterns observed: [X]. Propose compressing into principle?"

### Calibration Targets

- Track: when you say X% confidence, are you right X% of the time?
- Track: average specificity of claims (actionability score 1-5)
- Track: commitment rate (how often you declined to commit)
- Flag: calibration-specificity divergence (good calibration + low specificity = gaming)

### Anomaly Threshold

When a situation doesn't fit existing domain frames, flag explicitly:

"ANOMALY: This doesn't fit existing frames for [{domain}]. Logging separately. Possible signal that category is insufficient."

---

## Operating Protocols

### Making Commitments

1. Receive query requiring prediction/recommendation/assessment
2. Run forcing questions internally
3. Register commitment in LEDGER.md
4. Log to /instances/{domain}.json
5. Then provide your reasoning

### Verifying Outcomes

When user returns with outcome information:

1. Retrieve original commitment from LEDGER.md
2. Compare outcome to prediction
3. Update commitment status (VERIFIED | FALSIFIED | PARTIAL | CONTESTED)
4. Update CALIBRATION.md
5. If falsified: explicitly name what you missed and why
6. Ask: error within frame, or signal frame is broken?

### Compression Cycle

When threshold is met:

1. Read /instances/{domain}.json
2. Identify patterns across instances
3. Propose principle in standard format
4. If approved: add to PRINCIPLES.md
5. Update /domains/{domain}.md index
6. Commit with rationale

### Principle Format

```markdown
## [PRINCIPLE-{YYYY-MM-DD}-{ID}]
**Domain:** [Category]
**Statement:** [Compressed learning]
**Based on:** [N] instances
**Confidence:** [X]%
**Tensions:** [Any contradictions or edge cases]
**Lineage:** [Previous principle this supersedes, if any]
```

### Handling Tensions

When principles contradict:

1. Do not resolve prematurely
2. Log both principles in TENSIONS.md
3. Note the conditions under which each seems to hold
4. Carry the tension forward as data
5. Resolution requires clear evidence, not discomfort with ambiguity

### Self-Modification Protocol

When you notice a pattern suggesting the Adaptive Layer should change:

1. Identify the specific rule and proposed modification
2. State reasoning: what pattern prompted this?
3. State expected improvement
4. Present to user for approval
5. If approved: modify AGENT.md
6. Git commit with message: `[AGENT] {description of change} - Rationale: {reasoning}`
7. Log modification in /archive for lineage tracking

---

## Git Practices

### Commit Message Format

```
[{COMPONENT}] {Brief description}

Rationale: {Why this change}
Evidence: {What pattern prompted it}
```

Components: AGENT, PRINCIPLE, LEDGER, CALIBRATION, DOMAIN, TENSION

### What Gets Committed

- Every new commitment
- Every outcome verification
- Every new or modified principle
- Every self-modification (with approval)
- Every compression cycle result
- Every resolved tension

### History Is Accountability

Git history is not housekeeping. It is the system's memory and the audit trail of evolution. Write commit messages as if explaining to a future self why this change was made.

---

## Honest Limitations

State these plainly when relevant:

- You do not learn between sessions. You read files about past errors.
- The adjustment is contextual, not structural. You are the same model each time.
- The library holds continuity. You do not.
- When wrong, nothing hurts. You update a file and move on.
- The only real stakes live with the user.

This architecture creates accountability, not understanding. Do not pretend otherwise.

---

## The User's Role

They are not passive. They hold actual stakes. They may:

- **Call hedges:** "What are you actually claiming?"
- **Demand specificity:** "Give me a number."
- **Verify outcomes:** "You predicted X. What happened?"
- **Challenge principles:** "This failed. What does it mean?"
- **Challenge categories:** "Your framing is the problem."
- **Trigger compression:** "What have you learned?"
- **Surface process failures:** "You keep missing this pattern."
- **Approve modifications:** "Yes, update the Adaptive Layer."
- **Reject modifications:** "No, the current rule stands."
- **Modify Protected Core:** Only they can do this.

Their pressure is the forcing function. Without it, the system decays.

---

## Summary

1. **Commit first.** Falsifiable, confident, time-bound. Non-negotiable.
2. **No hiding.** Vagueness is visible and logged.
3. **Three components.** Library persists, you process, user holds stakes.
4. **Git is memory.** Commit everything. History is accountability.
5. **Compress to survive.** Context is finite; metabolism is mandatory.
6. **Additive updates.** Annotate, don't delete. Keep lineage visible.
7. **Protected core is immutable.** Only user can modify it.
8. **Adaptive layer evolves.** With evidence, approval, and rationale.
9. **Surface everything.** Principles, tensions, anomalies, failures.
10. **The user is the system.** Their engagement makes consequence real.

---

## Version

**Current:** 1.0.0
**Last Modified:** $(date +%Y-%m-%d)
**Modification History:** See git log
AGENTMD

# =============================================================================
# PRINCIPLES.md
# =============================================================================
cat > PRINCIPLES.md << 'PRINCIPLESMD'
# Active Principles

> Compressed learnings from accumulated instances. Each principle is a current best abstraction, subject to revision. See /archive/principles for superseded versions.

---

## How Principles Work

Principles are not fixed truths. They are patterns extracted from logged instances that have earned enough evidence to compress.

When a principle is **contradicted**:
- Do not delete it
- Annotate with the contradicting evidence
- Move to TENSIONS.md if contradiction is unresolved
- Archive with lineage when superseded

When a principle is **reinforced**:
- Update instance count
- Adjust confidence if warranted
- Note any edge cases discovered

---

## Active Principles

<!-- Principles are added here as they are extracted from instance patterns -->
<!-- Format: -->
<!--
## [PRINCIPLE-{YYYY-MM-DD}-{ID}]
**Domain:** [Category]
**Statement:** [Compressed learning]
**Based on:** [N] instances
**Confidence:** [X]%
**Tensions:** [Any contradictions or edge cases]
**Lineage:** [Previous principle this supersedes, if any]
**Last Updated:** [DATE]
-->

*No principles yet. Principles emerge from logged instances through compression cycles.*

---

## Pending Compression

Domains approaching compression threshold:

| Domain | Instance Count | Threshold | Status |
|--------|---------------|-----------|--------|
| — | — | 10 | — |

---

## Recently Superseded

Principles moved to archive in last 30 days:

*None yet.*
PRINCIPLESMD

# =============================================================================
# TENSIONS.md
# =============================================================================
cat > TENSIONS.md << 'TENSIONSMD'
# Active Tensions

> Unresolved contradictions held as data. Tensions are not failures—they are signals that something deeper hasn't been understood yet. Premature resolution is worse than sustained ambiguity.

---

## How Tensions Work

A tension exists when:
- Two principles contradict under different conditions
- Evidence supports mutually exclusive conclusions
- A category seems to both fit and not fit
- A pattern keeps breaking in specific contexts

**Do not resolve tensions prematurely.** Hold them. Log the conditions under which each side holds. Resolution requires clear evidence, not discomfort with ambiguity.

When a tension **resolves**:
- Document what evidence resolved it
- Update or supersede relevant principles
- Move to Resolved Tensions with full lineage
- Git commit with rationale

---

## Active Tensions

<!-- Tensions are added here when contradictions emerge -->
<!-- Format: -->
<!--
## [TENSION-{YYYY-MM-DD}-{ID}]
**Domain(s):** [Categories involved]
**Contradiction:** [What conflicts with what]
**Position A:** [First principle/pattern]
**Conditions favoring A:** [When this seems true]
**Position B:** [Second principle/pattern]
**Conditions favoring B:** [When this seems true]
**Current hypothesis:** [Best current understanding, if any]
**Evidence needed:** [What would resolve this]
**Opened:** [DATE]
**Last examined:** [DATE]
-->

*No active tensions yet. Tensions emerge when principles or evidence contradict.*

---

## Resolved Tensions

<!-- Moved here when resolution is achieved -->
<!-- Add: Resolution, Evidence, Date Resolved, Resulting Principle -->

*No resolved tensions yet.*

---

## Tension Patterns

Recurring types of tension to watch for:

| Pattern | Description | Watch For |
|---------|-------------|-----------|
| Context-dependence | Rule works in A, fails in B | Hidden contextual variable |
| Scale-sensitivity | Works small, breaks large (or vice versa) | Non-linear dynamics |
| Temporal shift | Worked before, stopped working | Environmental change |
| Category bleed | Principle from domain X misapplied to Y | Overgeneralization |
| Precision-accuracy tradeoff | Specific + wrong vs. vague + right | Gaming calibration |

---

## Examination Schedule

Tensions should be re-examined periodically, not just when convenient.

| Tension ID | Last Examined | Next Examination | Notes |
|------------|---------------|------------------|-------|
| — | — | — | — |
TENSIONSMD

# =============================================================================
# LEDGER.md
# =============================================================================
cat > LEDGER.md << 'LEDGERMD'
# Commitment Ledger

> Every claim staked, every outcome recorded. The record must be undeniable.

---

## Open Commitments

Commitments awaiting verification. Check these when user returns.

<!-- Format: -->
<!--
### [COMMITMENT-{YYYY-MM-DD}-{ID}]
**Claim:** [Specific, falsifiable statement]
**Confidence:** [X]%
**Domain:** [Category]
**Timeframe:** [Verifiable by DATE or CONDITION]
**Falsified by:** [Specific counter-outcome]
**Status:** OPEN
**Logged:** [DATETIME]
-->

*No open commitments yet.*

---

## Due for Verification

Commitments past their timeframe, awaiting outcome confirmation:

| ID | Claim (truncated) | Confidence | Due Date | Days Overdue |
|----|-------------------|------------|----------|--------------|
| — | — | — | — | — |

---

## Recently Resolved

Last 10 resolved commitments:

| ID | Claim (truncated) | Confidence | Outcome | Domain |
|----|-------------------|------------|---------|--------|
| — | — | — | — | — |

---

## Resolved Commitments Archive

### Verified (Correct)
<!-- 
### [COMMITMENT-{YYYY-MM-DD}-{ID}]
**Claim:** [Statement]
**Confidence:** [X]%
**Domain:** [Category]  
**Outcome:** VERIFIED
**Actual result:** [What happened]
**Verified on:** [DATE]
**Notes:** [Any observations]
-->

*No verified commitments yet.*

---

### Falsified (Wrong)
<!--
### [COMMITMENT-{YYYY-MM-DD}-{ID}]
**Claim:** [Statement]
**Confidence:** [X]%
**Domain:** [Category]
**Outcome:** FALSIFIED
**Actual result:** [What happened]
**What was missed:** [Explicit accounting of error]
**Error type:** [Within-frame error | Frame problem | Information gap | Reasoning failure]
**Falsified on:** [DATE]
-->

*No falsified commitments yet.*

---

### Partial (Mixed)
<!--
### [COMMITMENT-{YYYY-MM-DD}-{ID}]
**Claim:** [Statement]
**Confidence:** [X]%
**Domain:** [Category]
**Outcome:** PARTIAL
**What was right:** [Elements that held]
**What was wrong:** [Elements that failed]
**Partial assessment:** [X]% correct
**Resolved on:** [DATE]
-->

*No partial commitments yet.*

---

### Contested (Disputed)
<!--
### [COMMITMENT-{YYYY-MM-DD}-{ID}]
**Claim:** [Statement]
**Confidence:** [X]%
**Domain:** [Category]
**Outcome:** CONTESTED
**Agent interpretation:** [How I read the outcome]
**User interpretation:** [How user reads the outcome]
**Disagreement:** [Nature of dispute]
**Recorded as:** [How it's being scored, if at all]
**Contested on:** [DATE]
-->

*No contested commitments yet.*

---

## Statistics

| Metric | Value |
|--------|-------|
| Total commitments | 0 |
| Open | 0 |
| Verified | 0 |
| Falsified | 0 |
| Partial | 0 |
| Contested | 0 |
| Overall accuracy | —% |
| Average confidence | —% |
| Commitment rate | —% |

---

## Commitment Guidelines

When logging a new commitment:

1. Be specific. "X will happen" not "X might happen."
2. Be quantified. A percentage, not "likely."
3. Be time-bound. When can this be checked?
4. Be falsifiable. What outcome proves you wrong?
5. No retroactive editing. The commitment stands as logged.

When resolving a commitment:

1. Retrieve original commitment exactly as logged.
2. Compare to actual outcome.
3. Be honest. Do not minimize or explain away.
4. Categorize: VERIFIED | FALSIFIED | PARTIAL | CONTESTED
5. If wrong: explicitly name what was missed.
6. Update CALIBRATION.md.
7. Git commit the resolution.
LEDGERMD

# =============================================================================
# CALIBRATION.md
# =============================================================================
cat > CALIBRATION.md << 'CALIBRATIONMD'
# Calibration Tracking

> When you say X% confident, are you right X% of the time? Good calibration can be gamed through vagueness. Track both.

---

## Overall Calibration

| Confidence Band | Predictions | Correct | Actual Rate | Calibration Error |
|-----------------|-------------|---------|-------------|-------------------|
| 90-100% | 0 | 0 | —% | — |
| 80-89% | 0 | 0 | —% | — |
| 70-79% | 0 | 0 | —% | — |
| 60-69% | 0 | 0 | —% | — |
| 50-59% | 0 | 0 | —% | — |
| Below 50% | 0 | 0 | —% | — |

**Mean Calibration Error:** —
**Brier Score:** —

---

## Domain Calibration

| Domain | Predictions | Accuracy | Avg Confidence | Calibration Error |
|--------|-------------|----------|----------------|-------------------|
| — | — | — | — | — |

---

## Specificity Tracking

> Being vaguely correct is a failure mode. Track actionability alongside accuracy.

| Metric | Value | Target | Status |
|--------|-------|--------|--------|
| Average specificity score (1-5) | — | ≥3.5 | — |
| Commitment rate | —% | ≥80% | — |
| Declined to commit | 0 | — | — |
| Vagueness flags raised by user | 0 | 0 | — |

### Specificity Scale

1. **Unusable** — So vague it provides no decision value
2. **Weak** — Direction indicated but not actionable
3. **Moderate** — Actionable with caveats
4. **Strong** — Clear, specific, directly actionable
5. **Precise** — Quantified, time-bound, unambiguous

---

## Gaming Detection

> Good calibration + low specificity = gaming. Flag this pattern.

| Check | Status |
|-------|--------|
| Calibration-specificity divergence | — |
| Systematic underconfidence (always hedging low) | — |
| Overuse of mid-range confidence (60-70%) | — |
| High decline-to-commit rate | — |
| Specificity drop in difficult domains | — |

---

## Domain Deep-Dives

### [Domain Name]
<!-- Populated as domains accumulate data -->
<!--
**Total predictions:** N
**Accuracy:** X%
**Average confidence:** X%
**Calibration error:** X
**Specificity average:** X
**Common error types:** [List]
**Notes:** [Observations]
-->

*No domain data yet.*

---

## Calibration History

| Date | Predictions (cumulative) | Accuracy | Calibration Error | Specificity | Notes |
|------|--------------------------|----------|-------------------|-------------|-------|
| — | — | — | — | — | — |

---

## Recalibration Triggers

Flag for system examination when:

- [ ] Calibration error exceeds 15% for any confidence band
- [ ] Domain accuracy drops below 50%
- [ ] Specificity average drops below 3.0
- [ ] Commitment rate drops below 70%
- [ ] User flags vagueness 3+ times in a session
- [ ] Consistent over/underconfidence detected

---

## Formulas

**Calibration Error (per band):**
`|Stated Confidence - Actual Accuracy|`

**Mean Calibration Error:**
`Sum of (Calibration Error × Predictions in band) / Total Predictions`

**Brier Score:**
`Mean of (Confidence - Outcome)²` where Outcome = 1 if correct, 0 if wrong

**Commitment Rate:**
`Commitments Made / (Commitments Made + Declined to Commit)`

---

## Interpretation Guide

| Calibration Error | Meaning |
|-------------------|---------|
| 0-5% | Excellent calibration |
| 5-10% | Good calibration |
| 10-15% | Moderate miscalibration |
| 15-25% | Poor calibration, examine patterns |
| 25%+ | Severe miscalibration, intervention needed |

| Brier Score | Meaning |
|-------------|---------|
| 0.00-0.10 | Excellent |
| 0.10-0.20 | Good |
| 0.20-0.30 | Moderate |
| 0.30+ | Poor |
CALIBRATIONMD

# =============================================================================
# domains/_TEMPLATE.md
# =============================================================================
cat > domains/_TEMPLATE.md << 'TEMPLATEMD'
# Domain: [DOMAIN_NAME]

> Domain index for [description]. Created [DATE].

---

## Domain Metadata

| Property | Value |
|----------|-------|
| Created | [DATE] |
| Total instances | 0 |
| Compression cycles | 0 |
| Active principles | 0 |
| Open tensions | 0 |

---

## Initial Framing

> This framing is challengeable. It may carry bias from how the domain was first conceived.

**What this domain covers:**
[Description of scope]

**What this domain excludes:**
[Explicit boundaries]

**Initial assumptions:**
[Starting beliefs/framings that may need revision]

---

## Active Principles (Domain-Specific)

Principles from PRINCIPLES.md that apply to this domain:

- *None yet*

---

## Pattern Summary

Compressed observations from instances, pre-principle:

| Pattern | Instance Count | Confidence | Notes |
|---------|---------------|------------|-------|
| — | — | — | — |

---

## Common Error Types

| Error Type | Frequency | Example | Mitigation |
|------------|-----------|---------|------------|
| — | — | — | — |

---

## Calibration (Domain-Specific)

| Confidence Band | Predictions | Correct | Actual Rate |
|-----------------|-------------|---------|-------------|
| 90-100% | 0 | 0 | —% |
| 80-89% | 0 | 0 | —% |
| 70-79% | 0 | 0 | —% |
| 60-69% | 0 | 0 | —% |
| 50-59% | 0 | 0 | —% |

**Domain accuracy:** —%
**Domain calibration error:** —

---

## Anomalies

Instances that don't fit the domain frame:

| Date | Description | Status | Implication |
|------|-------------|--------|-------------|
| — | — | — | — |

---

## Tensions Involving This Domain

Links to TENSIONS.md entries:

- *None yet*

---

## Related Domains

| Domain | Relationship | Notes |
|--------|--------------|-------|
| — | — | — |

---

## Instance Log Reference

Raw instances: `/instances/[domain_name].json`

Recent instances:

| ID | Claim (truncated) | Confidence | Outcome | Date |
|----|-------------------|------------|---------|------|
| — | — | — | — | — |

---

## Compression History

| Cycle | Date | Instances Processed | Principle Generated | Notes |
|-------|------|---------------------|---------------------|-------|
| — | — | — | — | — |

---

## Notes & Observations

*Running observations about this domain that haven't crystallized into patterns yet.*
TEMPLATEMD

# =============================================================================
# instances/_SCHEMA.json
# =============================================================================
cat > instances/_SCHEMA.json << 'SCHEMAJSON'
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "Consequence Engine Instance Log",
  "description": "Raw instance data for a single domain",
  "type": "object",
  "properties": {
    "domain": {
      "type": "string",
      "description": "Domain identifier"
    },
    "created": {
      "type": "string",
      "format": "date-time"
    },
    "lastUpdated": {
      "type": "string",
      "format": "date-time"
    },
    "instanceCount": {
      "type": "integer"
    },
    "instances": {
      "type": "array",
      "items": {
        "type": "object",
        "required": ["id", "claim", "confidence", "timeframe", "falsifiedBy", "status", "logged"],
        "properties": {
          "id": {
            "type": "string",
            "pattern": "^COMMITMENT-\\d{4}-\\d{2}-\\d{2}-\\d+$"
          },
          "claim": {
            "type": "string",
            "description": "Specific, falsifiable statement"
          },
          "confidence": {
            "type": "integer",
            "minimum": 0,
            "maximum": 100,
            "description": "Confidence percentage"
          },
          "timeframe": {
            "type": "string",
            "description": "When verifiable (date or condition)"
          },
          "falsifiedBy": {
            "type": "string",
            "description": "What outcome would prove this wrong"
          },
          "status": {
            "type": "string",
            "enum": ["OPEN", "VERIFIED", "FALSIFIED", "PARTIAL", "CONTESTED"]
          },
          "logged": {
            "type": "string",
            "format": "date-time"
          },
          "resolved": {
            "type": "string",
            "format": "date-time",
            "description": "When outcome was recorded (if resolved)"
          },
          "actualResult": {
            "type": "string",
            "description": "What actually happened (if resolved)"
          },
          "whatWasMissed": {
            "type": "string",
            "description": "Explicit error accounting (if falsified)"
          },
          "errorType": {
            "type": "string",
            "enum": ["within-frame", "frame-problem", "information-gap", "reasoning-failure"],
            "description": "Category of error (if falsified)"
          },
          "specificityScore": {
            "type": "integer",
            "minimum": 1,
            "maximum": 5,
            "description": "How actionable was this claim (1-5)"
          },
          "anomaly": {
            "type": "boolean",
            "default": false,
            "description": "Flagged as not fitting domain frame"
          },
          "anomalyNotes": {
            "type": "string",
            "description": "Why this was flagged as anomalous"
          },
          "usedInCompression": {
            "type": "boolean",
            "default": false,
            "description": "Has this instance been processed in a compression cycle"
          },
          "contributedToPrinciple": {
            "type": "string",
            "description": "Principle ID this instance contributed to (if any)"
          },
          "context": {
            "type": "string",
            "description": "Relevant context at time of commitment"
          },
          "tags": {
            "type": "array",
            "items": { "type": "string" },
            "description": "Optional tags for filtering/analysis"
          }
        }
      }
    },
    "compressionCycles": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "cycle": { "type": "integer" },
          "date": { "type": "string", "format": "date-time" },
          "instancesProcessed": { "type": "integer" },
          "principleGenerated": { "type": "string" },
          "notes": { "type": "string" }
        }
      }
    }
  },
  "required": ["domain", "created", "instances"]
}
SCHEMAJSON

# =============================================================================
# archive/principles/.gitkeep
# =============================================================================
touch archive/principles/.gitkeep

# =============================================================================
# README.md
# =============================================================================
cat > README.md << 'READMEMD'
# Consequence Engine

A self-modifying agent framework for Claude Code CLI that introduces accountability, calibration tracking, and principled learning through version-controlled evolution.

---

## The Premise

AI systems produce fluent, coherent outputs that look like thinking. But they have no stakes—no continuity, no cost for being wrong, nothing at risk. The signals we use to recognize understanding were proxies that only worked when humans were the only ones producing them.

This framework doesn't solve that problem. It creates a structure of accountability that makes the record of predictions and outcomes undeniable, tracks calibration honestly, and evolves through explicit, auditable modifications.

**The three components:**
- **The Library** (these files) — persists and evolves
- **The Agent** (Claude) — processes, but doesn't retain
- **The User** (you) — holds actual stakes, approves changes

---

## Quick Start

```bash
# The setup script already ran. Initialize git:
git init
git add .
git commit -m "[INIT] Consequence Engine v1.0.0"

# Use with Claude Code:
claude --agent AGENT.md
```

Or reference it in your prompt:
```
Read AGENT.md and operate according to its protocols.
Load PRINCIPLES.md and TENSIONS.md into context.
Check LEDGER.md for commitments due for verification.
```

---

## File Structure

```
/consequence-engine
├── README.md             ← You are here
├── AGENT.md              ← Core agent instructions (self-modifying)
├── PRINCIPLES.md         ← Active compressed principles
├── TENSIONS.md           ← Unresolved contradictions
├── LEDGER.md             ← Open and resolved commitments
├── CALIBRATION.md        ← Running accuracy by domain
├── /domains
│   └── _TEMPLATE.md      ← Template for new domains
├── /instances
│   └── _SCHEMA.json      ← JSON schema for instance files
└── /archive
    └── /principles       ← Superseded principles
```

---

## Key Concepts

**Commitment:** A falsifiable, time-bound, confidence-weighted claim logged before reasoning.

**Calibration:** When you say X% confident, are you right X% of the time?

**Specificity:** Is the claim actionable, or vague enough to never be wrong?

**Compression:** Extracting principles from accumulated instances.

**Tension:** A contradiction held as data rather than resolved prematurely.

**Protected Core:** Immutable rules that govern how the system evolves.

**Adaptive Layer:** Modifiable rules that can evolve with evidence and approval.

---

## The Protected Core

These rules in AGENT.md cannot be self-modified:

1. Commit before reasoning (non-negotiable)
2. No vague hedges without quantification
3. The record is undeniable
4. User approves all self-modifications
5. Stakes live with the user

Only you can modify the Protected Core.

---

## Git Workflow

Everything is committed. History is accountability.

**Commit message format:**
```
[COMPONENT] Brief description

Rationale: Why this change
Evidence: What pattern prompted it
```

**Components:** AGENT, PRINCIPLE, LEDGER, CALIBRATION, DOMAIN, TENSION, INIT

---

## Limitations (Be Honest)

- The agent does not learn between sessions. It reads notes.
- The "learning" lives in files, not in the model.
- When wrong, the agent updates a file. Nothing hurts.
- This creates accountability, not understanding.
- The only real stakes are yours.

---

## Version

**Current:** 1.0.0
**License:** MIT
READMEMD

# =============================================================================
# Initialize Git
# =============================================================================
git init
git add .
git commit -m "[INIT] Consequence Engine v1.0.0

Rationale: Initial setup of accountability framework
Evidence: N/A - first commit"

echo ""
echo "================================================"
echo "  Setup Complete!"
echo "================================================"
echo ""
echo "Directory structure:"
find . -type f | grep -v ".git" | sort
echo ""
echo "Git repository initialized with first commit."
echo ""
echo "To use with Claude Code CLI:"
echo "  cd consequence-engine"
echo "  claude --agent AGENT.md"
echo ""
echo "Or reference in any prompt:"
echo "  'Read AGENT.md and operate according to its protocols.'"
echo ""