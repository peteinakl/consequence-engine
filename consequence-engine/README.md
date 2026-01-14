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
