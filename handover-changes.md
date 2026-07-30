# Escape Fantasy Wireframes — Handover Change Log

A running, dev-facing list of every brand-alignment change in the wireframes, plus
items where the **wireframe is already correct and the app implementation must be
updated to match**. Hand this to Luke alongside the wireframes.

Fonts are served from `https://escapecollective.com/assets/fonts/` (the live EC website).
All wireframes reference fonts from this URL — no local font files are needed to view them.
`/Fonts` is in `.gitignore` and is not part of the repo.
**Licensing note:** the app must use properly-licensed webfonts; don't ship raw font files.

---

## 1. Fonts (new — implement in app)

- **ABC Social** = all UI / body text. Weights used: Regular 400, Medium 500,
  Bold 700 (+ italics available). Replaces the old system font stack.
- **MaxFett (Black)** = large display moments — rank, points, leaderboard position,
  team budget/credits, countdown timers, and **onboarding screen headings**. Never body text.

## 2. Type conventions (from escapecollective.com article style)

- **Category / section label:** EC Orange `#FF6F42`, UPPERCASE, letter-spaced.
- **Byline + date:** UPPERCASE, grey, letter-spaced.
- **Headlines:** ABC Social Bold (700).

## 3. Per-screen changes made

### All 30 wireframes — font rollout ✅ done
- `@font-face` declarations for ABC Social + MaxFett added to every wireframe.
- Fonts load from `https://escapecollective.com/assets/fonts/` — no local files needed.
- `body { font-family: 'ABC Social', ... }` applied to all screens (cascades to all UI text).

### Home — `wireframe-01-home-v2.html` ✅ done
- Rank stat (`.rank-big`, `.rank-sup`) → MaxFett Black.
- News headline (`.news-headline`) → Bold 700.
- News date (`.news-time`) → UPPERCASE + letter-spacing.
- (Category `.news-tag` was already orange uppercase — no change.)
- **Competition banners:** real photography replacing SVG placeholders (see section 6).

### News feed — `wireframe-15-news-feed.html` ✅ done
- **Card layout flipped:** was image → meta(category+date) → headline → excerpt → author.
  Now **image → headline → excerpt → meta**, with meta = category · author · date on one row.
- **Taller images** (110px → 190px) so more of the image shows / less awkward crop.
- **Category** now EC Orange UPPERCASE text (was multi-coloured filled pills) — matches site.
- **Author + date** now UPPERCASE, letter-spaced, grey, `·`-separated — matches site byline style.
- **Headline** → ABC Social Bold (700), 15px.
- Dev note: real images should use `object-fit: cover` on `.article-img` (190px tall).

### Competition Browser — `wireframe-02-competition-browser.html` ✅ done
- **Competition banners:** real photography replacing SVG placeholders (see section 6).

## 4. App-side items (wireframe already correct — update the APP to match)

- **Home "Latest News" heading:** wireframe uses the correct grey all-caps style;
  the live app doesn't match it. No wireframe change — fix in app.

## 5. Page-title headings removed

Top-level tab screens no longer repeat the tab name as a heading — nav bar already provides orientation.

- **wireframe-02 (Competition Browser):** removed entire app header bar (back-chevron + "Competitions" title — back button is incorrect on a top-level tab screen).
- **wireframe-09 (Leagues):** removed "Leagues" heading; kept search icon in header.
- **wireframe-15 (News Feed):** removed "News" heading; kept EC logo + filter icon in header.
- **wireframe-16 (Account):** removed entire "Account" heading bar.

## 6. Competition banner images

Real photography now used for two competitions:

- **Tour de France 2026 / Stage Race** → `banner-tdf-photo.jpg` (peloton through sunflower field).
  CSS position: `center 95%/cover` on Home (155px card); `center 50%/cover` on Competition Browser (72px card).
- **2026 Grand Tour Season / Teams** → `banner-teams-photo.jpg` (stage win celebration).
  CSS position: `center 0%/cover` on both screens.
- **Note:** percentage-based `background-position-y` shifts relative to card height — different values
  needed per context. Convert to pixel offsets (`center -Xpx/cover`) for a single value that works everywhere.
- Vuelta, Giro Donne, and other competition SVG banners still placeholder — replace server-side (Luke).

## 7. Onboarding headings — `wireframe-22/23/24` ✅ done

- `.ob-heading` → MaxFett Black on all three onboarding screens.
- Headings: "Welcome to Escape Fantasy", "Two ways to play", "Pick your first competition".

## 8. Pending / to do

- Roll full type conventions (orange UPPERCASE categories, UPPERCASE grey bylines) across remaining screens.
- Convert banner `background-position-y` from `%` to `px` for consistent cross-context positioning.
