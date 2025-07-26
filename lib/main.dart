import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';
import 'screens/activities_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/booking_screen.dart';
import 'screens/ecommerce_screen.dart';
import 'screens/social_feed_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/activities': (context) => const ActivitiesScreen(),
        '/chat': (context) => const ChatScreen(),
        '/signin': (context) => const SignInScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/booking': (context) => const BookingScreen(),
        '/ecommerce': (context) => const EcommerceScreen(),
        '/social_feed': (context) => const SocialFeedScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _showClearDialog() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: _buildDrawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 40),
            const Text(
              '8つの画面にアクセスするには、左上のメニューボタンをタップしてください',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/dashboard'),
                  child: const Text('Dashboard'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/ecommerce'),
                  child: const Text('Ecommerce'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/checkout'),
                  child: const Text('Checkout'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/booking'),
                  child: const Text('Booking'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _showClearDialog,
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

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Text(
              'Figma Screens',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home (Counter)'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/dashboard');
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_activity),
            title: const Text('Activities'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/activities');
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Chat'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/chat');
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Sign In'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/signin');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Checkout'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/checkout');
            },
          ),
          ListTile(
            leading: const Icon(Icons.book_online),
            title: const Text('Booking'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/booking');
            },
          ),
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('Ecommerce'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/ecommerce');
            },
          ),
          ListTile(
            leading: const Icon(Icons.feed),
            title: const Text('Social Feed'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/social_feed');
            },
          ),
        ],
      ),
    );
  }
}
