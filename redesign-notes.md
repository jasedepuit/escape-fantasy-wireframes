# Escape Fantasy — Redesign Working Notes

Running record of the Wade/Jase brand-alignment discussion and decisions.
Not a spec yet — a backlog so nothing is lost between chats/timeouts.

## Background

Wade wants the Fantasy app brought more in line with the Escape Collective brand
(for the **TdFF** to start). He generated an AI redesign via Claude Design with the
prompt *"please adjust these screenshots of our fantasy competition app into the
visual language and design elements of Escape Collective."* Jase is doing a
targeted, considered pass rather than adopting the mock wholesale.

## Two image sets (don't confuse them)

- **Current app** = 5 vertical iPhone screens (Home, Home/News scrolled, Compete,
  Leagues, News tab).
- **Wade's proposal** = 4-panel horizontal mock (Home, Compete, Leagues, News).

## Findings from the wireframe code

- **Fonts:** wireframes use *system* stacks only — no Maxfett, no `@font-face`, no
  web-font link anywhere. So "we already use Escape fonts" is not true here, and
  Jase's read is the app probably doesn't either. Treat brand fonts as an **add**
  or a **defer-to-Luke**, not a confirmation. (Maxfett rule: Upper first letter,
  lower rest, every instance.)
- **Orange:** accent is already `#FF6F42` across all screens (200+ uses). This is
  the *current* orange — confirm it's not the unreleased "new" orange. Wade's mock
  uses the same orange, so nothing to change here.
- **Allcaps:** all driven by CSS `text-transform: uppercase` (177 rules). Live page
  headings are actually **title-case** ("Competitions/Leagues/News"); the **nav bar**
  labels are the uppercase ones (HOME/COMPETE/LEAGUES/NEWS/ACCOUNT). Wade's mock
  *increases* heading prominence to big ALLCAPS — contrary to his own note; ignore.
- **News cards** (`wireframe-15`): `.article-card` (+ `.compact` no-image variant),
  `.article-pill` (category, currently above headline), `.article-headline`,
  `.article-excerpt`, `.article-meta` (`.article-author`, `.article-time`).
- **Buttons:** radii are a mix (20px common; 44/50px full pills). Easy to tune.

## Decisions / positions (Jase)

- **Hold the new orange** until it's revealed on the site + main app. Keep `#FF6F42`.
- **Resist introducing new colours** — colour cohesion is what ties the products to
  the Escape brand; more arbitrary colour works against that. (Comparison shows the
  mock barely adds any colour anyway.)
- **Keep Home's News module** — Home is a deliberate dashboard/overview of the app,
  not redundant with the News tab. (Rejects Wade's "remove news from home.")
- **Remove the redundant page-title headings** (title-case ones) to reclaim vertical
  space; the nav bar already provides context.
- **Fonts:** add brand font or defer to Luke — decide. Not currently present.

## News tab improvements (Jase's direction — diverges from Wade's mock)

- **Bigger thumbnails** — especially the Home news module (tiny squares now).
- **Move category tag below the description** (relocate `.article-pill` to after
  `.article-excerpt`, into/near the meta row). NB: this is a hierarchy change; keep
  the tag visually distinct from the byline. Filter pills at top already handle
  orientation, so a footer tag is defensible.
- **More metadata** — add date + comment count to `.article-meta` (Wade's mock shows
  `AUTHOR · 29 JUL · 120 COMMENTS`).
- **Fix awkward excerpt truncation / image cropping** (the "crops weird" Wade flagged).

## Not this repo's job (Luke / backend)

- Competition images + the obviously-AI placeholder graphics ("DAILY NEWS" newspaper
  art, generic purple comp backgrounds) — served from backend, swap anytime.
- Actual brand-font implementation in the shipped app.

## Open questions

1. **Scope of "for the TdFF":** apply the global style cleanups (headings, buttons,
   nav casing) and *showcase* on TdFF screens for handover — vs only TdFF-specific
   assets? (Fonts/headings/buttons are app-wide, not per-competition.)
2. **Nav-bar label casing:** leave uppercase, or switch to title case? (Small eyebrow
   labels like "YOUR NEXT START" probably stay uppercase — don't flip all 177 rules.)

## Corrections (from Jase)

- **Page headings:** the ALLCAPS headings were a Claude-Design artefact (it set them in
  MaxFett, done wrong). NOT the nav bar. Decision: **remove those page headings entirely** —
  redundant with the nav bar, reclaim space.
- **News tiles:** Wade's are **squarer** (taller image aspect → more image shows, fixes the
  weird crop) and read cleaner with **excerpt first, then meta (category + author) below**.
  Jase likes this — so it's *agree with Wade*, plus bigger thumbnails (esp. the Home news
  module's tiny squares).
- **AI images = the competition banners** specifically (generic purple backgrounds) →
  swapped server-side by Luke. Not a wireframe change.

## Fonts

- Brand fonts now in the repo under `Fonts/`: **ABC Social** (full family: Regular/Medium/Bold
  + italics, woff2/woff/otf) and **MaxFett** (Black weight only, woff/otf).
- Standards confirm **EC Orange = `#FF6F42`** = exactly what the app already uses. Current
  orange IS the brand orange (not the unreleased one). No colour change needed.
- Plan: **ABC Social = all UI/body text; MaxFett Black = display moments only.** The "escape
  Fantasy" logo stays as the existing image (per Jase).
- Note: app uses font-weights up to 900; ABC Social tops at Bold 700, so 800/900 fall back to
  700 (slightly lighter). Acceptable; revisit if needed.
- **PILOT DONE:** `wireframe-01-home-v2.html` only — `@font-face` added, body stack → ABC
  Social (cascades to whole screen). All 7 font paths verified. View locally by opening the
  file (fonts load via relative paths from `Fonts/`).

### ⚠️ Font licensing — decide before pushing
MaxFett and ABC Social are commercial fonts. The repo is **public** (GitHub Pages), so pushing
the `Fonts/` files publishes them as downloadable files — likely a licence breach. **Holding
off on pushing.** Options: (a) keep fonts local / handover only, no push; (b) make repo
private (Pages implications); (c) Luke serves properly-licensed webfonts in the real app,
wireframes stay local. Jase to decide.

## Open questions

3. **Where should MaxFett appear?** Logo is an image and page headings are being removed, so
   MaxFett may have few/no text targets on these screens. Confirm intended display use.

## Status

Font pilot applied to Home only, local-view. Awaiting Jase's review + rollout go-ahead and
the licensing/push decision. Other 33 screens untouched.
