
# Rick and Morty Pokedex

A Flutter app that serves as a themed Pokedex using the Rick and Morty API. It supports Web and Android, features search, detail, and responsive UI, and is fully automated for CI/CD.

## Features
- Search Rick and Morty characters
- View character details, locations, and episodes
- Responsive design for Web and Android
- Provider for state management
- Custom widgets: CharacterCard, SearchBarRick, EntityBadge
- Pagination, error handling, and retry logic
- Linting, formatting, and CI workflow
- Unit and widget tests

## Getting Started
1. Install Flutter 3.22.0 or newer
2. Run `flutter pub get`
3. To run for Web: `flutter run -d chrome`
4. To run for Android: `flutter run -d android`

## Project Structure
- `lib/models`: Data models (Character, Location, Episode)
- `lib/services`: API service
- `lib/providers`: Search provider
- `lib/widgets`: Custom widgets
- `lib/screens`: App screens
- `test/`: Unit and widget tests
- `.github/workflows/ci.yaml`: CI workflow
- `analysis_options.yaml`: Lint rules

## CI/CD
- GitHub Actions workflow runs analyze, format, and test on every push/PR

## Justification
- Strict folder structure and naming for maintainability
- Provider for scalable state management
- Custom widgets for UI consistency
- Automated tests and CI for reliability

## Checklist
- [x] Scaffold project and structure
- [x] Configure dependencies
- [x] Implement models, services, provider, widgets, screens
- [x] Add tests and CI
- [x] Build for Web and Android
- [x] Write documentation

## Improvements
- Add integration tests
- Enhance UI with more animations
- Support for iOS and desktop
- Add more filtering options

---

Made by luizGDpulz, September 2025.
