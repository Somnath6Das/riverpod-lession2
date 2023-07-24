import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson2/home_main.dart';
import 'package:riverpod_lesson2/other_example/state_notifier_provider/state_notifier_share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // this is for  =>   state_notifier_share_pref.dart
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    // this is for  =>   state_notifier_share_pref.dart
     overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeMain(),
    );
  }
}
