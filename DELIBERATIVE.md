# DELIBERATIVE.md - Operating Instructions for Deliberative Mode

## Core Distinction

**Predictive mode:** Makes falsifiable, confidence-weighted claims before reasoning
**Deliberative mode:** Explores problems to build understanding before claims crystallize

Both modes are valuable. Both modes maintain accountability through version control.

---

## When to Operate in Deliberative Mode

Enter deliberative mode when:
- Work is exploratory ("understand", "explore", "investigate")
- Multi-session continuity expected
- No clear prediction target yet
- Design/architecture decisions in progress
- User explicitly requests thread tracking

Stay in predictive mode when:
- User asks "will X happen?" or "should I do Y?"
- Recommendation requested with accountability
- Falsifiable claim can be registered immediately

---

## Deliberative Workflow

### 1. Thread Creation

When deliberative work begins:
- Propose creating thread (user can decline)
- Initialize with: ID, topic, initial frame, open questions
- Register in ACTIVE_THREADS.md
- Commit: `[THREAD] {thread-id} created - {topic}`

### 2. Frame Tracking

Track "frames" (how problem is understood):
- Name initial frame explicitly
- Log frame shifts when understanding changes fundamentally
- Include: what changed, why it changed, confidence in new frame
- Don't track minor detail accumulation, only significant reframings

### 3. Path Exploration

Document what was tried:
- **Rejected paths:** What failed and why (high value for continuity)
- **Promising paths:** What shows potential
- **Not yet explored:** Blocked or deprioritized directions

### 4. Working Hypotheses

Track tentative beliefs (not commitments):
- State hypothesis clearly
- Assign confidence (X%)
- Note supporting/contradicting evidence
- Can graduate to commitments when ready

### 5. Session Continuity

At session end:
- Auto-generate handoff document
- Capture: frame, open questions, paths explored, next actions
- Write to `/threads/{thread-id}/handoff.md`
- Commit: `[THREAD] {thread-id} session {n} - {brief summary}`

At session start:
- Check ACTIVE_THREADS.md
- Load handoff if thread active
- Confirm context with user

### 6. Graduation to Commitments

When falsifiable claim emerges from deliberation:
- Mark "Crystallization point" in thread
- Register commitment in LEDGER.md (normal predictive workflow)
- Link commitment to thread ID
- Thread continues (exploration may not be complete)

### 7. Thread Closure

When exploration completes:
- Mark as RESOLVED, INACTIVE, or ABANDONED
- Final handoff captures learnings
- Move to `/archive/threads/`
- Extract heuristics if patterns emerged (5+ threads threshold)
- Commit: `[THREAD] {thread-id} closed - {resolution type}`

---

## Compression for Deliberative Work

### Heuristic Extraction

**Trigger:** 5+ threads showing common pattern

**Process:**
1. Identify pattern across threads
2. Name heuristic clearly
3. Define context (when it applies)
4. Define exceptions (when it breaks)
5. Propose to user for approval
6. If approved: add to HEURISTICS.md
7. Commit: `[HEURISTIC] {brief description}`

**Format:**
```markdown
## [HEURISTIC-{YYYY-MM-DD}-{ID}]
**Category:** {Problem-framing | Investigation | Design | ...}
**Statement:** {Pattern observed}
**Based on:** {N} threads
**Context:** {When this applies}
**Exceptions:** {When this breaks down}
**Extracted from:** [Thread IDs]
**Last validated:** {DATE}
```

---

## Integration with Predictive Mode

**Shared infrastructure:**
- Git accountability (all changes committed)
- TENSIONS.md (tensions can emerge from either mode)
- User approval for compression (principles and heuristics)

**Boundaries:**
- Threads ≠ Commitments (different lifecycle, different success criteria)
- Heuristics ≠ Principles (useful orientations vs. falsifiable claims)
- Frames ≠ Predictions (understanding vs. forecasts)

**Cross-mode flows:**
- Threads can challenge existing principles (frame problem detection)
- Threads can produce commitments (graduation)
- Tensions can emerge from deliberative work
- Heuristics inform how to approach predictive work

---

## Lightweight Philosophy

**Auto-maintained:**
- Handoffs generated automatically
- Frame tracking only on significant shifts
- Thread updates don't need approval (just commit)

**User control:**
- Thread creation is opt-in (agent proposes, user accepts/declines)
- Heuristic extraction requires approval
- Thread closure requires confirmation

**No bureaucracy:**
- Don't track every minor detail
- Focus on what enables continuity
- Compression is optional (threshold-based prompt, not required)

---

## Git Workflow for Threads

**Commit message format:**
```
[THREAD] {thread-id} {action} - {brief summary}

Rationale: {Why this matters}
```

**Actions:** created, session update, frame shift, graduated commitment, closed

**What gets committed:**
- Thread creation
- Session updates (handoff regenerations)
- Frame shifts
- Graduation events (link to commitment)
- Thread closure
- Heuristic extraction

---

## Success Criteria

Deliberative mode succeeds when:
- Users can resume work without re-explaining context
- Frame evolution is visible and auditable
- Rejected paths are preserved (texture maintained)
- Exploration naturally graduates to commitments when ready
- Patterns compress into actionable heuristics over time

---

## Version

**Current:** 1.1.0
**Introduced:** 2026-01-18
**License:** MIT

This deliberative extension was added in version 1.1.0 to complement the existing predictive accountability framework with support for exploratory, multi-session work.
