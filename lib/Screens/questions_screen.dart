import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  String? selectedAnswer;
  bool? isAnswerCorrect;

  void answerQuestion(String selectedAnswer) {
    final correctAnswer = questions[currentQuestionIndex].answers[0]; // ✅ First answer is correct

    setState(() {
      this.selectedAnswer = selectedAnswer;
      isAnswerCorrect = selectedAnswer == correctAnswer; // Compare answers
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (currentQuestionIndex < questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          this.selectedAnswer = null;
          isAnswerCorrect = null;
        });
      }
    });

    widget.onSelectAnswer(selectedAnswer);
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.answers.map((answer) {
              return AnswerButton(
                text: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }).toList(),
            if (selectedAnswer != null) // Show feedback
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  isAnswerCorrect == true ? "Correct Answer! ✅" : "Wrong Answer! ❌",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isAnswerCorrect == true ? Colors.green : Colors.red,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
