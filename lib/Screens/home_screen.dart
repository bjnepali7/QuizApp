import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Controller/options_model.dart';
import 'package:quiz_app/Screens/result_screen.dart';

import '../Widgets/answer_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 0;

  int cureenttime = 0;
  int finaltime = 30;
  Timer? _timer;
  int currentquestion = 1;
  int currentoption = 1;
  int score = 0;

  startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentquestion > allQuestions.length) {
        _timer?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ResultScreen(score: score)),
        );
        return;
      } else {
        if (cureenttime < finaltime) {
          cureenttime++;
        } else {
          cureenttime = 0;
          if (currentquestion >= allQuestions.length) {
            _timer?.cancel();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(score: score),
              ),
            );
            return;
          }
          currentquestion++;
        }
        setState(() {});
      }
    });
  }

  changeQuestion() async {
    cureenttime = 0;

    if (currentquestion < allQuestions.length) {
      startTimer();
      currentquestion++;
    } else {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(score: score)),
      );

      currentquestion = 1;
      cureenttime = 0;
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // button navigation button
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          i = val;
          setState(() {});
        },
        backgroundColor: Colors.white,
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        currentIndex: i,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled, size: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart, size: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, size: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 30),
            label: "",
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 32, right: 32, top: 44, bottom: 102),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Quiz App",
                style: GoogleFonts.archivo(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30),

              // the time and soccer
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Question",
                      style: GoogleFonts.archivo(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        style: GoogleFonts.archivo(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: currentquestion.toString(),
                            style: TextStyle(color: Color(0xffDA43C5)),
                          ),
                          TextSpan(text: "/${allQuestions.length}"),
                        ],
                      ),
                    ),
                  ],
                ),
                trailing: SizedBox(
                  height: 60,
                  width: 60,
                  child: Stack(
                    children: [
                      CircularProgressIndicator(
                        value: cureenttime / finaltime,
                        constraints: BoxConstraints.tightFor(
                          height: 60,
                          width: 60,
                        ),
                        backgroundColor: Color(0xffE2DFEF),
                        color: Color(0xff1A00A3),
                      ),
                      Center(
                        child: Text(
                          cureenttime.toString(),
                          style: GoogleFonts.archivo(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              //linear progress indicator
              ClipRRect(
                borderRadius: BorderRadius.circular(8),

                child: LinearProgressIndicator(
                  value: currentquestion / allQuestions.length,
                  borderRadius: BorderRadius.circular(8),
                  minHeight: 5,
                ),
              ),

              SizedBox(height: 20),

              //question section
              Container(
                height: 90,
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xffECB9EC), width: 1),
                  color: Color(0xffFCDEF9),
                ),
                child: Center(
                  child: Text(
                    allQuestions[currentquestion - 1].question,
                    style: GoogleFonts.archivo(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              //Answecard
              // Expanded(
              //   child: ListView.separated(
              //     separatorBuilder: (_, index) => SizedBox(height: 12),
              //     itemCount: allQuestions[0].options.length,
              //     itemBuilder: (ctx, index) {
              //       return AnswerCard(
              //         label: options[index].label,
              //         color: options[index].color,
              //         child: Text(options[index].options),
              //       );
              //     },
              //   ),
              // ),
              AnswerCard(
                label: "a",
                backgroundcolor: Color(0xffF6F6F6),
                onTap: () {
                  String selOption =
                      allQuestions[currentquestion - 1].options[0];
                  String answer =
                      allQuestions[currentquestion - 1].correctAnswer;
                  if (selOption == answer) {
                    score++;
                  } else {
                    changeQuestion();
                  }
                },
                answer: allQuestions[currentquestion - 1].options[0],
              ),
              SizedBox(height: 12),
              AnswerCard(
                label: "b",
                backgroundcolor: Color(0xffF6F6F6),
                onTap: () {
                  String selOption =
                      allQuestions[currentquestion - 1].options[1];
                  String answer =
                      allQuestions[currentquestion - 1].correctAnswer;
                  if (selOption == answer) {
                    score++;
                  } else {
                    changeQuestion();
                  }
                },

                answer: allQuestions[currentquestion - 1].options[1],
              ),
              SizedBox(height: 12),
              AnswerCard(
                label: "c",
                backgroundcolor: Color(0xffF6F6F6),
                onTap: () {
                  String selOption =
                      allQuestions[currentquestion - 1].options[2];
                  String answer =
                      allQuestions[currentquestion - 1].correctAnswer;
                  if (selOption == answer) {
                    score++;
                  } else {
                    changeQuestion();
                  }
                },
                answer: allQuestions[currentquestion - 1].options[2],
              ),
              SizedBox(height: 12),
              AnswerCard(
                label: "d",
                backgroundcolor: Color(0xffF6F6F6),
                onTap: () {
                  String selOption =
                      allQuestions[currentquestion - 1].options[3];
                  String answer =
                      allQuestions[currentquestion - 1].correctAnswer;
                  if (selOption == answer) {
                    score++;
                  } else {
                    changeQuestion();
                  }
                },
                answer: allQuestions[currentquestion - 1].options[3],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
