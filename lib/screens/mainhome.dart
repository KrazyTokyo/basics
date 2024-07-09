import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    final staticEmail = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the app!\n$staticEmail',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Image(image: AssetImage('assets/images/end1.jpg')),
            )
          ],
        )),
      ),
    );
  }
}
