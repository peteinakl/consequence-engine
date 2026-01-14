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
