# Escape Fantasy Wireframes — Handover Change Log

Dev-facing record of every brand-alignment change made to the wireframes. Items marked **→ implement in app** are cases where the wireframe is correct and the live app must be updated to match. Hand this to Luke alongside the wireframe links.

**Fonts note:** ABC Social and MaxFett are embedded as base64 data URIs directly in each wireframe file so they render without any server dependency. In the app, serve both fonts from EC's infrastructure — do not ship raw font files.

---

## 1. Fonts

**ABC Social** — all UI / body text. Weights used: Regular (400), Medium (500), Bold (700). Italics available. Replaces the old system font stack (`-apple-system, BlinkMacSystemFont, "Segoe UI"` etc.).

**MaxFett Black** — large display moments only. Used on: rank numbers, leaderboard positions, points totals, team budgets/credits, countdown timers, onboarding headings, and competition/race card titles. Never body text.

→ Implement in app: serve both fonts from EC infrastructure.

---

## 2. Global typography system

These changes apply across all wireframes and are the new app-wide type spec. All class names reference the existing CSS in the wireframes.

### Section / category labels (`.section-lbl`)
- Font size: **9px** (was 10px)
- Colour: **`#888`** (was `--text-dimmed` ≈ #555)
- Letter-spacing: **0.1em** (was 0.12em)
- Uppercase, weight 800 — unchanged

### Status / type badges (`.badge`, `.b-live`, `.b-stage` etc.)
- Border-radius: **20px** — pill shape (was 4px)
- Padding: **3px 10px** (was 3px 7px)

### Competition / race card title (`.race-name`)
- Font family: **MaxFett** (was ABC Social — ABC Social caps at 700 so 900 had no effect)
- Font size: **17px** (was 16px)
- Letter-spacing: **0.5px** (was −0.3px — positive tracking suits MaxFett)
- Colour always white over photo gradient — unchanged

### Rank / position number (`.rank-big`, `.rank-sup`)
- Font family: MaxFett — unchanged
- Font size `.rank-big`: **30px** (was 24px)
- Letter-spacing `.rank-big`: **1px** (was −0.5px — MaxFett needs breathing room at large sizes)

### "of x players" sub-label (`.rank-of`)
- Font size: **10px** (was 12px)
- Colour: **`#888`** (was `--text-muted`)
- Font weight: **700** (was unset / 400)

### Last result text (`.result-text`)
- Font size: **10px** (was 11px)
- Font weight: **700** (was unset / 400)
- Coloured result label inside (e.g. "2nd place"): `font-weight: 800`

### CTA ghost / secondary button (`.cta-btn-ghost`)
- Font weight: **500** (was 700)
- Primary filled button (`.cta-btn`) stays at 800 — unchanged

### News / article category tag (`.news-tag`)
- Font size: **8px** (was 9px)
- Letter-spacing: **0.14em** (was 0.08em)
- EC Orange, uppercase, weight 800 — unchanged

### News / article headline (`.news-headline`)
- Font size: **14px** (was 12px)
- Font weight: **800** (was 700)
- Line-height: **1.25** (was 1.35)

---

## 3. Per-screen changes

### All 30 wireframes ✅
- `@font-face` for ABC Social (4 weights) + MaxFett embedded in every file
- `body { font-family: 'ABC Social', ... }` applied globally
- All global typography changes (section 2) applied wherever the relevant CSS classes exist
- **Annotation toggle** added to every wireframe: "Hide Annotations" button fixed top-right hides all `.cn` callout circles

### Home — `wireframe-01-home-v2.html` ✅
- **Upcoming section removed** — not being used; section and annotation callout deleted, remaining annotations renumbered
- All global typography changes applied (section labels, badges, rank numbers, result text, news)
- Competition banner photography added (see section 5)

### Home alternate — `wireframe-01-home.html` ✅
- Global typography changes applied (news-tag, news-headline)

### Competition browser — `wireframe-02-competition-browser.html` ✅
- Page header (back-chevron + "Competitions" title) **removed** — incorrect on a top-level tab; nav provides orientation
- Competition banner photography added (see section 5)
- Global typography changes applied (section-lbl, badges)

### Leagues — `wireframe-09-league-list.html` ✅
- "Leagues" heading **removed** from app header — redundant with active nav tab
- Search icon kept
- Global typography changes applied (section-lbl)

### News feed — `wireframe-15-news-feed.html` ✅
- "News" heading **removed** from app header — redundant with active nav tab
- Filter button **removed** — not planned
- EC logo **right-aligned** in header
- **Article card layout reworked to EC site style:**
  - Was: image → category/date → headline → excerpt → author
  - Now: image → headline → excerpt → category · author · date (single meta row)
- Image height: 110px → **190px**; use `object-fit: cover` on `.article-img`
- Category label: EC Orange `#FF6F42`, UPPERCASE, no pill background (was coloured filled pills)
- Byline: author + date UPPERCASE, grey, `·`-separated
- Headline: ABC Social, 14px, weight 800 (updated per global type spec)

### Account — `wireframe-16-account-settings.html` ✅
- "Account" heading bar **removed** — redundant with active nav tab

### Onboarding — `wireframe-22`, `wireframe-23`, `wireframe-24` ✅
- `.ob-heading` → **MaxFett Black** on all three screens
- Headings: "Welcome to Escape Fantasy" / "Two ways to play" / "Pick your first competition"
- wireframe-23: heading condensed to a **single line**
- wireframe-24: heading and subtext **centred**

---

## 4. App-side items (wireframes correct — update app to match)

All global typography changes in section 2 need to be implemented in the app. Specific callouts:

- **Section labels:** 9px, `#888`, tracking 0.1em
- **Badges/pills:** border-radius 20px, padding 3px 10px
- **Race/competition titles:** Switch to MaxFett Black, 17px, tracking 0.5px
- **Rank numbers:** MaxFett, 30px, letter-spacing 1px
- **"of x players":** 10px, `#888`, weight 700
- **Result text:** weight 700 for rider/stage line; 800 for coloured result label
- **Ghost buttons:** weight 500
- **News category tags:** 8px, tracking 0.14em
- **News headlines:** 14px, weight 800, line-height 1.25
- **Home "Latest News" heading:** app doesn't match wireframe's grey all-caps style — fix in app

---

## 5. Competition banner images

Real photography in repo root: `banner-tdf-photo.jpg`, `banner-teams-photo.jpg`

| Competition | Image file | Home card (155px tall) | Browser card (72px tall) |
|---|---|---|---|
| Tour de France 2026 / Stage Race | `banner-tdf-photo.jpg` | `center 95%/cover` | `center 50%/cover` |
| 2026 Grand Tour Season / Teams | `banner-teams-photo.jpg` | `center 0%/cover` | `center 0%/cover` |

**Dev note:** `background-position-y` percentage behaves differently at different element heights. Converting to pixel offsets (`center -Xpx/cover`) would give a single consistent value per image. Vuelta, Giro Donne, and other competition banners remain SVG placeholders — replace server-side.

---

## 6. Pending

- Roll type conventions (orange UPPERCASE categories, UPPERCASE grey bylines) across screens not yet updated
- Convert banner `background-position-y` from `%` to `px`
- Replace remaining SVG competition banners with photography
