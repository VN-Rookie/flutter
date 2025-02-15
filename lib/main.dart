import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _text = '';

  final String title;

  final Logger _logger = Logger();

  _MyHomePageState(this.title);

  void _incrementCounter() {
    //log state here with lib
    _logger.i('Counter incremented: $_counter');

    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _changeText(String text) {
    setState(() {
      _text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times: 111',
            ),
            Text(
              '$_counter',
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment'),
            ),
            SizedBox(height: 20),
            Text(
              'Button pressed $_counter times',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              _text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            ElevatedButton(
                onPressed: () {
                  _changeText("Button pressed $_counter times");
                },
                child: Text("Press me")),
            ElevatedButton(
              onPressed: _decrementCounter,
              child: const Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
