# Frequently Asked Questions (FAQ)

Common questions and answers about the Flutter Counter App.

## General Questions

### What is this app?

This is a simple counter application built with Flutter that demonstrates basic state management and Material Design UI. It allows users to increment, decrement, and reset a counter value.

### Why is it called "devin_flutter_todo" but it's a counter app?

The repository name suggests it was initially planned as a TODO app, but the current implementation is a counter app that serves as a learning project and demonstration of Flutter basics.

### What can I do with this app?

You can:
- Increment a counter by pressing the + button
- Decrement a counter by pressing the - button (won't go below 0)
- Reset the counter to 0 by pressing the × button (with confirmation)
- Use it as a learning resource to understand Flutter basics
- Fork it and build your own Flutter app on top of it

## Installation & Setup

### What do I need to run this app?

- Flutter SDK 3.8.0 or higher
- Dart SDK 3.8.0 or higher
- A code editor (VS Code, Android Studio, IntelliJ IDEA, etc.)
- A device or emulator to run the app on

### How do I install Flutter?

Follow the official Flutter installation guide for your platform:
- [Windows](https://docs.flutter.dev/get-started/install/windows)
- [macOS](https://docs.flutter.dev/get-started/install/macos)
- [Linux](https://docs.flutter.dev/get-started/install/linux)

### I get "flutter: command not found"

Make sure Flutter is properly installed and added to your PATH. Run:
```bash
which flutter  # macOS/Linux
where flutter  # Windows
```

If not found, reinstall Flutter or add it to your PATH.

### The app won't run on iOS

iOS development requires:
- macOS operating system
- Xcode installed
- iOS Simulator or physical iOS device
- Apple Developer account (for physical devices)

## Features & Usage

### Why won't the counter go below 0?

This is intentional! The app prevents negative values as a demonstration of boundary checking in state management. It doesn't make sense to have a negative count in most counter use cases.

### Why is the confirmation dialog in Japanese?

The app includes Japanese localization as it was developed with a Japanese-speaking audience in mind. You can easily change this by modifying the text in the `_clearCounter()` method in `lib/main.dart` (lines 118-119).

### Can I change the starting counter value?

Yes! Edit `lib/main.dart` line 79:
```dart
int _counter = 10; // Start at 10 instead of 0
```

### Can I set a maximum counter value?

Currently there's no maximum limit. To add one, modify `_incrementCounter()`:
```dart
void _incrementCounter() {
  setState(() {
    if (_counter < 100) { // Add maximum of 100
      _counter++;
    }
  });
}
```

### Does the counter value persist when I close the app?

No, the current implementation doesn't include persistence. The counter resets to 0 (or the starting value) when the app is closed. See [Adding Persistence](#how-do-i-add-persistence-to-save-the-counter) below.

## Development

### How is the code organized?

All code is in a single file (`lib/main.dart`) for simplicity. See the [Architecture Documentation](ARCHITECTURE.md#code-organization) for details.

### What state management approach is used?

The app uses Flutter's built-in `StatefulWidget` with `setState()`. This is the simplest form of state management and perfect for apps with local state. See [Architecture: State Management](ARCHITECTURE.md#state-management).

### Why not use Provider/Bloc/Riverpod?

For this simple app, `StatefulWidget` is sufficient. More complex state management solutions would be overkill. See [Architecture: Design Decisions](ARCHITECTURE.md#1-using-statefulwidget-instead-of-other-state-management).

### Can I use this code in my project?

Yes! This project is MIT licensed, which means you can freely use, modify, and distribute it. See [LICENSE](../LICENSE) for full terms.

### How do I add persistence to save the counter?

Use `shared_preferences` package:

1. Add dependency in `pubspec.yaml`:
```yaml
dependencies:
  shared_preferences: ^2.2.0
```

2. Modify the code:
```dart
import 'package:shared_preferences.dart';

// Load counter on init
@override
void initState() {
  super.initState();
  _loadCounter();
}

Future<void> _loadCounter() async {
  final prefs = await SharedPreferences.getInstance();
  setState(() {
    _counter = prefs.getInt('counter') ?? 0;
  });
}

// Save counter when it changes
Future<void> _saveCounter() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('counter', _counter);
}

// Update increment/decrement/clear methods to call _saveCounter()
```

### How do I add more counters?

Change from a single integer to a list:

```dart
List<int> _counters = [0, 0, 0]; // Three counters

void _incrementCounter(int index) {
  setState(() {
    _counters[index]++;
  });
}

// Update UI to display multiple counters
```

### How do I change the theme/colors?

Edit `lib/main.dart` line 40:
```dart
colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // Or any color
```

Or use a custom ColorScheme:
```dart
colorScheme: ColorScheme.light(
  primary: Colors.blue,
  secondary: Colors.orange,
  // ... more colors
),
```

## Testing

### How do I run tests?

```bash
flutter test
```

### The tests are failing!

First, check what's failing:
```bash
flutter test --reporter expanded
```

Make sure you haven't changed the widget structure that the tests depend on. If you've modified the app, update the tests accordingly in `test/widget_test.dart`.

### How do I add more tests?

See [Contributing: Testing](../CONTRIBUTING.md#testing) for guidelines. Example:

```dart
testWidgets('Counter decrements', (WidgetTester tester) async {
  await tester.pumpWidget(const MyApp());
  
  // First increment to have something to decrement
  await tester.tap(find.byIcon(Icons.add));
  await tester.pump();
  
  // Now decrement
  await tester.tap(find.byIcon(Icons.remove));
  await tester.pump();
  
  expect(find.text('0'), findsOneWidget);
});
```

## Building & Deployment

### How do I build for release?

See [Quick Start: Building for Production](QUICK_START.md#building-for-production) for platform-specific commands.

### The build size is too large!

Use these optimization flags:
```bash
flutter build apk --release --shrink --split-per-abi
```

For web:
```bash
flutter build web --release --web-renderer canvaskit
```

### Can I publish to app stores?

Yes! Follow these guides:
- [Google Play Store](https://docs.flutter.dev/deployment/android)
- [Apple App Store](https://docs.flutter.dev/deployment/ios)
- [Web Hosting](https://docs.flutter.dev/deployment/web)

## Platform-Specific

### Why doesn't it work on my platform?

Check:
1. Flutter is installed: `flutter doctor`
2. Platform tools are installed (Xcode for iOS, Android Studio for Android, etc.)
3. Device/emulator is connected: `flutter devices`

### How do I choose which platform to run on?

```bash
flutter devices  # List all devices
flutter run -d <device-id>  # Run on specific device
```

### Can I disable certain platforms?

Yes, remove the platform folders you don't need:
```bash
# Be careful - this is permanent!
rm -rf ios/      # Remove iOS support
rm -rf windows/  # Remove Windows support
```

## Performance

### The app is slow/laggy

Try:
1. Run in release mode: `flutter run --release`
2. Use a real device instead of emulator
3. Check for performance issues: `flutter run --profile`

### How do I optimize the app?

- Use `const` constructors where possible (already done)
- Avoid unnecessary rebuilds
- Use `flutter analyze` to find issues
- Profile with DevTools

## Contributing

### How do I contribute?

See [CONTRIBUTING.md](../CONTRIBUTING.md) for complete guidelines.

Quick steps:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

### What kind of contributions are welcome?

- Bug fixes
- New features
- Documentation improvements
- Test coverage
- Performance optimizations
- Localization

### I found a bug, what should I do?

1. Check if it's already reported in [Issues](https://github.com/taimatu7/devin_flutter_todo/issues)
2. If not, open a new issue with:
   - Clear description
   - Steps to reproduce
   - Expected vs actual behavior
   - Screenshots if applicable
   - Your environment (OS, Flutter version, etc.)

## Documentation

### Where can I find more documentation?

- [Quick Start Guide](QUICK_START.md) - Get started quickly
- [API Documentation](API.md) - Code reference
- [Architecture Guide](ARCHITECTURE.md) - Design and structure
- [Contributing Guide](../CONTRIBUTING.md) - Development guidelines
- [Main README](../README.md) - Project overview (Japanese)

### The documentation is unclear/incorrect

Please help us improve! You can:
1. Open an issue describing the problem
2. Submit a pull request with fixes
3. Ask questions in discussions

### Is there documentation in other languages?

Currently:
- **Japanese**: Main README ([../README.md](../README.md))
- **English**: All other documentation

Translations are welcome! See [CONTRIBUTING.md](../CONTRIBUTING.md).

## License & Legal

### What license is this under?

MIT License. See [LICENSE](../LICENSE) for full text.

### Can I use this commercially?

Yes! The MIT license allows commercial use.

### Do I need to credit the original authors?

The MIT license requires that you include the original copyright notice and license text in your copies. It's also good practice to credit the original authors.

### Can I relicense this?

You can choose any license for your modifications, but the original code must retain the MIT license notice.

## Still Have Questions?

- **Check the docs**: [Documentation Index](README.md)
- **Search issues**: [GitHub Issues](https://github.com/taimatu7/devin_flutter_todo/issues)
- **Ask a question**: [Open a new issue](https://github.com/taimatu7/devin_flutter_todo/issues/new)
- **Start a discussion**: Use GitHub Discussions (if enabled)

---

**Note**: This FAQ is maintained by the community. If you have a question not listed here, please ask! We'll add it to help future users.
