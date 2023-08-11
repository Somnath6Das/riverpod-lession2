import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final showDialogProvider = StateNotifierProvider((ref) => DialogManager(false));

class DialogManager extends StateNotifier<bool> {
  DialogManager(super.state);

  void showLoadingDialog(BuildContext context) {
    state = true;
    AlertDialog loadingDialog = AlertDialog(
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 350, vertical: 30),
        child: const CircularProgressIndicator(),
      ),
    );
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return loadingDialog;
        });
  }
}

class TouchDialog extends StatelessWidget {
  const TouchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer(
        builder: (context, ref, child) {
          return Scaffold(
            backgroundColor: Colors.indigoAccent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(showDialogProvider.notifier)
                          .showLoadingDialog(context); // Reset state
                    },
                    child: const Text('Show Dialog'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
