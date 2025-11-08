# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-11-08

### Added
- Initial release of Flutter Counter App
- Counter increment functionality with (+) button
- Counter decrement functionality with (-) button
- Counter clear functionality with (×) button
- Confirmation dialog before clearing counter
- Japanese language support for confirmation dialog
- Material Design UI
- Cross-platform support (iOS, Android, Web, Windows, macOS, Linux)
- Comprehensive README in Japanese
- Complete dartdoc API documentation
- Project documentation (CHANGELOG, CONTRIBUTING, docs/)

### Features
- Counter starts at 0
- Prevents negative values (counter won't go below 0)
- Smooth state management using StatefulWidget
- Responsive UI with Material Design 3
- Three floating action buttons for all operations

### Technical Details
- Flutter SDK: ^3.8.0
- Dart SDK: ^3.8.0
- Dependencies: flutter, cupertino_icons ^1.0.8
- Dev Dependencies: flutter_test, flutter_lints ^5.0.0

## [Unreleased]

### Planned Features
- Persistent storage to save counter value
- Multiple counter support
- Custom themes and color schemes
- Counter history tracking
- Export/Import counter data
- Localization for multiple languages

---

[1.0.0]: https://github.com/taimatu7/devin_flutter_todo/releases/tag/v1.0.0
