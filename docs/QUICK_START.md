# Quick Start Guide

Get started with the Flutter Counter App in minutes!

## 🚀 5-Minute Setup

### Prerequisites

- Flutter SDK 3.8.0+ ([Install Flutter](https://docs.flutter.dev/get-started/install))
- Git

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/taimatu7/devin_flutter_todo.git
cd devin_flutter_todo

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

That's it! The app should now be running on your connected device or emulator.

## 📱 First Run

When you first run the app, you'll see:

- A counter starting at **0**
- A label saying "You have pushed the button this many times:"
- Three floating action buttons on the right side:
  - **×** (Clear) - Resets counter to 0 with confirmation
  - **-** (Decrement) - Decreases counter by 1
  - **+** (Increment) - Increases counter by 1

## 🎮 Basic Usage

### Increment Counter
1. Tap the **+** button (bottom)
2. Counter increases by 1
3. No limit on how high you can count

### Decrement Counter
1. Tap the **-** button (middle)
2. Counter decreases by 1
3. Counter won't go below 0

### Clear Counter
1. Tap the **×** button (top)
2. Confirmation dialog appears in Japanese
3. Tap **OK** to reset to 0, or **Cancel** to keep current value

## 🖥️ Platform-Specific Commands

### Web
```bash
flutter run -d chrome
```

### Mobile
```bash
# Android
flutter run -d android

# iOS (macOS only)
flutter run -d ios
```

### Desktop
```bash
# Windows (Windows only)
flutter run -d windows

# macOS (macOS only)
flutter run -d macos

# Linux (Linux only)
flutter run -d linux
```

## 🔍 Exploring the Code

The entire app is in one file: `lib/main.dart`

**Key Components:**
- `main()` - App entry point (line 18)
- `MyApp` - Root widget (line 27)
- `MyHomePage` - Main UI widget (line 52)
- `_MyHomePageState` - State management (line 73)

**Key Methods:**
- `_incrementCounter()` - Increases count (line 85)
- `_decrementCounter()` - Decreases count (line 95)
- `_clearCounter()` - Resets count (line 112)

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

## 🔧 Development Commands

```bash
# Analyze code
flutter analyze

# Format code
dart format lib/ test/

# Hot reload (when app is running)
# Press 'r' in terminal

# Hot restart (when app is running)
# Press 'R' in terminal
```

## 📦 Building for Production

### Android APK
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### Web
```bash
flutter build web --release
# Output: build/web/
```

### Desktop
```bash
# Windows
flutter build windows --release

# macOS
flutter build macos --release

# Linux
flutter build linux --release
```

## 🐛 Troubleshooting

### App Won't Run

**Check Flutter setup:**
```bash
flutter doctor
```

**Fix any issues reported by Flutter Doctor**

### Dependencies Issue

```bash
# Clean and reinstall
flutter clean
flutter pub get
```

### Build Issues

```bash
# Clean build cache
flutter clean

# Rebuild
flutter run
```

### Hot Reload Not Working

- Try hot restart instead (press 'R')
- Or fully restart the app

## 📚 Next Steps

### Learn More

1. **Read the Docs:**
   - [API Documentation](API.md) - Understand the code
   - [Architecture Guide](ARCHITECTURE.md) - Learn the design
   - [Contributing Guide](../CONTRIBUTING.md) - Join development

2. **Explore Features:**
   - Try all three buttons
   - Test the confirmation dialog
   - Try different platforms

3. **Modify the App:**
   - Change the color scheme in `MyApp` (line 40)
   - Modify button text in `_MyHomePageState.build()` (line 161)
   - Add new features!

### Customize

**Change Theme Color:**
```dart
// In lib/main.dart, line 40
colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // Change from deepPurple
```

**Change App Title:**
```dart
// In lib/main.dart, line 38
title: 'My Counter App', // Change from 'Flutter Demo'
```

**Change Button Icons:**
```dart
// In lib/main.dart, lines 176, 182, 189
child: const Icon(Icons.refresh), // Instead of Icons.clear
child: const Icon(Icons.remove_circle), // Instead of Icons.remove
child: const Icon(Icons.add_circle), // Instead of Icons.add
```

## 💡 Tips

- **Hot Reload**: Save files to instantly see changes (press 'r')
- **DevTools**: Run `flutter pub global activate devtools` then `flutter pub global run devtools` for debugging
- **Multiple Devices**: Run `flutter devices` to see all available devices
- **Performance**: Use `flutter run --profile` for performance profiling

## ❓ Common Questions

**Q: Why is the confirmation dialog in Japanese?**  
A: The app was developed with Japanese localization. You can modify the text in `_clearCounter()` method (line 118-119).

**Q: Can I change the starting counter value?**  
A: Yes! Modify `int _counter = 0;` in line 79 to start at a different value.

**Q: How do I add persistence?**  
A: See [Architecture Guide](ARCHITECTURE.md#future-architecture-considerations) for recommendations.

**Q: Can I use this as a template?**  
A: Absolutely! It's MIT licensed. Fork it and build something awesome!

## 🤝 Get Help

- **Issues**: [GitHub Issues](https://github.com/taimatu7/devin_flutter_todo/issues)
- **Docs**: [Documentation Index](README.md)
- **Contributing**: [Contributing Guide](../CONTRIBUTING.md)

---

**Happy Coding!** 🎉

If you found this helpful, consider ⭐ starring the repository!
