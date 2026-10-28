# Iheb Meftah — Portfolio

Personal portfolio site for [Iheb Meftah](https://github.com/ihebmeftah), built with Flutter for the web. It presents two profiles (Flutter mobile engineer and software engineer), work history, a technology stack, selected projects, and contact details, in English, German, and French.

## Features

- **Home, Work, Stack, Projects, and Contact** as routed pages
- **Profile switch** between mobile and software copy, skills, and CV
- **Languages:** English, German, and French, with a first-visit language prompt
- **Theme:** system, light, and dark, remembered in the browser
- **CV download** that matches the active profile and language (English Europass or German Lebenslauf)
- Responsive layout, page transitions, and a pointer glow on desktop

## Stack

| Area | Choice |
| --- | --- |
| UI | Flutter (Material), Fraunces and Outfit |
| State | Riverpod |
| Routing | go_router with typed routes |
| Localization | Flutter gen-l10n (`en`, `de`, `fr`) |
| Persistence | shared_preferences |
| Hosting | Firebase Hosting (`build/web`) |

## Pages

| Path | Page |
| --- | --- |
| `/` | Home |
| `/work` | Experience |
| `/stack` | Technologies (`?focus=` highlights one tool) |
| `/projects` | Selected projects |
| `/contact` | Contact |

Projects currently linked from the site:

- [Sip & Sync POS](https://github.com/ihebmeftah/sip_sync)
- [GraphQL API](https://github.com/ihebmeftah/nest_graphql)
- [E-commerce application](https://github.com/ihebmeftah/E-commerce-Full-App-Web-Getx---Firebase-Mvc)
- [Movies applications](https://github.com/ihebmeftah/movieapp_ios_swiftui)

## Run locally

Requires the Flutter SDK listed in `pubspec.yaml` (`sdk: ^3.13.0`).

```bash
flutter pub get
flutter run -d chrome
```

## Project layout

```text
lib/
  app.dart                 app shell, theme, locale, router
  main.dart                startup and SharedPreferences override
  core/                    theme, routes, breakpoints, file download
  features/                home, work, stack, projects, contact, footer
  l10n/                    ARB source files (en, de, fr)
  providers/               theme, locale, and profile focus
  shared/widgets/          layout and motion widgets
assets/                    images and fonts
cv/                        PDF resumes bundled as assets
web/                       Flutter web host page
```

Copy for both profiles lives in `lib/l10n/app_en.arb` (and the `de` / `fr` files). Experience, projects, and skill lists are assembled in `lib/features/portfolio/portfolio_content.dart`.

## Localization

Edit the ARB files, then regenerate:

```bash
flutter gen-l10n
```

`l10n.yaml` points at `lib/l10n` and treats English as the template.

## Routes

Typed routes are generated from `lib/core/router/app_routes.dart`:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Tests

```bash
flutter test
```

## Deploy

The Firebase project is `ihebportfolio`. Build the web app, then deploy hosting:

```bash
flutter build web
firebase deploy --only hosting
```

`firebase.json` serves `build/web` and rewrites every path to `index.html` so client-side routes work on refresh.
