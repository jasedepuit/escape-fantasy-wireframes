# Escape Fantasy — Project Context Brief

> Lightweight standing context for working on this repo in a fresh chat.
> **Do NOT ask an assistant to "consume the whole folder."** That re-sends ~14MB
> (including 400–833KB wireframes with inline base64 images) on every message and
> makes chats fail. Instead: work from the connected folder / git repo and open
> individual files only when a task needs them. This brief is enough to start.

## What this is

**Escape Fantasy** (formerly *Velo Tipping*) — a fantasy cycling app built around
stage races and grand tours, run by **Escape Collective**. This repo holds the
**mobile-first redesign wireframes (v1.0)**, specified in the Feb 2026 PRD. These
are clickable HTML wireframes, not the production app — the deliverable is a
developer handover for the build.

The redesign fixes the top complaints from a 200+ person survey (lag, riders
sorted by first name, no participant count, painful competition switching, opaque
scoring, truncated top-100 leaderboard, broken notification deep-links, bad rider
classifications, Ghost magic-link login friction, results spoilers) and adds five
feature areas: multiple simultaneous competitions, a season-long **Fantasy Teams**
format, editorial/news integration, an AI pick assistant, and league chat.

## Repo / workflow

- **Remote:** `github.com/jasedepuit/escape-fantasy-wireframes`, branch `main`.
- **Deploy:** every push to `main` auto-deploys to **GitHub Pages** via
  `.github/workflows/deploy.yml` (uploads the whole repo root).
- **Entry point:** `index.html` redirects to `screen-map.html` (the hub).
- **Push:** run `./push.sh` — it clears stale `.git/*.lock` files (left by the
  sandbox) then `git push`. Use it instead of a bare `git push`.
- Edit wireframes directly, commit, then `./push.sh`. Pages redeploys in ~1 min.

## Reference docs (open on demand — don't preload all)

- `escape_fantasy_requirements.docx` — the full PRD (source of truth).
- `developer-handover.html` — consolidated technical/product decisions. Read first.
- `screen-map.html` — navigation architecture, flows, and per-screen build status.
- `qa-test-plan.html` — QA test plan.
- `launch-comms-draft.md` — launch/marketing copy draft.

## Key product decisions (so you don't re-derive them)

- **Auth:** Ghost CMS SSO using the **OTP / auth-code** flow — *not* magic links
  (magic links can't reliably deep-link back into a native app). 6-digit code,
  10-min expiry, 60s resend cooldown. Free EC account is enough; paid not required.
- **Onboarding** (screens 22–24): shown exactly once after first login, gated by a
  persisted flag (e.g. `ef_onboarding_complete`); Skip available on all three.
- **Two competition formats** branch at the Competition Browser (02) and Home CTAs (01):
  - **Stage Race** — one rider pick per stage; screens 03→04→05→07.
  - **Fantasy Teams** — 9-rider squad, screens 19→20.
  - Leaderboard (08) and League screens (09–14) are shared by both.
- **Fantasy Teams squad:** 9 slots — 2 All-Rounder (blue #5B8BF5), 2 Climber
  (green #34C759), 2 Sprinter (orange #FF9500), 2 Unclassed (purple #AF52DE),
  1 Wildcard (accent #FF6F42). Per-competition credit budget; prices set by the
  competition director; no auto-subs; transfers only in windows (typically rest days).
- **Theme:** dark mode default, light mode available. Mobile-first.

## Screen inventory (25 screens → wireframe files)

01 Home · 01b Home empty-state · 02 Competition Browser · 03 My Picks · 04 Rider
Selection · 05 Rider Profile (modal) · 06 AI Suggestion (modal) · 07 Per-Stage
Results · 08 Overall Leaderboard · 09 League List · 10 League Detail
(standings+chat) · 11 Create League · 12 League Settings · 13 Join by Code · 14
Enroll League Sheet (modal) · 15 News Feed · 16 Account Settings · 17 Notification
Preferences · 18 Notification Feed · 19 Team Selection · 20 Team Overview · 21
Login · 22–24 Onboarding 1–3 · 25 Create Account · 26 Update Profile · 27 Team
Leaderboard · 28 Rider Points Overlay.

Files are named `wireframe-NN-name.html`. Most screens are marked **Done** in
`screen-map.html`; check there for current build status before starting work.

## Heavy files (avoid opening unless editing them)

`wireframe-25-create-account.html` (816K), `wireframe-15-news-feed.html` (764K),
`wireframe-01-home-v2.html` (444K), `wireframe-21-login.html` (416K) — big due to
inline base64 images.

## ⚠️ Security note

- A **GitHub personal access token** is embedded in the git remote URL (`.git/config`).
  Consider rotating it and using a credential helper instead.
- The old `trello-api-setup.md` (which contained a Trello API key) has been removed,
  but the key still exists in **git history** — it should be revoked in Trello.
