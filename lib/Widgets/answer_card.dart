import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerCard extends StatelessWidget {
  AnswerCard({
    required this.answer,
    this.backgroundcolor,
    required this.label,
    this.circolor,
    this.onTap,
    super.key,
  });
  final Color? backgroundcolor;
  final Color? circolor;
  final String label;
  final String answer;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),

          color: backgroundcolor,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 12,
          children: [
            CircleAvatar(
              backgroundColor: circolor,
              child: Text(
                label,
                style: GoogleFonts.archivo(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              answer,
              style: GoogleFonts.archivo(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
