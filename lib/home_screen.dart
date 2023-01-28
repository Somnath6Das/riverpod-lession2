import 'package:flutter/material.dart';
import 'package:riverpod_lesson2/default_setstate.dart';
import 'package:riverpod_lesson2/provider/provider1.dart';
import 'package:riverpod_lesson2/provider/provider2.dart';
import 'package:riverpod_lesson2/state_provider/state_provider1.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DefaultSetState()),
                );
              },
              child: const Text('Default SetState', style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Provider1()),
                );
              },
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text('Provider1'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 2,
                  backgroundColor: Theme.of(context).colorScheme.primary),
              onPressed: () {  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Provider2()),
                );},
              child: const Text('Provider2'),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: const StadiumBorder(),
                side: BorderSide(
                    width: 2, color: Theme.of(context).colorScheme.primary),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StateProvider1()),
                );
              },
              child: const Text('StateProvider3'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () => () {},
              icon: Image.asset(
                'images/user.png',
                width: 20,
              ),
              label: const Text(
                'Continue with Google',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                minimumSize: const Size(60, 35),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
