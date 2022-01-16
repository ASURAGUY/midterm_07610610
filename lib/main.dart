import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm_07610610/cal_pigweight.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _controller = TextEditingController();
  var pig = Pig();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PIG WEIGHT CALCULATOR'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('PIG WEIGHT',
                          style: TextStyle(
                              fontSize: 36.0, color: Colors.purple.shade200)),
                      Text(
                        'CALCULATOR',
                        style: TextStyle(
                            fontSize: 36.0, color: Colors.purple.shade200)),

                      Image.asset('assets/images/pig.png', width: 250.0),

                    ],
                  ),
                ],
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(1),
                        //border: OutlineInputBorder(),
                        hintText: 'Length',
                      ),
                    )
                ),

                Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(1),
                        //border: OutlineInputBorder(),
                        hintText: 'Girth',
                      ),
                    )
                ),
              ],
            ),

            ElevatedButton(
                child: Text('CALCULATE'),
                onPressed: () {

                  var inputLength = _controller.text;
                  var inputGirth = _controller.text;
                  var length = double.tryParse(inputLength!);
                  var girth = double.tryParse(inputGirth!);

                  if (length == null || girth == null) {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('ERROR'),
                              content: Text('Invalid input'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                )
                              ]);
                        }
                    );
                  }else {
                    var result = pig.Calculate(length, girth);
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('RESULT'),
                              content: Text('Weight ${pig.highWeight.round()} - ${pig.lowWeight.round()} Kg \nPrice ${pig.highPrice.round()} - ${pig.lowPrice.round()} Baht'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                )
                              ]);
                        }
                    );
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
