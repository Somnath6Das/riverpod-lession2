import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) {
  return "Hello World";
});

class Provider1 extends ConsumerWidget {
  const Provider1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Provider1', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
      ),
      body: Center(
        child: Text(
          name,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 24),
        ),
      ),
    );
  }
}
