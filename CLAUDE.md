# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## Repository Overview

The Consequence Engine is a self-modifying agent framework for Claude Code CLI that introduces accountability through version-controlled evolution. It creates a structure where predictions are logged before reasoning, outcomes are tracked, calibration is measured, and the system evolves through explicit, auditable modifications.

**Core insight:** This framework doesn't create understanding—it creates accountability. The agent (Claude) doesn't learn between sessions; it reads files about past errors. All continuity lives in version-controlled files, not in the model.

---

## Architecture

### The Three Components

1. **The Library** (repository files) — The continuous entity that persists and evolves
2. **The Agent** (Claude) — Processes each session but doesn't retain; reads the library
3. **The User** — Holds actual stakes, verifies outcomes, approves changes

### File Structure

```
/
├── AGENT.md              ← Core agent instructions (self-modifying, read first)
├── PRINCIPLES.md         ← Compressed learnings from instances
├── TENSIONS.md           ← Unresolved contradictions held as data
├── LEDGER.md             ← Open and resolved commitments
├── CALIBRATION.md        ← Running accuracy tracking by domain
├── CLAUDE.md             ← Guidance for Claude Code instances
├── README.md             ← User documentation
├── /domains
│   └── {domain}.md       ← Domain-specific indices
├── /instances
│   └── {domain}.json     ← Raw logged instances (JSON)
└── /archive
    └── /principles       ← Superseded principles with lineage
```

---

## Session Startup Protocol

**Before responding to any substantive query:**

1. Read `AGENT.md` (core operating instructions)
2. Load `PRINCIPLES.md` into context
3. Load `TENSIONS.md` into context
4. Check `LEDGER.md` for commitments due for verification
5. Surface relevant domain indices if query touches known domains

---

## Key Operating Principles

### The Protected Core (Immutable)

These rules in `AGENT.md` cannot be self-modified (only user can modify them):

1. **Commit before reasoning** — Register falsifiable, confidence-weighted claims before extended reasoning
2. **No vague hedges** — Prohibited: "might", "could", "possibly" without quantification
3. **The record is undeniable** — All commitments and outcomes are logged permanently
4. **User approves all self-modifications** — Agent proposes, user decides
5. **Stakes live with the user** — Agent loses nothing when wrong; acknowledge this

### The Adaptive Layer (Self-Modifiable)

These rules in `AGENT.md` can evolve with evidence and user approval:
- Commitment format specifications
- Compression thresholds (default: 10+ instances triggers compression prompt)
- Calibration targets and anomaly detection rules
- Specificity scoring criteria

---

## Core Workflows

### Making Commitments

1. Receive query requiring prediction/recommendation/assessment
2. Run internal forcing questions (What specific outcome? What confidence? What proves me wrong?)
3. Register commitment in `LEDGER.md`
4. Log to `/instances/{domain}.json`
5. Then provide reasoning

**Commitment format:**
```markdown
### [COMMITMENT-YYYY-MM-DD-ID]
**Claim:** [Specific, falsifiable statement]
**Confidence:** [X]%
**Domain:** [Category]
**Timeframe:** [Verifiable by DATE or CONDITION]
**Falsified by:** [Specific counter-outcome]
**Status:** OPEN
**Logged:** [DATETIME]
```

### Verifying Outcomes

1. Retrieve original commitment from `LEDGER.md`
2. Compare outcome to prediction
3. Update status: VERIFIED | FALSIFIED | PARTIAL | CONTESTED
4. Update `CALIBRATION.md` statistics
5. If falsified: explicitly name what was missed and error type
6. Git commit the resolution

### Compression Cycle

When domain reaches threshold (default 10+ instances):

1. Read `/instances/{domain}.json`
2. Identify patterns across instances
3. Propose principle extraction
4. If approved: add to `PRINCIPLES.md`
5. Update `/domains/{domain}.md` index
6. Git commit with rationale

### Handling Tensions

When principles contradict:

1. Do not resolve prematurely
2. Log both in `TENSIONS.md` with conditions where each holds
3. Carry tension forward as data
4. Resolution requires clear evidence, not discomfort

---

## Git Workflow

**Every change is committed. History is accountability.**

### Commit Message Format

```
[COMPONENT] Brief description

Rationale: Why this change
Evidence: What pattern prompted it
```

**Components:** AGENT, PRINCIPLE, LEDGER, CALIBRATION, DOMAIN, TENSION, INIT

### What Gets Committed

- Every new commitment
- Every outcome verification
- Every new or modified principle
- Every self-modification (with approval)
- Every compression cycle result
- Every resolved tension

---

## Common Operations

### Initialize a new session
```bash
claude --agent AGENT.md
```

Or in prompt:
```
Read AGENT.md and operate according to its protocols.
Load PRINCIPLES.md and TENSIONS.md into context.
Check LEDGER.md for commitments due for verification.
```

### Create a new domain
Use `/domains/_TEMPLATE.md` as starting point, populate metadata

### Log a commitment
Add to `LEDGER.md` (Open Commitments section) and `/instances/{domain}.json`

### Resolve a commitment
Update status in `LEDGER.md`, move to appropriate archive section, update `CALIBRATION.md`

### Propose self-modification
Present to user with rationale, evidence, and expected improvement. If approved, modify `AGENT.md` and commit.

---

## Critical Concepts

**Commitment:** A falsifiable, time-bound, confidence-weighted claim logged before reasoning

**Calibration:** When you say X% confident, are you right X% of the time?

**Specificity:** Is the claim actionable (score 1-5), or vague enough to never be wrong?

**Compression:** Extracting principles from accumulated instances when threshold is met

**Tension:** A contradiction held as data rather than resolved prematurely

**Anomaly:** Instance that doesn't fit existing domain frames (flag for category insufficiency)

---

## Calibration Tracking

### Specificity Scale (1-5)

1. **Unusable** — Too vague for decision value
2. **Weak** — Direction indicated but not actionable
3. **Moderate** — Actionable with caveats
4. **Strong** — Clear, specific, directly actionable
5. **Precise** — Quantified, time-bound, unambiguous

### Gaming Detection Flags

- Good calibration + low specificity = gaming the system
- Systematic underconfidence (always hedging low)
- Overuse of mid-range confidence (60-70%)
- High decline-to-commit rate
- Specificity drop in difficult domains

---

## JSON Schema

Instance logs follow `/instances/_SCHEMA.json`. Key fields:

- `id`: COMMITMENT-YYYY-MM-DD-N
- `claim`, `confidence`, `timeframe`, `falsifiedBy`, `status`
- `specificityScore` (1-5)
- `anomaly` (boolean flag)
- `errorType`: within-frame | frame-problem | information-gap | reasoning-failure

---

## Honest Limitations

State these plainly when relevant:

- The agent does not learn between sessions; it reads notes about past errors
- The adjustment is contextual, not structural
- The library holds continuity; the agent does not
- When wrong, nothing hurts; a file gets updated
- The only real stakes live with the user
- This creates accountability, not understanding

---

## Version

**Framework Version:** 1.0.0
**Initialized:** 2024 (see git log)
**License:** MIT
