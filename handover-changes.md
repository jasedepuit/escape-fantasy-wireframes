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

These changes apply across all wireframes and are the new app-wide type spec.

### Section / category labels (`.section-lbl`)
- Font size: **9px** (was 10px)
- Colour: **`#888`** (was `--text-dimmed` ≈ #555)
- Letter-spacing: **0.1em** (was 0.12em)
- Uppercase, weight 800 — unchanged

### All status / type / classification badges and pills
All pill-shaped label elements are now `border-radius: 20px` (was 4px), `padding: 3px 10px` (was 3px 7px). This applies to every badge-like class across all screens:

| Class | Where used |
|---|---|
| `.badge`, `.b-live`, `.b-stage`, `.b-team` | Home, competition cards |
| `.b-joined` | Competition browser — "✓ Joined" |
| `.finished-header-badge` | Competition browser — "Finished" status |
| `.suggested-badge` | AI suggestion screen |
| `.director-tag`, `.director-badge` | Leagues screens |
| `.comp-badge` | Onboarding screen 3 |
| `.type-pill` | Home alternate |
| `.class-pill`, `.rider-class-pill`, `.slot-chip-class` | Rider selection, team screens |

### Competition / race card title (`.race-name`)
- Font family: **MaxFett** (was ABC Social — ABC caps at 700, so 900 had no visual effect)
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

### News / article category tag (`.news-tag`, `.article-pill`)
- Font size: **8px** (was 9–10px)
- Letter-spacing: **0.14em** (was 0.06–0.08em)
- EC Orange, uppercase, weight 800 — unchanged

### News / article headline (`.news-headline`, `.article-headline`)
- Font size: **14px** (was 12–15px)
- Font weight: **800** (was 700)
- Line-height: **1.25** (was 1.3–1.35)

### News / article timestamp (`.news-time`, `.article-time`)
- Font size: **9px**
- Colour: **`#888`**
- Text-transform: **uppercase**
- Letter-spacing: **0.06em**

---

## 3. Per-screen changes

### All 30 wireframes ✅
- `@font-face` for ABC Social (4 weights) + MaxFett embedded in every file
- `body { font-family: 'ABC Social', ... }` applied globally
- All global typography changes (section 2) applied wherever the relevant CSS classes exist
- **Annotation toggle** added to every wireframe: "Hide Annotations" button fixed top-right hides all `.cn` callout circles

### Home — `wireframe-01-home-v2.html` ✅
- **Upcoming section removed** — not being used; section and annotation callout deleted, remaining annotations renumbered
- All global typography changes applied
- Competition banner photography added (see section 5)

### Home alternate — `wireframe-01-home.html` ✅
- Global typography changes applied (news-tag, news-headline, news-time)

### Home empty state — `wireframe-01b-home-empty-state.html` ✅
- Global typography changes applied (news-headline, news-time)

### Competition browser — `wireframe-02-competition-browser.html` ✅
- Page header (back-chevron + "Competitions" title) **removed** — incorrect on a top-level tab; nav provides orientation
- Competition banner photography added (see section 5)
- All pills rounded (badge, b-joined, finished-header-badge)
- Global typography changes applied (section-lbl, badges)

### Leagues — `wireframe-09-league-list.html` ✅
- "Leagues" heading **removed** from app header — redundant with active nav tab
- Search icon kept
- Global typography changes applied (section-lbl, director-tag)

### League settings — `wireframe-12-league-settings.html` ✅
- director-badge pill rounded

### News feed — `wireframe-15-news-feed.html` ✅
- "News" heading **removed** from app header — redundant with active nav tab
- Filter button **removed** — not planned
- EC logo **right-aligned** in header
- **Article card layout reworked to EC site style:**
  - Was: image → category/date → headline → excerpt → author
  - Now: image → headline → excerpt → category · author · date (single meta row)
- Image height: 110px → **190px**; use `object-fit: cover` on `.article-img`
- Category label (`.article-pill`): EC Orange, UPPERCASE, no pill background, 8px, 0.14em tracking
- Byline (`.article-author`, `.article-time`): UPPERCASE, grey (`--text-dim`), `·`-separated
- Headline (`.article-headline`): 14px, weight 800, line-height 1.25

### Account — `wireframe-16-account-settings.html` ✅
- "Account" heading bar **removed** — redundant with active nav tab

### AI suggestion — `wireframe-06-ai-suggestion.html` ✅
- suggested-badge pill rounded

### Rider selection — `wireframe-04-rider-selection.html` ✅
- class-pill rounded

### Team selection / overview — `wireframe-19`, `wireframe-20` ✅
- rider-class-pill, slot-chip-class, dnf-badge all rounded

### Onboarding — `wireframe-22`, `wireframe-23`, `wireframe-24` ✅
- `.ob-heading` → **MaxFett Black** on all three screens
- Headings: "Welcome to Escape Fantasy" / "Two ways to play" / "Pick your first competition"
- wireframe-23: heading condensed to a **single line**
- wireframe-24: heading and subtext **centred**
- wireframe-24: comp-badge pill rounded

---

## 4. App-side items (wireframes correct — update app to match)

- **Fonts:** ABC Social everywhere; MaxFett for all display numbers and competition titles
- **Section labels:** 9px, `#888`, tracking 0.1em
- **All badges/pills:** border-radius 20px, padding 3px 10px (see full class list in section 2)
- **Race/competition titles:** MaxFett Black, 17px, tracking 0.5px
- **Rank numbers:** MaxFett, 30px, letter-spacing 1px
- **"of x players":** 10px, `#888`, weight 700
- **Result text:** weight 700 for rider/stage line; 800 for coloured result label
- **Ghost buttons:** weight 500
- **News/article category tags:** 8px, tracking 0.14em, EC Orange
- **News/article headlines:** 14px, weight 800, line-height 1.25
- **News timestamps:** 9px, `#888`, uppercase, tracking 0.06em
- **Home "Latest News" heading:** app doesn't match wireframe's grey all-caps style — fix in app

---

## 5. Competition banner images

Real photography in repo root: `banner-tdf-photo.jpg`, `banner-teams-photo.jpg`

| Competition | Image file | Home card (155px tall) | Browser card (72px tall) |
|---|---|---|---|
| Tour de France 2026 / Stage Race | `banner-tdf-photo.jpg` | `center 20%/cover` | `center 20%/cover` |
| 2026 Grand Tour Season / Teams | `banner-teams-photo.jpg` | `center 0%/cover` | `center 0%/cover` |

**Dev implementation note:** The wireframes use CSS `background-position` with percentage values. In the app, implement competition card images as `<img>` tags with `object-fit: cover` and `object-position` — this gives much more reliable and consistent cropping across different card heights without needing separate values per context. Vuelta, Giro Donne, and all other competition banners are still SVG placeholders — replace with photography server-side.

---

## 6. Pending (awaiting assets)

- Replace remaining SVG competition banners (Vuelta, Giro Donne, etc.) with photography — source images needed

---

## 7. Transfer window UX — wireframe additions (issues #145 and #150)

These changes are not brand-alignment items — they are new UX patterns for surfacing transfer window schedule information. See the updated wireframes: `wireframe-01-home-v2.html` and `wireframe-19-team-selection.html`.

### 7a. Home competition card — `wireframe-01-home-v2.html`

A transfer window strip is now **always present** on the team competition card (as long as there are future or active windows). Two states:

**Window open (`.tw-strip-open` — green border):**
- "Window X of Y open · closes in [countdown]"
- Sub-label: "Up to 3 rider changes · tap for full schedule"
- CTA button changes to **"Make Transfer →"**

**Window closed (`.tw-strip-closed` — grey/subtle border):**
- "Window X of Y opens in [countdown]"
- Sub-label: "Up to 3 rider changes · tap for full schedule"
- CTA button stays **"View Team →"**

Strip is hidden entirely once the final window has passed.

Both strip states are shown in the wireframe for reference. Both are **tappable** → should navigate to Team Selection screen (WF19) or open the schedule sheet.

→ Implement in app: replace the old conditional dashed-orange alert with this persistent two-state strip.

### 7b. Team selection screen — `wireframe-19-team-selection.html`

The header deadline badge (callout ②) now has two states and is **tappable** → opens a bottom sheet.

**Window open (orange badge):** `"Window X of Y · closes in [countdown]"`

**Window closed (grey badge):** `"Window X of Y · opens in [countdown]"` — shown in read-only mode between windows.

**Bottom sheet (tapped from either badge state):** Full schedule listing all windows with:
- Window number + label (e.g. "Rest Day 1")
- Open/close dates and times
- Changes allowed per window ("Up to 3 rider changes")
- Status: "Closed" / "● Open now · closes in..." / "Opens in X days"
- Footer: "All times shown in your local timezone ([TZ])"

→ Implement in app: update badge text to include window context; add tappable behaviour; build the bottom sheet with live data from the competition schedule.

**Default: 3 rider changes per window.** This is configurable per competition (set by admin when creating the competition). DNF replacements are excluded from the change count (per issue #157).

**Addresses:** [#145](https://github.com/Escape-Collective/escape-collective-app/issues/145) (no window time shown on Team Selection) and [#150](https://github.com/Escape-Collective/escape-collective-app/issues/150) (no transfer window schedule visible anywhere in app).
