import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Flutter Refactoring Tutorial',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 16),
            CustomButton(
              platform: 'Twitter',
              onPressed: () {
                // Open Twitter App
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              platform: 'Instagram',
              onPressed: () {
                // Open Instagram App
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String platform;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key, required this.platform, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Press the below button to follow me on $platform"),
      ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Pressed Follow on $platform button"),
              duration: const Duration(seconds: 1),
            ),
          );
          onPressed();
        },
        child: Text("Follow on $platform"),
      )
    ]));
  }
}
