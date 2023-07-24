import 'package:flutter/material.dart';
import 'package:riverpod_lesson2/flutter_hooks/counter_flutter_hooks.dart';
import 'package:riverpod_lesson2/hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_lesson2/other_example/home_screen.dart';
import 'package:riverpod_lesson2/one_state_whole_app/front_page.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 2,
                  backgroundColor: Theme.of(context).colorScheme.primary),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FrontPage()),
                );
              },
              child: const Text('<i> ConsumerWidget: One state whole app\n (StateProvider)'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 2,
                  backgroundColor: Theme.of(context).colorScheme.primary),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CounterFlutterHooks()),
                );
              },
              child: const Text('<ii> HookWidget: One state for one widget'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 2,
                  backgroundColor: Theme.of(context).colorScheme.primary),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HooksRiverpod()),
                );
              },
              child: const Text('<iii> HookConsumerWidget:\nConsumerWidget + HookWidget'),
            ),
             ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 2,
                  backgroundColor: Theme.of(context).colorScheme.primary),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('<iv> Riverpod other examples.'),
            ),
          ],
        ),
      ),
    );
  }
}
