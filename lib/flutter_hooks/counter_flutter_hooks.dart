import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


// flutter hooks can maintain state within a single Hookwidget widget.
class CounterFlutterHooks extends HookWidget {
  const CounterFlutterHooks({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'flutter hooks can maintain\nstate within a single Hookwidget widget:\n${counter.value}',
              style: const TextStyle(fontSize: 20, ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
