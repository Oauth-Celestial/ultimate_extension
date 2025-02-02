import 'package:flutter/material.dart';

import 'package:ultimate_extension/ultimate_extension.dart';

void main() async {
  runApp(MaterialApp(home: ExamplePage()));
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Shimmer Example')),
        body: Column(
          children: [
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            Builder(builder: (context) {
              return Container(
                decoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                width: 100,
                height: 100,
              ).shimmer(isLoading: true);
            })
          ],
        ));
  }
}
