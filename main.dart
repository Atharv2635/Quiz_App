import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp());
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {

  int queIndex = 0;
  int count = 0;
  bool reTest = false;

  List<Map> queList = [
    {
      "question" : "Which of the following is NOT an anti-virus software ?",
      "option" : ["Avast ", "Linux ","Norton ", "Kaspersky "],
      "correct" : 1
    },
    {
      "question" : "Which unit of computer is considered as brain of the computer ?",
      "option" : ["Memory unit", "Input unit","CPU", "Output unit"],
      "correct" : 2
    },
    {
      "question" : "In the context of computing, what is the full form of URL ?",
      "option" : ["Undistributed Resource Locator", "Unified Resource Locator","Uniform Resource Locator", "Uniform Region Locator"],
      "correct" : 2
    },
    {
      "question" : "In the context of computing, a byte is equal to _____ bits ?",
      "option" : ["4 ", "16 ","24 ", "8 "],
      "correct" : 3
    },
    {
      "question" : "Which of the following devices is NOT used to enter data into a computer ?",
      "option" : ["Monitor", "Keyboard","Scanner", "Mouse"],
      "correct" : 0
    },
  ];

  int selectedAnswerIndex = -1;

  WidgetStateProperty<Color?> checkAnswer(int index) {
    
    if(selectedAnswerIndex != -1) {
      if(index == queList[queIndex]["correct"]){
        count++;
        return const WidgetStatePropertyAll(Colors.green);
      }
      else if(selectedAnswerIndex == index){
        count--;
        return const WidgetStatePropertyAll(Colors.red);
      }
      else{
        return const WidgetStatePropertyAll(null);
      }
    }
    else{
      return WidgetStatePropertyAll(null);
    }
  }

  bool questionPage = true;
  @override
  Widget build(BuildContext context) {
    return  questionScreen();
  }
    Scaffold questionScreen() {
      if(questionPage == true){
        return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App",
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.amber,
          fontWeight: FontWeight.w900,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body:  Column(
         children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 100,
            width: 450,
            child: Center(
              child: Text(
                "Question: ${(queIndex+1)}/${queList.length}",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.purple,
                  fontWeight: FontWeight.w600,
                ),
                ),
              ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 350,
            height: 60,
            child: Text(
              queList[queIndex]["question"],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              ),
          ),
          const SizedBox(
            height: 50,
          ),

          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(0),
              ),
              onPressed: () {
                if(selectedAnswerIndex == -1) {
                  selectedAnswerIndex = 0;  
                }
                 setState(() {});
              },
               child: Text(
                queList[queIndex]["option"][0],
                style: const TextStyle(
                  fontSize: 20,
                ),
               ),
              ),
          ),
           const SizedBox(
            height: 50,
          ),

          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(1),
              ),
              onPressed: () {
                if(selectedAnswerIndex == -1) {
                  selectedAnswerIndex = 1;  
                }
                 setState(() {});
              },
               child: Text(queList[queIndex]["option"][1],
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
           const SizedBox(
            height: 50,
          ),

          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(2),
              ),
              onPressed: () {
                if(selectedAnswerIndex == -1) {
                  selectedAnswerIndex = 2;  
                }
                 setState(() {});
              },
               child: Text(queList[queIndex]["option"][2],
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
           const SizedBox(
            height: 50,
          ),

          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(3),
              ),
              onPressed: () {
                if(selectedAnswerIndex == -1) {
                  selectedAnswerIndex = 3;  
                }
                setState(() {});
              },
               child: Text(queList[queIndex]["option"][3],
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          if(selectedAnswerIndex != -1) {
          if(queIndex < queList.length-1) {
            queIndex++;
          }
          else {
            questionPage = false;
          }
          selectedAnswerIndex = - 1;
           setState(() {});
        }
        },
        child: const Icon(Icons.forward,
          color: Colors.amber,
        ), 
      ),
    );
  }else{
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Result",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.amber
          ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0xY1nYOlJBTCeVQp6d-Yd7LB3tjk18pplGA&s", 
            height: 300
            ),

            const SizedBox(
              height: 50,
            ),
            const Text(
              "Congratulations..",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.purple,
              ),
              ),
              const SizedBox(height: 10,),
              const Text("You have completed a Quiz.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.cyanAccent,

              ),
              ),
              const SizedBox(height: 20,),
              Text(
                "Score: $count / ${queList.length}",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 22,
                  fontWeight: FontWeight.w500
                ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue)
                    ),
                    onPressed:() {
                      if(reTest == false) {
                        questionPage = true;
                        queIndex = 0;
                        count = 0;
                      }
                      setState(() {});
                    },
                    child: const Text(
                      "Re-Test",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      )
                  ),
                ),
          ],
        ),
      ),
    );
  }
  }
}