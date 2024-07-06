import 'package:calc/buttons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var question = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff1a1111),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: screenHeight * 0.3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Text(
                            question.toString(),
                            style: TextStyle(
                                fontSize: 50, color: Color(0xfff1dedd)),
                          ),
                          Text(
                            answer.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      CirclButton(
                        value: 'AC',
                        color: Color(0xff594319),
                        press: () {
                          question = '';
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '+/-',
                        color: Color(0xff5d3f3d),
                        press: () {
                          question += '+/-';
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
                        value: 'DEL',
                        press: () {
                          question = question.substring(0, question.length - 1);
                          setState(() {});
                        },
                      ),
                      CirclButton(
                        value: '=',
                        color: Color(0xff733331),
                        press: () {
                          question += '';
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
}
