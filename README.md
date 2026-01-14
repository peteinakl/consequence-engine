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

## Installation

```bash
# Clone the repository
git clone https://github.com/peteinakl/consequence-engine.git
cd consequence-engine

# The framework is ready to use
```

---

## How to Use

### Basic Usage

Start Claude Code with the agent framework:

```bash
claude --agent AGENT.md
```

Or reference it manually in your Claude Code session:
```
Read AGENT.md and operate according to its protocols.
Load PRINCIPLES.md and TENSIONS.md into context.
Check LEDGER.md for commitments due for verification.
```

### Your First Session

When you start a session, Claude will:
1. Read the core protocols from AGENT.md
2. Load active principles and tensions
3. Check for commitments awaiting verification
4. Operate in "commit-first" mode

**Try asking:**
- "Will Python 3.14 be released before July 2026?" (Claude logs a commitment before reasoning)
- "What's the weather today?" (Simple query, no commitment needed)
- "Should I invest in this stock?" (Claude will commit to a specific prediction with confidence)

### Making Predictions

**The framework forces specificity:**

❌ **Before:** "This might work, depending on various factors..."

✅ **After:** "COMMITMENT: This will succeed with 75% confidence. Verifiable by 2026-02-15. Falsified if success rate <60%."

Every prediction is:
- **Specific** — clear outcome stated
- **Confident** — percentage given, not hedges
- **Time-bound** — when can it be checked?
- **Falsifiable** — what outcome proves it wrong?

### Verifying Outcomes

When the timeframe passes, return to Claude with the outcome:

```
"Remember COMMITMENT-2025-12-20-01 about X? Here's what actually happened: [outcome]"
```

Claude will:
1. Compare prediction to reality
2. Mark as VERIFIED, FALSIFIED, PARTIAL, or CONTESTED
3. Update calibration statistics
4. If wrong: explicitly state what was missed

### Tracking Calibration

Check how well Claude is calibrated:

```
"Show me my calibration statistics"
"How accurate have I been in the 'technical-prediction' domain?"
```

When Claude says "70% confident", it should be right 70% of the time. The framework tracks this.

### Extracting Principles

After 10+ predictions in a domain, patterns emerge:

```
"We have 12 instances in 'user-behavior'. What patterns do you see?"
```

Claude will propose compressing instances into principles. You approve or reject.

### Evolution Over Time

The framework improves through:
- **Compression** — patterns become principles
- **Tensions** — contradictions held without premature resolution
- **Self-modification** — Claude proposes changes to its own rules (you approve)

---

## Example Workflow

```bash
# Session 1: Make predictions
$ claude --agent AGENT.md
> "Will the new feature launch by end of month?"

Claude logs commitment: 80% confident, verifiable by 2026-01-31

# Session 2: Verify outcome (after 2026-01-31)
$ claude --agent AGENT.md
> "The feature launched on 2026-01-28. Update the commitment."

Claude marks VERIFIED, updates calibration

# Session 3: Extract learning
$ claude --agent AGENT.md
> "We have 15 feature-launch predictions. What have you learned?"

Claude proposes principle, you approve, it gets committed to git
```

---

## Use Cases

**Decision Support**
- Log predictions before major decisions
- Track which types of decisions you're calibrated on
- Build domain-specific accuracy profiles

**Forecasting**
- Make falsifiable predictions about future events
- Track calibration over time
- Identify systematic biases

**Learning from Mistakes**
- Every error is logged with explicit accounting
- Patterns of error become visible
- Framework evolves to address recurring failures

**Accountability in High-Stakes Contexts**
- Predictions are undeniable (in git history)
- No retroactive editing or explanation-away
- Calibration metrics can't be gamed easily

---

## File Structure

```
/
├── README.md             ← You are here
├── AGENT.md              ← Core agent instructions (self-modifying)
├── PRINCIPLES.md         ← Active compressed principles
├── TENSIONS.md           ← Unresolved contradictions
├── LEDGER.md             ← Open and resolved commitments
├── CALIBRATION.md        ← Running accuracy by domain
├── CLAUDE.md             ← Guidance for Claude Code instances
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

## Advanced Features

### Domain-Specific Tracking

Create a new domain when a category of predictions emerges:

```bash
# Copy template
cp domains/_TEMPLATE.md domains/market-analysis.md

# Edit metadata and commit
git add domains/market-analysis.md
git commit -m "[DOMAIN] Add market-analysis domain"
```

### Self-Modification

Claude can propose changes to its own rules in AGENT.md:

```
> "I notice commitments with >90 day timeframes are rarely verified.
   Propose: flag timeframes >90 days for user review before committing.
   Evidence: 8 of 10 long-timeframe commitments abandoned.
   Expected improvement: reduce abandonment rate from 80% to <30%."
```

You review, approve or reject. If approved, change is committed with rationale.

### Tension Management

When principles contradict:

```
> "Principle A says X works in context 1.
   Principle B says X fails in context 2.
   Logging as TENSION-2026-01-15-01.
   Not resolving prematurely—carrying both as data."
```

Tensions resolve when enough evidence accumulates to understand the boundary conditions.

### Calibration Dashboards

Generate reports:

```
"Show calibration by domain"
"What's my mean calibration error?"
"Which domains am I overconfident in?"
"Has my specificity improved over time?"
```

### Compression Cycles

When domains hit 10+ instances, compression is triggered:

1. Claude reads all instances in `/instances/{domain}.json`
2. Identifies patterns
3. Proposes principle with confidence
4. If approved: added to PRINCIPLES.md
5. Committed to git with evidence

---

## FAQ

**Q: Does Claude actually learn between sessions?**
A: No. Claude reads files about past errors. The "learning" lives in version-controlled files, not in the model.

**Q: What if I disagree with Claude's self-assessment?**
A: Mark the commitment as CONTESTED. You provide your interpretation, Claude provides its interpretation, and the disagreement is logged.

**Q: Can I modify the Protected Core?**
A: Yes, but only you can do it manually. Claude cannot self-modify the Protected Core (commit-first requirement, no vague hedges, etc.).

**Q: What happens if I stop verifying outcomes?**
A: The system decays. Accountability requires your engagement. High abandonment rates get tracked and flagged.

**Q: How do I know if Claude is gaming the system?**
A: CALIBRATION.md tracks calibration vs. specificity. Good calibration + low specificity = gaming. The framework flags this.

**Q: Can I use this for creative work?**
A: Not recommended. The commit-first protocol adds overhead. This is designed for predictions, decisions, and assessments—not brainstorming or exploration.

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
