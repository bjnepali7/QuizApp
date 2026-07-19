import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Screens/home_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({required this.score, super.key});
  final int score;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late double percentage = (widget.score / 20) * 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            left: 28,
            right: 28,
            top: 64,
            bottom: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              Center(
                child: SizedBox(
                  height: 318,
                  width: 318,
                  child: Stack(
                    children: [
                      Image.asset("assets/score_frame.png", height: 318),
                      Center(
                        child: Text(
                          "$percentage%",
                          style: GoogleFonts.archivo(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Result card
              Container(
                margin: EdgeInsets.only(
                  left: 33,
                  right: 33,
                  bottom: 35,
                  top: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Your score",
                      style: GoogleFonts.archivo(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${widget.score}/20",
                      style: GoogleFonts.archivo(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: Color(0xff2200A6),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Congratulations!",
                      style: GoogleFonts.archivo(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: Color(0xff2200A6),
                      ),
                    ),

                    Text(
                      "Great job Bijay! You have done well",
                      style: GoogleFonts.archivo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 24),

                    PointDisplayContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            child: Center(
                              child: Icon(
                                Icons.diamond,
                                color: Color(0xffF269BD),
                              ),
                            ),
                          ),
                          Text(
                            "${widget.score * 10} Points",
                            style: GoogleFonts.archivo(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              BottomButton(
                label: "Back to Home",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (ctx) => HomeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({this.onPressed, required this.label, super.key});
  void Function()? onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, 40),
        backgroundColor: Color(0xff2200A6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        label,
        style: GoogleFonts.archivo(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}

class PointDisplayContainer extends StatelessWidget {
  const PointDisplayContainer({this.child, super.key});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      height: 40,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xffF3F4F6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 4),
            blurRadius: 7,
          ),
        ],
      ),
      child: child,
    );
  }
}
