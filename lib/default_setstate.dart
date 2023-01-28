import 'package:flutter/material.dart';

class DefaultSetState extends StatefulWidget {
  const DefaultSetState({super.key, }); 
  
  @override
  State<DefaultSetState> createState() => _DefaultSetStateState();
}

class _DefaultSetStateState extends State<DefaultSetState> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Flutter Default App', style: TextStyle(color: Theme.of(context).colorScheme.primary),),
      ),
      body: Center(     
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}

