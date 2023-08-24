import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final switchValueProvider = StateProvider<int>((ref) => 0);

class StateProvider2 extends ConsumerWidget {
  const StateProvider2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switchValue = ref.watch(switchValueProvider);
    final changeValue = ref.read(switchValueProvider.notifier);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: switchValue == 1 ? const WidgetA() : const WidgetB()),
              ElevatedButton(
                  onPressed: () {
                    switch (switchValue) {
                      case 0:
                        changeValue.state = 1;
                        break;
                      default:
                        changeValue.state = 0;
                        break;
                    }
                  },
                  child: const Text('Switch Widget'))
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 200, height: 200, color: Colors.red);
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 200, height: 200, color: Colors.yellow);
  }
}
