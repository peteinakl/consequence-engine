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
