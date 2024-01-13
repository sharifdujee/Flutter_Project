import 'package:flutter/material.dart';
import 'package:knowledge/screen/answer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore) {
    setState(() {
      answerWasSelected = true;
      correctAnswerSelected = answerScore;

      _scoreTracker.add(
        answerScore
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : const Icon(
                Icons.clear,
                color: Colors.red,
              ),
      );

      if (answerScore) {
        _totalScore++; // Increment the total score if the answer is correct
      }

      if (_questionIndex + 1 == _questions.length) {
        endQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    if (_questionIndex >= _questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _scoreTracker = [];
      endQuiz = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
        
            children: [
              Row(
                children: [
                  if (_scoreTracker.length == 0)
                    const SizedBox(
                      height: 25.0,
                    ),
                  if (_scoreTracker.length > 0) ..._scoreTracker
                ],
              ),
              Container(
                width: double.infinity,
                height: 130.0,
                margin: const EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    _questions[_questionIndex]['question'].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ...(_questions[_questionIndex]['answers']
                      as List<Map<String, dynamic>>)
                  .map((answer) => AnswerScreen(
                      answerText: answer['answerText'],
                      answerColor: answerWasSelected
                          ? answer['score']
                              ? Colors.green
                              : Colors.red
                          : null,
                      answerTap: () {
                        if (answerWasSelected) {
                          return;
                        }
                        _questionAnswered(answer['score']);
                      })),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40.0)),
                onPressed: () {
                  if (!answerWasSelected) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          'Please Select an Answer  before going to the Next Question'),
                    ));
                    return;
                  }
                  _nextQuestion();
                },
                child: Text(endQuiz ? 'Reset Quiz' : 'Next Question'),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '${_totalScore.toString()}/${_questions.length}',
                  style: const TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (answerWasSelected && !endQuiz)
                Container(
                  height: 100,
                  width: double.infinity,
                  color: correctAnswerSelected ? Colors.green : Colors.red,
                  child: Center(
                    child: Text(
                      correctAnswerSelected
                          ? 'Well done, you got it right!'
                          : 'Wrong:/',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (endQuiz)
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      _totalScore > 4
                          ? 'Congratulations! Your Final Score is : $_totalScore'
                          : 'Your Final Score is : $_totalScore.Better luck next Time',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: _totalScore > 4 ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

const _questions = [
  {
    'question': 'What is the purpose of the static keyword in Java?',
    'answers': [
      {'answerText': 'Marks a variable as constant.', 'score': false},
      {'answerText': ' Indicates a method can be called without creating an instance of the class', 'score': true},
      {'answerText': 'Specifies a class is abstract.', 'score': false},
    ],
  },
  {
    'question':
        'Which collection framework interface provides a dynamic array implementation in Java?',
    'answers': [
      {'answerText': 'Map', 'score': false},
      {'answerText': 'Set', 'score': false},
      {'answerText': 'List', 'score': true},
    ],
  },
  {
    'question': 'What is the difference between == and .equals() when comparing objects in Java??',
    'answers': [
      {'answerText': 'Both are used for reference comparison', 'score': false},
      {'answerText': '== compares the content of objects, while .equals() checks for reference equality', 'score': false},
      {'answerText': '== is only used for primitive data types, and .equals() is for objects', 'score': true},
    ],
  },
  {
    'question': 'In Java, which keyword is used to implement multiple inheritance through interfaces?',
    'answers': [
      {'answerText': 'extends', 'score': false},
      {'answerText': 'Implements', 'score': true},
      {'answerText': 'inherits', 'score': false},
    ],
  },
  {
    'question':
        'What is the purpose of the super keyword in Java?',
    'answers': [
      {'answerText': 'Calls the superclass constructor', 'score': true},
      {'answerText': 'References the current instance of the class', 'score': false},
      {'answerText': 'Indicates a method is static', 'score': false},
    ],
  },
  {
    'question': 'Which exception is thrown when an array is accessed with an index that is outside its bounds??',
    'answers': [
      {'answerText': 'IndexOutOfBoundsException', 'score': true},
      {'answerText': 'ArrayIndexException', 'score': false},
      {'answerText': 'OutOfBoundsException', 'score': false},
    ],
  },
  {
    'question': 'What is the role of the finalize() method in Java?',
    'answers': [
      {'answerText': 'Marks an object for garbage collection', 'score':false},
      {'answerText': 'Explicitly deallocates memory', 'score': false},
      {'answerText': 'Invokes a method before object destruction', 'score': true},
    ],
  },
  {
    'question': 'Which design principle is violated by the Singleton pattern in Java?',
    'answers': [
      {'answerText': 'Encapsulation', 'score': true},
      {'answerText': 'Inheritance', 'score': false},
      {'answerText': 'Single Responsibility Principle', 'score': false},
    ],
  },
  {
    'question': 'What is the purpose of the transient keyword in Java??',
    'answers': [
      {'answerText': 'Specifies a variable is constant', 'score': false},
      {'answerText': 'Indicates that a variable should not be serialized', 'score': true},
      {'answerText': 'Allows a variable to be accessed from any package', 'score': false},
    ],
  },
];
