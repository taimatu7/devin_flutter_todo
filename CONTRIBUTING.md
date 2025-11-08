# Contributing to Flutter Counter App

We love your input! We want to make contributing to this project as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Becoming a maintainer

## Development Process

We use GitHub to host code, to track issues and feature requests, as well as accept pull requests.

### Pull Request Process

1. Fork the repository and create your branch from `main`
2. If you've added code that should be tested, add tests
3. If you've changed APIs, update the documentation
4. Ensure the test suite passes
5. Make sure your code follows the existing code style
6. Issue that pull request!

## Any Contributions You Make Will Be Under the MIT License

When you submit code changes, your submissions are understood to be under the same [MIT License](LICENSE) that covers the project. Feel free to contact the maintainers if that's a concern.

## Report Bugs Using GitHub's [Issue Tracker](https://github.com/taimatu7/devin_flutter_todo/issues)

We use GitHub issues to track public bugs. Report a bug by [opening a new issue](https://github.com/taimatu7/devin_flutter_todo/issues/new).

### Write Bug Reports With Detail, Background, and Sample Code

**Great Bug Reports** tend to have:

- A quick summary and/or background
- Steps to reproduce
  - Be specific!
  - Give sample code if you can
- What you expected would happen
- What actually happens
- Notes (possibly including why you think this might be happening, or stuff you tried that didn't work)

## Development Setup

### Prerequisites

- Flutter SDK 3.8.0 or higher
- Dart SDK 3.8.0 or higher
- Platform-specific development tools (Xcode for iOS, Android Studio for Android, etc.)

### Setting Up Your Development Environment

1. **Clone the repository**
   ```bash
   git clone https://github.com/taimatu7/devin_flutter_todo.git
   cd devin_flutter_todo
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify your setup**
   ```bash
   flutter doctor
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## Code Style Guidelines

We follow the official [Dart style guide](https://dart.dev/guides/language/effective-dart/style) and use `flutter_lints` for static analysis.

### Running the Linter

```bash
flutter analyze
```

### Formatting Code

```bash
dart format lib/ test/
```

## Testing

### Running Tests

```bash
flutter test
```

### Writing Tests

- Write widget tests for UI components
- Write unit tests for business logic
- Ensure all new features have corresponding tests
- Maintain or improve code coverage

### Test File Location

Place test files in the `test/` directory, mirroring the structure of `lib/`.

## Documentation

### Code Documentation

- Use dartdoc comments (`///`) for public APIs
- Document all public classes, methods, and properties
- Include examples in documentation where helpful
- Keep documentation up to date with code changes

### Updating README

If you add significant features, please update the README.md to reflect these changes.

## Commit Message Guidelines

We follow conventional commits for clear commit messages:

- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `style:` - Code style changes (formatting, etc.)
- `refactor:` - Code refactoring
- `test:` - Adding or updating tests
- `chore:` - Maintenance tasks

Example:
```
feat: add counter history tracking
fix: prevent counter from going negative
docs: update API documentation
```

## Project Structure

```
devin_flutter_todo/
├── lib/
│   └── main.dart          # Main application code
├── test/
│   └── widget_test.dart   # Widget tests
├── docs/                  # Additional documentation
├── android/               # Android platform code
├── ios/                   # iOS platform code
├── web/                   # Web platform code
├── windows/               # Windows platform code
├── macos/                 # macOS platform code
├── linux/                 # Linux platform code
└── pubspec.yaml           # Project dependencies
```

## Adding New Features

When adding new features:

1. Create a new branch with a descriptive name
2. Implement the feature following the existing architecture
3. Add appropriate tests
4. Update documentation
5. Run linter and tests
6. Submit a pull request with a clear description

## Code Review Process

- All submissions require review before merging
- Reviewers will check for:
  - Code quality and style
  - Test coverage
  - Documentation updates
  - Performance implications
  - Cross-platform compatibility

## Community

- Be respectful and inclusive
- Help others learn and grow
- Provide constructive feedback
- Follow the [Code of Conduct](CODE_OF_CONDUCT.md)

## Questions?

Feel free to ask questions by:
- Opening an issue
- Starting a discussion
- Contacting the maintainers

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to make this project better! 🎉
