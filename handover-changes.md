# Escape Fantasy Wireframes — Handover Change Log

A running, dev-facing list of every brand-alignment change in the wireframes, plus
items where the **wireframe is already correct and the app implementation must be
updated to match**. Hand this to Luke alongside the wireframes.

**Fonts note:** ABC Social and MaxFett are embedded as base64 data URIs directly in
each wireframe file so they render without any server dependency. In the app, use
properly licensed webfonts served from EC's infrastructure — do not ship raw font files.

---

## 1. Fonts (new — implement in app)

- **ABC Social** = all UI / body text. Weights used: Regular 400, Medium 500,
  Bold 700 (+ italics available). Replaces the old system font stack.
- **MaxFett (Black)** = large display moments — rank, points, leaderboard position,
  team budget/credits, countdown timers, and onboarding screen headings. Never body text.

## 2. Type conventions (from escapecollective.com article style)

- **Category / section label:** EC Orange `#FF6F42`, UPPERCASE, letter-spaced.
- **Byline + date:** UPPERCASE, grey, letter-spaced.
- **Headlines:** ABC Social Bold (700).

## 3. Per-screen changes

### All 30 wireframes — font rollout ✅ done
- `@font-face` declarations for ABC Social + MaxFett added to every wireframe.
- `body { font-family: 'ABC Social', ... }` applied to all screens.

### Home — `wireframe-01-home-v2.html` ✅ done
- **Upcoming section removed** — not being used; section deleted entirely.
- Rank stat (`.rank-big`, `.rank-sup`) → MaxFett Black.
- News headline (`.news-headline`) → ABC Social Bold 700.
- News date (`.news-time`) → UPPERCASE + letter-spacing.
- Category `.news-tag` was already orange uppercase — no change.
- Competition banners: real photography replacing SVG placeholders (see section 6).

### Competitions — `wireframe-02-competition-browser.html` ✅ done
- Page header (back-chevron + "Competitions" title) removed — back button is incorrect on a top-level tab screen; nav already provides orientation.
- Competition banners: real photography replacing SVG placeholders (see section 6).

### Leagues — `wireframe-09-league-list.html` ✅ done
- "Leagues" heading removed from app header — redundant with active nav tab.
- Search icon kept in header.

### News feed — `wireframe-15-news-feed.html` ✅ done
- "News" heading removed from app header — redundant with active nav tab.
- Filter button removed — not in the app and not planned.
- EC logo right-aligned in header.
- **Article card layout reworked to match EC site style:**
  - Order was: image → category/date → headline → excerpt → author.
  - Now: image → headline → excerpt → category · author · date (single meta row).
- **Images taller** — 110px → 190px; dev note: use `object-fit: cover` on `.article-img`.
- **Category** — EC Orange `#FF6F42`, UPPERCASE, no pill background (was multi-coloured filled pills).
- **Byline** — author + date UPPERCASE, grey, `·`-separated.
- **Headline** — ABC Social Bold 700, 15px.

### Account — `wireframe-16-account-settings.html` ✅ done
- "Account" heading bar removed entirely — redundant with active nav tab.

### Onboarding — `wireframe-22/23/24` ✅ done
- `.ob-heading` → MaxFett Black on all three screens.
- Headings: "Welcome to Escape Fantasy", "Two ways to play", "Pick your first competition".
- wireframe-23: heading condensed to a single line.
- wireframe-24: heading and subtext centred.

## 4. App-side items (wireframe already correct — update the app to match)

- **Home "Latest News" heading:** wireframe uses the correct grey all-caps style; the live app doesn't match. No wireframe change — fix in app.

## 5. Competition banner images

Real photography used for two competitions:

- **Tour de France 2026 / Stage Race** → `banner-tdf-photo.jpg` (peloton through sunflower field).
  CSS: `center 95%/cover` on Home (155px card); `center 50%/cover` on Competition Browser (72px card).
- **2026 Grand Tour Season / Teams** → `banner-teams-photo.jpg` (stage win celebration).
  CSS: `center 0%/cover` on both screens.
- **Note:** percentage-based `background-position-y` behaves differently at different card heights — different values are needed per context. Converting to pixel offsets (`center -Xpx/cover`) would allow a single value to work everywhere.
- Vuelta, Giro Donne, and other competition banners are still SVG placeholders — replace server-side.

## 6. Pending / to do

- Roll full type conventions (orange UPPERCASE categories, UPPERCASE grey bylines) across remaining screens beyond Home and News.
- Convert banner `background-position-y` from `%` to `px` for consistent cross-context positioning.
