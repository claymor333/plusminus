import 'package:flutter/material.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _value = 0;
  bool _overflow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "+-",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "$_value",
              style: TextStyle(fontSize: 48),
            ),
            _overflow ? Text("number cannot be less than 0!", style: TextStyle(color: Colors.red),) : SizedBox(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red),
                onPressed: () {
                  setState(() {
                    _value++;
                    _overflow = false;
                  });
                },
                child: const Text("increment")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red),
                onPressed: () {
                  setState(() {
                    if (_value > 0) {
                      _overflow = false;
                      _value--;
                    } else {
                      _overflow = true;
                    }
                  });
                },
                child: const Text("decrement")),
          ],
        ),
      ),
    );
  }
}
