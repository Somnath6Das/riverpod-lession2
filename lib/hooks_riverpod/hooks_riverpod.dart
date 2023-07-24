import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// <i>   flutter hooks can maintain state within a single Hookwidget widget.
// <ii>  consumerWidgets + StateProvider can maintain state a whole app.

// <iii> HookConsumerWidget can maintain Hookwidget + ConsumerWidget at the same time.

final counterState = StateProvider<int>((ref) => 0);

class HooksRiverpod extends HookConsumerWidget {
  const HooksRiverpod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count1 = useState(0);
    final count = ref.watch(counterState);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod counter example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${count1.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              count1.value++;
            },
            child: const Icon(Icons.plus_one),
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterState.notifier).state++;
            },
            child: const Icon(Icons.plus_one),
          ),
        ],
      ),
    );
  }
}
