import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class User extends ChangeNotifier {
  String userName = 'Som';

  void changeUserName() {
    userName = 'Babu';
    notifyListeners();
  }

  void changeUserDesignation() {
    userName = 'Programmer';
    notifyListeners();
  }
}

final userProvider = ChangeNotifierProvider.autoDispose<User>((ref) {
  return User();
});

class ChangeNotiProvider extends StatelessWidget {
  const ChangeNotiProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: ((context, ref, child) {
          final data = ref.watch(userProvider);
          final changeData = ref.read(userProvider.notifier);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.userName,
                style: const TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (data.userName == 'Som') {
                      changeData.changeUserName();
                    } else if (data.userName == 'Babu') {
                      changeData.changeUserDesignation();
                    }
                    else if (data.userName == 'Programmer') {
                      ref.invalidate(userProvider);
                  }},
                  child: const Text('Change Name'))
            ],
          );
        })),
      ),
    );
  }
}
