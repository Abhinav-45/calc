import 'package:calc/buttons.dart';
import 'package:calc/screens/history.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var question = '';
  var answer = '';
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initializePrefs();
  }

  void _initializePrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a1111),
      appBar: AppBar(
        backgroundColor: Color(0xff1a1111),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HistScreen(prefs: _prefs),
                ),
              );
            },
            icon: Icon(
              Icons.history,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                // height: screenHeight * 0.3,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        question.toString(),
                        style:
                            TextStyle(fontSize: 35, color: Color(0xfff1dedd)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      CirclButton(
                        value: 'AC',
                        color: Color(0xff594319),
                        press: () {
                          question = '';
                          answer = '';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '(  )',
                        color: Color(0xff5d3f3d),
                        press: () {
                          if (question.contains('(')) {
                            question += ')';
                          } else {
                            question += '(';
                          }
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '%',
                        color: Color(0xff5d3f3d),
                        press: () {
                          question += '%';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '÷',
                        color: Color(0xff5d3f3d),
                        press: () {
                          question += '÷';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CirclButton(
                        value: '7',
                        press: () {
                          question += '7';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '8',
                        press: () {
                          question += '8';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '9',
                        press: () {
                          question += '9';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '×',
                        color: Color(0xff5d3f3d),
                        press: () {
                          question += '×';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CirclButton(
                        value: '4',
                        press: () {
                          question += '4';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '5',
                        press: () {
                          question += '5';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '6',
                        press: () {
                          question += '6';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '-',
                        color: Color(0xff5d3f3d),
                        press: () {
                          question += '-';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CirclButton(
                        value: '1',
                        press: () {
                          question += '1';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '2',
                        press: () {
                          question += '2';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '3',
                        press: () {
                          question += '3';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '+',
                        press: () {
                          question += '+';
                          setState(() {});
                        },
                        color: Color(0xff5d3f3d),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CirclButton(
                        value: '0',
                        press: () {
                          question += '0';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '.',
                        press: () {
                          question += '.';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '⌫',
                        press: () {
                          if (question.length != 0)
                            question =
                                question.substring(0, question.length - 1);
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '=',
                        color: Color(0xff733331),
                        press: () async {
                          equalsto();

                          setState(() {});
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void equalsto() async {
    String modifiedQues = question.replaceAll('×', '*');
    String modQues = modifiedQues.replaceAll('÷', '/');

    Parser p = Parser();
    Expression exp = p.parse(modQues);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();

    String timeKey = DateTime.now().millisecondsSinceEpoch.toString();
    String calculation = '$question \n= $answer';
    await _prefs.setString(timeKey, calculation);
  }
}
