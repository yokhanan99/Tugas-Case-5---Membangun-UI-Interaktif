import 'package:flutter/material.dart';
import 'screens/home_events_screen.dart';

void main() {
  runApp(const NusaEventHubApp());
}

class NusaEventHubApp extends StatelessWidget {
  const NusaEventHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NusaEvent Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF1565C0),
        brightness: Brightness.light,
      ),
      home: const HomeEventsScreen(),
    );
  }
}
