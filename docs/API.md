# API Documentation

This document provides detailed information about the classes, methods, and APIs in the Flutter Counter App.

## Table of Contents

- [Core Classes](#core-classes)
  - [MyApp](#myapp)
  - [MyHomePage](#myhomepage)
  - [_MyHomePageState](#_myhomepagestate)
- [Methods](#methods)
- [State Management](#state-management)
- [UI Components](#ui-components)

## Core Classes

### MyApp

**Type:** `StatelessWidget`

The root widget of the application that configures the MaterialApp.

#### Constructor

```dart
const MyApp({super.key})
```

Creates the root MyApp widget.

#### Methods

##### build

```dart
Widget build(BuildContext context)
```

Builds the MaterialApp widget tree with the following configuration:
- **Title:** 'Flutter Demo'
- **Theme:** Material Design 3 with deep purple color scheme
- **Home:** MyHomePage widget

**Returns:** `MaterialApp` configured with theme and home page

---

### MyHomePage

**Type:** `StatefulWidget`

The home page widget that displays the counter interface.

#### Properties

##### title

```dart
final String title
```

The title displayed in the app bar. This is a required parameter passed from the parent widget.

**Type:** `String`  
**Mutability:** Immutable (final)

#### Constructor

```dart
const MyHomePage({super.key, required this.title})
```

Creates a MyHomePage widget.

**Parameters:**
- `title` (String, required): The title to display in the app bar

#### Methods

##### createState

```dart
State<MyHomePage> createState()
```

Creates the mutable state for this widget at a given location in the tree.

**Returns:** `_MyHomePageState` - The state object for this widget

---

### _MyHomePageState

**Type:** `State<MyHomePage>`

State class that manages the counter value and handles user interactions.

#### Properties

##### _counter

```dart
int _counter = 0
```

The current counter value. This value:
- Starts at 0
- Is incremented by `_incrementCounter()`
- Is decremented by `_decrementCounter()` (cannot go below 0)
- Is reset to 0 by `_clearCounter()`

**Type:** `int`  
**Mutability:** Mutable  
**Initial Value:** 0  
**Constraints:** Cannot be negative

#### Methods

##### _incrementCounter

```dart
void _incrementCounter()
```

Increments the counter by 1.

**Behavior:**
- Increases `_counter` by 1
- Calls `setState()` to trigger UI update
- No upper limit

**Side Effects:**
- Triggers widget rebuild
- Updates counter display

##### _decrementCounter

```dart
void _decrementCounter()
```

Decrements the counter by 1, preventing negative values.

**Behavior:**
- Checks if `_counter > 0`
- If true, decreases `_counter` by 1
- If false, no action taken
- Calls `setState()` to trigger UI update

**Side Effects:**
- Triggers widget rebuild if counter > 0
- Updates counter display

##### _clearCounter

```dart
void _clearCounter()
```

Displays a confirmation dialog and resets the counter to 0 if confirmed.

**Dialog Properties:**
- **Title:** "確認" (Confirmation)
- **Message:** "本当にカウントをクリアしますか？" (Are you sure you want to clear the count?)
- **Buttons:** "Cancel", "OK"
- **Barrier Dismissible:** false

**Behavior:**
- Shows modal dialog
- If "OK" pressed:
  - Sets `_counter = 0`
  - Calls `setState()` to update UI
  - Closes dialog
- If "Cancel" pressed:
  - Closes dialog without changes

**Side Effects:**
- Opens modal dialog
- May trigger widget rebuild
- May update counter display

##### build

```dart
Widget build(BuildContext context)
```

Builds the UI for the home page.

**Returns:** `Scaffold` widget containing:
- **AppBar:** With title and inverse primary color
- **Body:** Centered column with:
  - Text label
  - Counter value display
- **FloatingActionButton:** Three buttons arranged vertically:
  - Clear button (×, top)
  - Decrement button (-, middle)
  - Increment button (+, bottom)

**Parameters:**
- `context` (BuildContext): The build context

**Called When:**
- Widget is first inserted into tree
- `setState()` is called
- Parent widget rebuilds
- Dependencies change

---

## Methods

### Global Methods

#### main

```dart
void main()
```

Entry point of the Flutter application.

**Behavior:**
- Initializes the Flutter engine
- Runs the `MyApp` widget as the root of the widget tree

---

## State Management

This application uses Flutter's built-in state management with `StatefulWidget` and `setState()`.

### State Flow

```
User Action → Method Call → setState() → Widget Rebuild → UI Update
```

### Example: Increment Flow

1. User taps increment button
2. `_incrementCounter()` is called
3. `_counter++` increases the value
4. `setState()` notifies framework of state change
5. `build()` method is called
6. UI re-renders with new counter value

### State Persistence

**Note:** The current implementation does not persist state. Counter resets to 0 when:
- App is closed
- Hot restart is performed
- Page navigation occurs

---

## UI Components

### Layout Structure

```
Scaffold
├── AppBar
│   └── Text (title)
├── Body
│   └── Center
│       └── Column
│           ├── Text (label)
│           └── Text (counter value)
└── FloatingActionButton Column
    ├── FAB (Clear)
    ├── SizedBox (spacing)
    ├── FAB (Decrement)
    ├── SizedBox (spacing)
    └── FAB (Increment)
```

### Widgets Used

- **Scaffold:** Main page structure
- **AppBar:** Top navigation bar
- **Column:** Vertical layout
- **Center:** Center alignment
- **Text:** Text display
- **FloatingActionButton:** Action buttons
- **SizedBox:** Spacing
- **Icon:** Button icons
- **AlertDialog:** Confirmation dialog
- **TextButton:** Dialog buttons

### Styling

- **Theme:** Material Design 3
- **Color Scheme:** Generated from deep purple seed color
- **Typography:** Default Material typography
- **Icons:** Material Icons

---

## Examples

### Creating the App

```dart
void main() {
  runApp(const MyApp());
}
```

### Incrementing the Counter

```dart
// User taps the + button
onPressed: _incrementCounter

// Internal implementation
void _incrementCounter() {
  setState(() {
    _counter++;  // Increases counter
  });
}
```

### Decrementing with Boundary Check

```dart
// User taps the - button
onPressed: _decrementCounter

// Internal implementation
void _decrementCounter() {
  setState(() {
    if (_counter > 0) {  // Prevents negative values
      _counter--;
    }
  });
}
```

### Clearing with Confirmation

```dart
// User taps the × button
onPressed: _clearCounter

// Shows dialog first
void _clearCounter() {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('確認'),
        content: const Text('本当にカウントをクリアしますか？'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              setState(() => _counter = 0);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
```

---

## Platform Support

This API works identically across all supported platforms:
- iOS
- Android
- Web
- Windows
- macOS
- Linux

---

## See Also

- [Architecture Documentation](ARCHITECTURE.md)
- [Main README](../README.md)
- [Contributing Guidelines](../CONTRIBUTING.md)
