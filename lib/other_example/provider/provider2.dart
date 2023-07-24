import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numProvider = Provider<int>((ref) {
  return 100;
});


class Provider2 extends StatelessWidget {
  const Provider2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Provider2',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Consumer(builder: (context, ref, child) {
        final number = ref.watch(numProvider);
        final number1 = ref.read(numProvider);
        return Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(number.toString()),
            Text(number1.toString()),
          ],
        ));
      }),
    );
  }
}
