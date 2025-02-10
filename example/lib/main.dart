import 'package:flutter/material.dart';

import 'package:ultimate_extension/ultimate_extension.dart';
import 'package:ultimate_extension/widgets/size_provider_widget.dart';

void main() async {
  runApp(MaterialApp(home: ExamplePage()));
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              return InkWell(
                onTap: () {
                  String date = "1998-04-29"
                      .formatAsUiDate(uiFormat: "29 Dec 1999"); // 29 Apr 1998

                  print(date); //
                  setState(() {});
                },
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  width: 100,
                  height: 100,
                ).shimmer(isLoading: true),
              );
            }),
            SizedBox(
              height: 10,
              width: double.infinity,
            ),
            TypeWriterText(
                text: "Hello World",
                typingSpeed: Duration(milliseconds: 200),
                useSingleWord: false,
                onAnimationFinished: () {
                  print("Animation Finished");
                }),
            Expanded(child: SizeProviderWidget(builder: (context, size) {
              return Container(
                child: Text("${size.width} x ${size.height}"),
              );
            }))
          ],
        ));
  }
}
