import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageValue extends ChangeNotifier {
  int page = 0;

  void changePageValue1() {
    page = 1;
    notifyListeners();
  }

  void changePageValue2() {
    page = 2;
    notifyListeners();
  }
}

final pageProvider = ChangeNotifierProvider.autoDispose<PageValue>((ref) {
  return PageValue();
});

class ChangeNotiProvider2 extends StatelessWidget {
  const ChangeNotiProvider2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: ((context, ref, child) {
          final data = ref.watch(pageProvider);
          final changeData = ref.read(pageProvider.notifier);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [            
                data.page==1? const WidgetA(): const WidgetB(),       
              ElevatedButton(
                  onPressed: () {
                   
                    switch (data.page) {
                      case 1:
                        return changeData.changePageValue2();
                      case 2:
                        return changeData.changePageValue1();
                      default:
                        return changeData.changePageValue2();
                    }
                  },
                  child: const Text('Change Page'))
            ],
          );
        })),
      ),
    );
  }
}
class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: 200, height: 200,
                  color: Colors.red);
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: 200, height: 200,
                  color: Colors.yellow);
  }
}
