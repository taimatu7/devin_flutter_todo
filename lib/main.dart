/// Flutter Counter Application
///
/// A cross-platform counter app built with Flutter that demonstrates
/// state management using StatefulWidget and setState.
///
/// Features:
/// - Increment counter
/// - Decrement counter (prevents negative values)
/// - Clear counter with confirmation dialog
/// - Material Design UI
library;

import 'package:flutter/material.dart';

/// Entry point of the Flutter application.
///
/// Initializes and runs the [MyApp] widget as the root of the widget tree.
void main() {
  runApp(const MyApp());
}

/// Root widget of the application.
///
/// This stateless widget configures the MaterialApp with theme settings
/// and sets [MyHomePage] as the home page. It defines the overall
/// appearance and behavior of the application.
class MyApp extends StatelessWidget {
  /// Creates the root [MyApp] widget.
  const MyApp({super.key});

  /// Builds the MaterialApp widget tree.
  ///
  /// Configures the app's theme using Material Design 3 with a deep purple
  /// color scheme and sets the home page to [MyHomePage].
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// Home page widget that displays the counter interface.
///
/// This is a stateful widget that manages the counter state and provides
/// three action buttons: increment, decrement, and clear. The counter
/// state is maintained by [_MyHomePageState].
class MyHomePage extends StatefulWidget {
  /// Creates a [MyHomePage] widget.
  ///
  /// The [title] parameter is required and will be displayed in the app bar.
  const MyHomePage({super.key, required this.title});

  /// The title to display in the app bar.
  ///
  /// This value is passed from the parent widget and cannot be changed
  /// during the lifetime of this widget.
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// State class for [MyHomePage] that manages the counter value.
///
/// This class maintains the counter value and provides methods to
/// increment, decrement, and clear the counter. All state changes
/// are handled through [setState] to trigger UI updates.
class _MyHomePageState extends State<MyHomePage> {
  /// The current counter value.
  ///
  /// This value is incremented by [_incrementCounter], decremented by
  /// [_decrementCounter], and reset to zero by [_clearCounter].
  /// It cannot be negative.
  int _counter = 0;

  /// Increments the counter by 1.
  ///
  /// Calls [setState] to notify the framework that the counter has changed,
  /// which triggers a rebuild of the widget tree to display the new value.
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  /// Decrements the counter by 1.
  ///
  /// Only decrements if the counter is greater than 0, preventing negative
  /// values. Calls [setState] to update the UI with the new value.
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  /// Clears the counter after showing a confirmation dialog.
  ///
  /// Displays an alert dialog asking the user to confirm the clear operation.
  /// If the user presses "OK", the counter is reset to 0. If "Cancel" is
  /// pressed, the dialog is dismissed without changing the counter.
  ///
  /// The dialog text is in Japanese and includes:
  /// - Title: "確認" (Confirmation)
  /// - Message: "本当にカウントをクリアしますか？" (Are you sure you want to clear the count?)
  void _clearCounter() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('確認'),
          content: const Text('本当にカウントをクリアしますか？'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                setState(() {
                  _counter = 0;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// Builds the UI for the home page.
  ///
  /// Creates a [Scaffold] with an app bar, centered counter display, and
  /// three floating action buttons arranged vertically for clear, decrement,
  /// and increment operations.
  ///
  /// This method is called whenever [setState] is invoked, ensuring the UI
  /// reflects the current counter value.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _clearCounter,
            tooltip: 'Clear',
            heroTag: "clear",
            child: const Icon(Icons.clear),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            heroTag: "decrement",
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            heroTag: "increment",
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
