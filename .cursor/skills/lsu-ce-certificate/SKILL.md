---
name: lsu-ce-certificate
description: >-
  Design and build LSU Continuing Education certificate program landing pages
  (certificate.html, certificate.css). Applies frontend-design craft—layout,
  motion, composition—while enforcing LSU CE brand tokens from styles.css.
  Use when building or editing certificate pages, program landing mockups,
  cert-* components, or LSU CE marketing pages in this repo.
---

# LSU CE Certificate Pages

Build polished, distinctive certificate landing pages that feel intentionally designed—not generic—but stay on LSU Continuing Education brand.

**Read `~/.cursor/skills/frontend-design/SKILL.md` for design thinking** (purpose, composition, motion, backgrounds). This skill adds brand constraints and project conventions on top of that.

## Brand vs. creativity

| Keep (brand) | Push (craft) |
|--------------|--------------|
| Purple + gold palette from `:root` | Asymmetry, overlap, editorial section rhythm |
| Typekit fonts already loaded | Staggered reveals, scroll polish, hover delight |
| Clock tower motif in hero/sections | Layered gradients, depth, cropped tower framing |
| `.container`, spacing utilities | Grid-breaking accents, strong visual hierarchy |
| Accessible contrast on purple/gold | Micro-interactions on cards, nav, CTAs |

Purple gradients are **on-brand here**—use them with intention (hero atmosphere, facts bar), not as a default wash.

## File structure

```
certificate.html   — page markup; body.certificate-page
certificate.css    — all cert-* styles; loads after styles.css
certificate.js     — nav scroll, FAQ accordion, form behavior
styles.css         — shared tokens, .container, typography utilities
images/            — clock-tower.png, clock-tower-white.png
```

Always link in this order:

```html
<link rel="stylesheet" href="styles.css" />
<link rel="stylesheet" href="certificate.css" />
<link rel="stylesheet" href="https://use.typekit.net/gfh4svy.css" />
```

## Design tokens (from styles.css)

Use CSS variables—never hardcode brand colors:

```css
/* Primary */
rgb(var(--purple))      /* #461D7C */
var(--purple-hover)     /* #683DA0 */
var(--purple-dark-bg)   /* #271145 */
var(--purple-200)       /* #9C7DC5 — labels on dark */

/* Accent */
rgb(var(--gold))        /* #FDD023 */
var(--gold-100)         /* #F9F8F0 — alt section bg */
var(--gold-hover)

/* Typography */
var(--font-heading)     /* jubilat — h1/h2 */
var(--font-primary)     /* roboto — body */
var(--font-button)      /* proxima-nova — buttons, uppercase */
var(--font-label)       /* peridot-pe-variable — eyebrows, dt */

/* Spacing */
var(--spacing-sm) … var(--spacing-2xl)
var(--section-padding-compact)  /* .section-pad-sm */
var(--container-max)
var(--border-radius)    /* 4px */
```

Typography utilities from `styles.css`: `.label`, `.body-lead`, `.body-lg`, `.body-default`, `.header-xs`, `.accent` (gold span in headings).

## Naming and components

Prefix all page-specific classes with `cert-` (BEM: `cert-block__element--modifier`).

| Pattern | Use |
|---------|-----|
| `.cert-btn` + modifiers | `--primary`, `--secondary`, `--outline`, `--outline-dark`, `--sm/md/lg` |
| `.cert-hero` | Dark purple hero; tower via `::before`, gradient overlay via `::after` |
| `.cert-facts` | Purple stats bar; 4-column grid at 1024px |
| `.cert-nav` | Sticky in-page section nav |
| `.cert-section` | Content sections; `--alt` for gold-100 bg, `--form` for lead form |
| `.cert-feature`, `.cert-card`, `.cert-faq` | Reusable content blocks |

Reuse existing cert-* patterns before inventing new ones. Extend `certificate.css` only—do not add certificate styles to `styles.css`.

## Page sections (reference order)

1. Mobile sticky enroll bar — `.cert-enroll-bar`
2. Hero — `.cert-hero.section-pad-sm`
3. Quick facts — `.cert-facts` (4 items)
4. Sticky nav — `.cert-nav`
5. Main — overview, curriculum, skills, pricing, testimonials, FAQ
6. Request info form — `#request-info`

Each content section: `.cert-section.section-pad-sm` > `.container` > header + content grid.

## Hero clock tower

Tower lives on `.cert-hero::before` (z-index 0). Gradient overlay on `::after` (z-index 1). Content in `.container` (z-index 2).

```css
/* Edit position on ::before — mobile base rule */
.cert-hero::before {
  background-image: url('images/clock-tower-white.png');
  background-position: 78% 96px;           /* mobile */
  background-size: auto min(260%, 1180px);
  mix-blend-mode: overlay;                 /* white-on-black PNG */
}

/* Desktop overrides in @media (min-width: 768px) */
```

- Image is white line art on opaque black → use `mix-blend-mode: overlay` or `screen`, not low opacity alone.
- Size with height-first `auto min(N%, Npx)` to crop tower dramatically.
- Position edits go on `.cert-hero::before` per breakpoint (not CSS variables on parent—media queries override).
- Right-side gradient on `::after` must stay lighter so the tower shows through.

## Motion and interaction

Prefer CSS-only. Match `--transition-base` (0.3s ease).

High-impact targets:

- Hero content: subtle fade/slide on load (`animation-delay` stagger)
- `.cert-nav__link`: active state + scroll shadow on `.cert-nav.is-scrolled`
- `.cert-card`, `.cert-feature`: hover lift or border accent
- FAQ accordion: smooth height via `certificate.js` patterns already in place

One orchestrated page-load sequence beats scattered effects. Respect `prefers-reduced-motion`.

## Accessibility

- Semantic HTML: `<section>`, `<nav>`, `<dl>` for facts, heading hierarchy
- Focus states: follow `.cert-btn:focus-visible` pattern in certificate.css
- Icon images: `alt=""` when decorative, meaningful alt when informative
- Sticky bars: don't trap focus; enroll bar visible on mobile only

## Checklist before finishing

- [ ] Uses tokens from `:root`—no rogue hex except rgba overlays
- [ ] Typekit fonts only (no Inter, Arial, system-ui for headings)
- [ ] New styles in `certificate.css` with `cert-` prefix
- [ ] Mobile-first breakpoints: 640, 768, 1024px (match existing file)
- [ ] CTAs use real portal URLs where enroll links exist
- [ ] Hero tower visible at mobile and desktop breakpoints
- [ ] Composition feels designed (spacing, hierarchy, rhythm)—not a template fill-in

## Anti-patterns

- Adding React/framework for static landing pages
- Generic card grids with no LSU character (tower, gold accents, jubilat headings)
- Editing `styles.css` for certificate-only concerns
- Splitting `background-position` across CSS variables with multi-token values like `bottom -12%`
- Fifth facts column (grid is 4 columns at 1024px)
