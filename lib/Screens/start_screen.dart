import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("../assets/images/bf.png",
          width: 300,),
          const SizedBox(height: 10,),
          const Text("Learn Flutter the fun way!",style: TextStyle(fontSize: 24,
          color: Colors.white),),
          const SizedBox(height: 30,),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            style:OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: startQuiz,
            label: const Text("Start Quiz"),),
        ],
      ),
    );
  }
}
