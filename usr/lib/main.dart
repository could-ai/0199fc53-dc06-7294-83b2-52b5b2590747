import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interactive Webpage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const InteractivePage(),
    );
  }
}

class InteractivePage extends StatefulWidget {
  const InteractivePage({super.key});

  @override
  State<InteractivePage> createState() => _InteractivePageState();
}

class _InteractivePageState extends State<InteractivePage> {
  Color _backgroundColor = Colors.lightBlue;
  String _message = "Click me!";
  final Random _random = Random();

  final List<String> _messages = [
    "Hello!",
    "You clicked me!",
    "Keep clicking!",
    "This is fun!",
    "Flutter is awesome!",
    "Welcome to my interactive page!"
  ];

  void _changeContent() {
    setState(() {
      // Generate a random color
      _backgroundColor = Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );

      // Get a random message
      _message = _messages[_random.nextInt(_messages.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Webpage'),
      ),
      body: GestureDetector(
        onTap: _changeContent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: _backgroundColor,
          child: Center(
            child: Text(
              _message,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
