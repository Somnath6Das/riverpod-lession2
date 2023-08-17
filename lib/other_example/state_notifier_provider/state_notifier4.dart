import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fruitsProvider =
    StateNotifierProvider<FruitsNotifier, List<String>>((ref) {
  return FruitsNotifier();
});


class FruitsNotifier extends StateNotifier<List<String>> {
  FruitsNotifier() : super(['Apple', 'Banana']); // Initializing List.

  void add(String name) {
    state = [...state, name];
  }

  void remove(String name) {
    state = [...state.where((element) => element != name)];
  }

  void update(String name, String updatedName) {
    final updatedList = <String>[];
    for (var i = 0; i < state.length; i++) {
      if (state[i] == name) {
        updatedList.add(updatedName);
      } else {
        updatedList.add(state[i]);
      }
    }
    state = updatedList;
  }
}

class StateNotifier4 extends ConsumerWidget {
  const StateNotifier4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fruits = ref.watch(fruitsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(fruitsProvider.notifier)
              .add('Fruit ${Random().nextInt(100)}');
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: fruits
              .map(
                (e) => GestureDetector(
                  onLongPress: () {
                    ref
                        .read(fruitsProvider.notifier)
                        .update(e, '$e updated');
                  },
                  onTap: () {
                    ref.read(fruitsProvider.notifier).remove(e);
                  },
                  child: Text(e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}