# Trello API Setup Guide

## Overview

This document covers how to authenticate with the Trello REST API and perform board operations (create lists, create cards, apply labels, archive cards). We use the Desert Storm board in the Escape Collective workspace as the bug tracker for the Fantasy app QA process.

---

## Step 1 — Get your API Key

1. Go to [https://trello.com/power-ups/admin](https://trello.com/power-ups/admin) and log in with the Escape Collective Trello account.
2. Click **New Power-Up** (or select an existing one if already set up).
3. Under **API Key**, copy the key shown. It looks like: `ccf39c9e4a7606caec3a7e9d8c8a76bf`

> **Note:** The page also shows an "OAuth Secret" — this is **not** the token you need. Do not use it for API calls.

---

## Step 2 — Generate a Token with Read+Write access

The API key alone only identifies your app. You also need a **token** that grants permission to act on a user's account. Tokens must be generated with the correct scope or write operations will return `403 Forbidden`.

Open this URL in a browser while logged into the Trello account you want to use:

```
https://trello.com/1/authorize?key=YOUR_API_KEY&name=EscapeFantasyQA&expiration=never&response_type=token&scope=read,write
```

Replace `YOUR_API_KEY` with the key from Step 1.

- Click **Allow** on the authorisation page.
- Trello will display a token string. Copy it immediately — it is only shown once.
- Store it securely (e.g. in a `.env` file, never in version control).

> `expiration=never` means the token doesn't expire. Use `expiration=30days` if you prefer a time-limited token.

---

## Step 3 — Make API calls

### Base URL

Trello's REST API is served from `https://trello.com/1/` — **not** `https://api.trello.com/1/`. Using the `api.trello.com` subdomain will fail.

### Authentication

Pass your key and token as query parameters on every request:

```
https://trello.com/1/boards/{boardId}/cards?key=YOUR_KEY&token=YOUR_TOKEN
```

### Example: Get all open boards

```bash
curl "https://trello.com/1/members/me/boards?fields=name,id,closed&key=YOUR_KEY&token=YOUR_TOKEN"
```

### Example: Get all cards on a board

```bash
curl "https://trello.com/1/boards/{boardId}/cards?fields=id,name&key=YOUR_KEY&token=YOUR_TOKEN"
```

### Example: Create a list

```bash
curl -X POST "https://trello.com/1/lists?name=Backlog&idBoard={boardId}&key=YOUR_KEY&token=YOUR_TOKEN"
```

### Example: Create a card

```bash
curl -X POST "https://trello.com/1/cards?idList={listId}&name=Card+Title&desc=Description+here&key=YOUR_KEY&token=YOUR_TOKEN"
```

### Example: Archive a card

```bash
curl -X PUT "https://trello.com/1/cards/{cardId}?closed=true&key=YOUR_KEY&token=YOUR_TOKEN"
```

### Example: Create a label on a board

```bash
curl -X POST "https://trello.com/1/labels?name=Bug&color=red&idBoard={boardId}&key=YOUR_KEY&token=YOUR_TOKEN"
```

### Example: Apply a label to a card

```bash
curl -X POST "https://trello.com/1/cards/{cardId}/idLabels?value={labelId}&key=YOUR_KEY&token=YOUR_TOKEN"
```

---

## CSRF gotcha — calls from browser JavaScript

If you are making API calls via `fetch()` in browser JavaScript and your page is hosted on `trello.com`, Trello's CSRF protection will block all `PUT`/`POST` requests with `{"message":"CSRF detected","error":"REQUEST_CSRF_ERROR"}`.

**Fix:** Make the API calls from a page on a different domain (any non-trello.com origin). When the request originates from a different domain, the browser does not send Trello's session cookies, and Trello authenticates via the `key`/`token` query params as intended.

This does not affect server-side calls (Node.js, Python, etc.) since there are no browser cookies involved.

---

## Board & List IDs (Escape Collective)

| Board | ID |
|---|---|
| Desert Storm (QA bug tracker) | `6462034fd8271cefeaae1010` |

| List | ID |
|---|---|
| Backlog | `69ddeb2c765b99683d86b484` |

---

## Environment variables

Recommended `.env` setup:

```
TRELLO_API_KEY=ccf39c9e4a7606caec3a7e9d8c8a76bf
TRELLO_TOKEN=your_token_here
TRELLO_BOARD_ID=6462034fd8271cefeaae1010
TRELLO_BACKLOG_LIST_ID=69ddeb2c765b99683d86b484
```

---

## Further reading

- [Trello REST API reference](https://developer.atlassian.com/cloud/trello/rest/)
- [Trello authorisation guide](https://developer.atlassian.com/cloud/trello/guides/rest-api/authorization/)
