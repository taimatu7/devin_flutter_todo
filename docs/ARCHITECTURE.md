# Architecture Documentation

This document explains the architecture, design patterns, and technical decisions behind the Flutter Counter App.

## Table of Contents

- [Overview](#overview)
- [Architecture Pattern](#architecture-pattern)
- [Component Hierarchy](#component-hierarchy)
- [State Management](#state-management)
- [Data Flow](#data-flow)
- [Design Decisions](#design-decisions)
- [Code Organization](#code-organization)
- [Platform Architecture](#platform-architecture)

## Overview

The Flutter Counter App is a simple cross-platform application built using Flutter framework. It demonstrates fundamental Flutter concepts including:

- Widget composition
- State management with StatefulWidget
- Event handling
- Material Design implementation
- Cross-platform compatibility

### Technology Stack

- **Framework:** Flutter SDK ^3.8.0
- **Language:** Dart ^3.8.0
- **UI Framework:** Material Design 3
- **State Management:** StatefulWidget + setState
- **Testing:** flutter_test
- **Linting:** flutter_lints ^5.0.0

## Architecture Pattern

### MVC-Inspired Architecture

This application follows a simplified MVC (Model-View-Controller) pattern adapted for Flutter:

```
┌─────────────────────────────────────────┐
│              MyApp (Root)               │
│         (MaterialApp Config)            │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│         MyHomePage (View)               │
│        (StatefulWidget)                 │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│     _MyHomePageState (Controller)       │
│   - State Management                    │
│   - Business Logic                      │
│   - Event Handling                      │
│   - Model: _counter (int)               │
└─────────────────────────────────────────┘
```

#### Layers

**Model Layer:**
- `_counter`: Integer holding the current count value
- Simple primitive type, no separate model class needed

**View Layer:**
- `MyHomePage`: Stateful widget defining the UI structure
- `build()` method in `_MyHomePageState`: Renders the UI

**Controller Layer:**
- `_MyHomePageState`: Manages state and handles user interactions
- `_incrementCounter()`: Increment business logic
- `_decrementCounter()`: Decrement business logic
- `_clearCounter()`: Clear business logic with confirmation

## Component Hierarchy

### Widget Tree Structure

```
MaterialApp
└── MyHomePage (StatefulWidget)
    └── _MyHomePageState
        └── Scaffold
            ├── AppBar
            │   └── Text (title)
            │
            ├── Body
            │   └── Center
            │       └── Column
            │           ├── Text ("You have pushed...")
            │           └── Text (_counter value)
            │
            └── FloatingActionButton Column
                ├── FAB (Clear - ×)
                ├── SizedBox (spacer)
                ├── FAB (Decrement - -)
                ├── SizedBox (spacer)
                └── FAB (Increment - +)
```

### Component Relationships

- **MyApp**: Root widget, single instance
  - Configures MaterialApp
  - Defines theme
  - Sets home page

- **MyHomePage**: Main page widget
  - Defines configuration (title)
  - Creates state object
  - Stateful lifecycle management

- **_MyHomePageState**: State management
  - Holds mutable state (_counter)
  - Implements business logic
  - Handles user events
  - Renders UI

## State Management

### StatefulWidget Pattern

The application uses Flutter's built-in `StatefulWidget` pattern for state management:

```dart
// Configuration (Immutable)
class MyHomePage extends StatefulWidget {
  final String title;  // Configuration
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// State (Mutable)
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;  // Mutable state
  
  void _incrementCounter() {
    setState(() {
      _counter++;  // State mutation
    });
  }
}
```

### Why StatefulWidget?

1. **Simplicity**: No external dependencies needed
2. **Built-in**: Part of Flutter framework
3. **Sufficient**: Adequate for this app's complexity
4. **Performant**: Direct state updates
5. **Local State**: State is local to the widget

### State Lifecycle

```
Widget Created
     ↓
createState() called
     ↓
initState() (implicit)
     ↓
build() called → UI rendered
     ↓
User Interaction
     ↓
setState() called
     ↓
build() called → UI updated
     ↓
dispose() (on widget removal)
```

## Data Flow

### Unidirectional Data Flow

The application follows a unidirectional data flow pattern:

```
User Action
    ↓
Event Handler (_incrementCounter, _decrementCounter, _clearCounter)
    ↓
State Update (via setState)
    ↓
Framework Notified
    ↓
build() Method Called
    ↓
New UI Rendered
    ↓
Display Updated
```

### Example: Increment Flow

```
1. User taps "+" button
   └→ FloatingActionButton.onPressed triggered
   
2. _incrementCounter() executed
   └→ setState() called
       └→ _counter++ performed
   
3. Framework marks widget dirty
   └→ Schedules rebuild
   
4. build() method called
   └→ New widget tree created
       └→ Text widget shows new _counter value
   
5. Flutter renders changes
   └→ UI updates on screen
```

### Example: Clear with Confirmation Flow

```
1. User taps "×" button
   └→ FloatingActionButton.onPressed triggered
   
2. _clearCounter() executed
   └→ showDialog() called
       └→ AlertDialog displayed
   
3. User interaction with dialog
   ├→ "Cancel" pressed
   │  └→ Navigator.pop()
   │      └→ Dialog dismissed
   │          └→ No state change
   │
   └→ "OK" pressed
      └→ setState() called
          └→ _counter = 0
          └→ Navigator.pop()
              └→ Dialog dismissed
              └→ build() called
                  └→ UI updated with _counter = 0
```

## Design Decisions

### 1. Using StatefulWidget Instead of Other State Management

**Decision:** Use StatefulWidget with setState()

**Rationale:**
- ✅ Simple application with local state only
- ✅ No need for state sharing between widgets
- ✅ Reduces external dependencies
- ✅ Easier to understand for beginners
- ✅ Built into Flutter framework

**Alternatives Considered:**
- Provider: Overkill for single-widget state
- Bloc: Too complex for simple counter
- Riverpod: Additional dependency not justified
- GetX: Not needed for this scope

### 2. Preventing Negative Counter Values

**Decision:** Check if counter > 0 before decrementing

**Rationale:**
- ✅ Prevents invalid state (negative counts don't make sense)
- ✅ Simple boundary check
- ✅ Clear user expectation

**Implementation:**
```dart
void _decrementCounter() {
  setState(() {
    if (_counter > 0) {  // Boundary check
      _counter--;
    }
  });
}
```

### 3. Confirmation Dialog for Clear

**Decision:** Show confirmation dialog before clearing

**Rationale:**
- ✅ Prevents accidental data loss
- ✅ Good UX practice for destructive actions
- ✅ Educates users about the action's impact
- ✅ Gives users control and choice

**Dialog Settings:**
- `barrierDismissible: false`: User must make explicit choice
- Two buttons: "Cancel" (safe) and "OK" (destructive)
- Clear messaging in Japanese

### 4. Three Separate Floating Action Buttons

**Decision:** Use three FABs arranged vertically

**Rationale:**
- ✅ Clear visual separation of actions
- ✅ Easy touch targets (follows Material Design guidelines)
- ✅ Intuitive button placement (+/- common pattern)
- ✅ × icon clearly indicates "clear/reset"

**Layout:**
```
×  (Clear - destructive, top)
-  (Decrement - safe, middle)
+  (Increment - safe, bottom)
```

### 5. Hero Tags on Floating Action Buttons

**Decision:** Add unique heroTag to each FAB

**Rationale:**
- ✅ Prevents "duplicate GlobalKey" error with multiple FABs
- ✅ Required when using multiple FABs on same screen
- ✅ Enables proper page transitions

### 6. Material Design 3

**Decision:** Use Material Design 3 with ColorScheme.fromSeed

**Rationale:**
- ✅ Modern design system
- ✅ Automatic color harmonization
- ✅ Accessibility features built-in
- ✅ Cross-platform consistency
- ✅ Dynamic theming support

## Code Organization

### File Structure

```
lib/
└── main.dart          # All application code (single file)
    ├── main()         # Entry point
    ├── MyApp          # Root widget
    ├── MyHomePage     # Page widget
    └── _MyHomePageState  # State management
```

### Why Single File?

**Current Approach:** All code in `main.dart`

**Rationale:**
- ✅ Simple application (< 200 lines)
- ✅ Easy to understand at a glance
- ✅ No need for complex navigation
- ✅ Single feature (counter)
- ✅ Quick prototyping and learning

**When to Split:**
Consider splitting into multiple files when:
- Adding multiple screens/pages
- Implementing complex business logic
- Adding shared widgets
- Introducing models or services
- Growing beyond 500 lines
- Adding feature modules

### Suggested Structure for Growth

```
lib/
├── main.dart           # Entry point & MyApp
├── screens/
│   └── home_page.dart  # MyHomePage & _MyHomePageState
├── widgets/
│   ├── counter_display.dart
│   └── counter_actions.dart
├── models/
│   └── counter_model.dart
└── services/
    └── storage_service.dart
```

## Platform Architecture

### Cross-Platform Support

The application supports six platforms through Flutter's abstraction layer:

```
┌──────────────────────────────────────────────────────┐
│            Flutter Application Code                   │
│                   (main.dart)                         │
└───────────────────┬──────────────────────────────────┘
                    │
                    ▼
┌──────────────────────────────────────────────────────┐
│              Flutter Framework                        │
│     (Widgets, Rendering, Gestures, etc.)            │
└─────┬─────┬─────┬─────┬─────┬─────┬────────────────┘
      │     │     │     │     │     │
      ▼     ▼     ▼     ▼     ▼     ▼
    iOS   Android Web Windows macOS Linux
```

### Platform-Specific Code

**Current Implementation:**
- No platform-specific code needed
- Pure Dart/Flutter implementation
- Material Design works on all platforms

**Platform Directories:**
```
android/     # Android-specific configuration
ios/         # iOS-specific configuration
web/         # Web-specific configuration
windows/     # Windows-specific configuration
macos/       # macOS-specific configuration
linux/       # Linux-specific configuration
```

These directories contain:
- Build configurations
- Platform manifests
- Native dependencies (if any)
- Launch/entry points
- Icons and assets

### Build Outputs

Each platform produces different artifacts:

- **Android**: APK/AAB
- **iOS**: IPA/App
- **Web**: HTML/JS/WASM
- **Windows**: EXE
- **macOS**: APP
- **Linux**: Binary

## Performance Considerations

### Widget Rebuilds

**Current Behavior:**
- Only `_MyHomePageState` widget rebuilds on state change
- Scaffold tree is reconstructed but efficiently diffed
- Const widgets are not rebuilt (e.g., `const Text('...')`)

**Optimizations in Place:**
- `const` constructors used where possible
- Minimal widget tree depth
- No unnecessary setState calls
- Simple state structure (single int)

### Memory Usage

- **State Size**: Single integer (4-8 bytes)
- **Widget Tree**: Shallow, few nodes
- **No Memory Leaks**: No listeners or streams to dispose

## Testing Strategy

### Current Tests

- **Widget Test**: Counter increment test
- **Smoke Test**: Verify basic functionality

### Testing Architecture

```dart
testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  // 1. Setup: Pump widget
  await tester.pumpWidget(const MyApp());
  
  // 2. Verify: Initial state
  expect(find.text('0'), findsOneWidget);
  
  // 3. Act: Tap button
  await tester.tap(find.byIcon(Icons.add));
  await tester.pump();
  
  // 4. Assert: State changed
  expect(find.text('1'), findsOneWidget);
});
```

### Recommended Additional Tests

1. **Decrement Test**: Verify counter decreases
2. **Boundary Test**: Verify counter doesn't go negative
3. **Clear Test**: Verify dialog appears and clears counter
4. **Dialog Cancel Test**: Verify cancel keeps counter value
5. **Integration Test**: Test full user flow

## Future Architecture Considerations

### Scaling Up

If the app grows, consider:

1. **State Management**
   - Provider for shared state
   - Bloc for complex business logic
   - Riverpod for modern state management

2. **Code Organization**
   - Feature-based structure
   - Separate models, views, controllers
   - Shared widget library

3. **Data Persistence**
   - SharedPreferences for simple storage
   - SQLite for structured data
   - Hive for fast local storage

4. **Navigation**
   - Named routes
   - Navigation 2.0 for complex flows
   - Deep linking support

5. **Dependency Injection**
   - get_it for service locator
   - Injectable for code generation

## Conclusion

The current architecture is intentionally simple and appropriate for a learning/demonstration application. It prioritizes:

- **Clarity**: Easy to understand
- **Simplicity**: Minimal complexity
- **Maintainability**: Standard Flutter patterns
- **Performance**: Efficient state updates
- **Extensibility**: Room to grow

The architecture can be evolved incrementally as requirements grow, following Flutter best practices and community standards.

---

## References

- [Flutter Architecture Documentation](https://docs.flutter.dev/resources/architectural-overview)
- [Dart Language Guide](https://dart.dev/guides)
- [Material Design 3](https://m3.material.io/)
- [Flutter State Management](https://docs.flutter.dev/development/data-and-backend/state-mgmt/intro)
