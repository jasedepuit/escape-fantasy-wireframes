# 👉 START HERE — Handover for the Escape Fantasy wireframes chat

This file brings a fresh chat fully up to speed on the brand-alignment work done on
the wireframes. Read this first, then the linked files as needed. Everything lives in
this connected folder, so all files below are already on disk.

## Read these, in order
1. **`CONTEXT.md`** — what the project is, repo/deploy/push workflow, screen inventory.
2. **`redesign-notes.md`** — the full Wade/Jase discussion, decisions, reservations, open questions.
3. **`handover-changes.md`** — dev-facing changelog for Luke (every change + app-side items).
4. This file — current status + what's next.

---

## Where things stand (snapshot)

**Goal:** align the wireframes with Escape Collective branding for the TdFF handover —
*targeted* changes, not a wholesale redesign. Prompted by Wade's Claude-Design mockup;
Jase is doing a considered pass.

### Design decisions (locked)
- **Fonts** (files in `/Fonts`): **ABC Social** = all UI/body (Regular/Medium/Bold + italics);
  **MaxFett Black** = large display *numbers/stats only* (rank, points, budget, countdowns) —
  never headlines/body. The "escape Fantasy" logo stays as the existing image.
- **Orange:** `#FF6F42` is the official EC brand orange and is *already* what the app uses —
  no colour change. **Do NOT introduce the unreleased new orange or new arbitrary colours.**
- **Type conventions (from escapecollective.com):** category = orange UPPERCASE; byline+date =
  UPPERCASE grey, letter-spaced; headlines = ABC Social Bold.
- **Page headings** (e.g. "Competitions"/"Leagues"/"News"): **remove them** — redundant with nav.
- **Keep** the Home news module (Home is a dashboard/overview — not redundant with News tab).

### Done (⚠️ uncommitted — see Ops)
- **`wireframe-01-home-v2.html`** — ABC Social wired in; rank stat → MaxFett Black; news date →
  uppercase; news headline → Bold.
- **`wireframe-15-news-feed.html`** — fonts wired; cards flipped to image → headline → excerpt →
  meta (orange category · uppercase author · uppercase date); taller images (190px); categories
  now orange uppercase text (dropped the old colour-coded pills); Bold headlines.
- **`fonts-test.html`** — throwaway font-load test page (can be deleted).

### Open questions / needs Jase
1. **Font licensing — decide before pushing.** MaxFett + ABC Social are commercial. Repo is
   **public** via GitHub Pages, so pushing `/Fonts` publishes the files (likely a licence breach).
   Options: keep local/handover-only; make repo private; or Luke serves licensed webfonts and
   wireframes stay local. **Until decided, do not push the font files.**
2. **News tab review:** (a) all categories made orange — OK, or keep colour-coding? (b) meta on
   one dot-separated line vs the site's stacked byline? (c) add a comment count?
3. **MaxFett placement:** confirm the "display numbers/stats only" rule before rolling out.

### Pending work
- Roll the type system (ABC Social + MaxFett stats + orange caps categories + uppercase bylines)
  across the remaining ~32 screens.
- Remove the redundant page-title headings app-wide.
- App-side items for Luke (wireframe already correct): e.g. Home "Latest News" heading style.
- Competition banner images (the AI-looking ones) → replaced **server-side by Luke**, not here.

---

## Ops notes (important)
- **Pushing to GitHub:** commit from the connected folder, but **push from Jase's Mac**
  (`./push.sh` or `git push origin main`) — the sandbox has no valid credentials. The token in
  the old remote URL was dead; the remote is now the plain URL and Jase's Mac auths via keychain.
- **Current git state:** the CONTEXT/trello-cleanup commit is already pushed. The redesign edits
  above are **local only, not committed/pushed** (deliberately — see licensing question 1).
- The connection/timeout problems earlier were a local **broken-IPv6** issue on Jase's network
  (fixed by restart) — nothing to do with the repo.
