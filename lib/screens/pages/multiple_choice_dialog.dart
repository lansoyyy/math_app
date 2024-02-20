import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:mathalino/screens/home_screen.dart';
import 'package:mathalino/screens/pages/assessment_page.dart';
import 'package:mathalino/widgets/toast_widget.dart';

class MultipleChoicePage extends StatefulWidget {
  const MultipleChoicePage({super.key});

  @override
  _MultipleChoicePageState createState() => _MultipleChoicePageState();
}

class _MultipleChoicePageState extends State<MultipleChoicePage> {
  bool playing = false;
  final cont = ConfettiController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cont.addListener(() {
      setState(() {
        playing = cont.state == ConfettiControllerState.playing;
      });
    });
  }

  int _currentQuestionIndex = 0;
  final List<String> _questions = [
    '''
Choose the correct number represent by each of the following:
100+20+1=_______

''',
    '''
Choose the correct number represent by each of the following:
4000+ 200+10+1=_______

''',
    '''
Choose the correct missing terms of the following number sequence.
1, 2, 4, _, 11

''',
    '''
Choose the correct missing terms of the following number sequence.
1, 3, 7, _, 31, 63

''',
    '''
Choose the correct missing terms of the following number sequence.
1, 2, 4, 7,  _

''',
    '''
What is the Least Common Denominator (LCD) of the following fraction.
2/3 and 4/6

''',
    '''
What is the Least Common Denominator (LCD) of the following fraction.
½ and ¼ 

''',
    '''
What is the correct place value of the following underlined number.
1 4 3 1

    ''',
    '''
What is the correct place value of the following underlined number.
4 3 1

''',
    '''
 Choose the correct numbers of the following symbols. 
FIFTY-FIVE THOUSAND SIXTEEN 

''',
    '''
Choose the correct numbers of the following symbols. 
ONE HUNDRED SEVENTY

''',
    '''
Choose the correct factor of the given number 
12

''',
    'What is the word form of 0.65?',
    '''
Which number correctly completes the questions?
20 x 5 = _____

''',
    '''
Which number correctly completes the questions?
100 x 2 = _____

''',
    ' Dana used a rule to make a number pattern. Her rule is to multiply by 2. Which number pattern follows Dana’s rule? ',
    'Bridget’s uncle was born in the year 1935.  What digit is in the hundreds place in 1935? ',
    ' The highest city in the world is 12,087 feet above sea level. What is the place value of the 2 in 12,087? ',
    'Wiley Post traveled fifteen thousand, five hundred ninety-six miles. Which shows that distance written as a numeral?  ',
    ' What is five hundred two and seventy-one hundredths written in numerals? ',
    'Which number has the greatest value?',
    ' Which number is a multiple of 4?',
    'Which sentence is true?',
    'choose the correct QUOTIENT of the given numbers. 25 divided by 5',
    ' choose the correct DIFFERENCE of the given numbers.',
    'choose the correct DIFFERENCE of the given numbers.',
    'choose the correct QUOTIENT of the given numbers.',
    'choose the correct DIFFERENCE of the given numbers.',
    'Choose the correct name of the Polygon that has 3 equal sides and 3 angles.',
  ];
  final List<List<String>> _options = [
    ['121', '123', '122', '124'],
    ['2141', '4211', '2114', '2411'],
    ['7', '5', '3', '2'],
    ['8', '10', '9', '15'],
    ['11', '5', '3', '2'],
    ['2', '12', '6', '5'],
    ['2', '8', '4', '12'],
    ['Ones', 'Hundreds', 'Tens', 'Thousands'],
    ['Ones', 'Hundreds', 'Tens', 'Thousands'],
    ['55,016', '55,0016', '55,160', '55,00016'],
    ['107', '170', '10070', '1700'],
    ['2x2x2', '2x2x4', '2x2x3', '2x2x2x2'],
    [
      'Sixty-five',
      'Sixty-Five Hundredths',
      'Sixty-Five Tenths',
      'Sixty-Five Thousandths'
    ],
    ['100', '50', '110', '40'],
    ['200', '500', '100', '400'],
    [
      '4, 6, 9, 10, 12 ',
      '2, 4, 8, 16, 32',
      '5, 7, 9, 11, 13 ',
      '1, 3, 6, 9, 12'
    ],
    ['1', '9', '3', '5'],
    ['ten thousands  ', 'thousands', 'hundreds ', 'tens '],
    ['1556   ', '1596', '15,596', '15,956'],
    ['5027.10    ', '527.10 ', '502.71', '52.71 '],
    ['0.45    ', '0.54', '4.05 ', '4.50'],
    ['5', '6', '7', '8'],
    ['10 > 5', '3 > 5', '5 < 2', '10 = 5'],
    ['10', '3', '5', '2'],
    ['24', '25', '50', '26'],
    ['200', '100', '300', '1000'],
    ['10', '30', '50', '20'],
    ['50', '100', '75', '25'],
    ['Quadrilateral', 'Rumbos', 'Triangle', 'Circle'],
  ];
  final List<int> _answers = [
    0,
    1,
    0,
    3,
    0,
    2,
    2,
    0,
    1,
    0,
    1,
    1,
    2,
    1,
    0,
    1,
    1,
    0,
    1,
    2,
    3,
    3,
    0,
    2,
    0,
    1,
    2,
    2,
    2
  ]; // Index of the correct answer for each question

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Multiple Choice'),
        ),
        body: _buildQuizBody());
  }

  int score = 0;

  List<String?> _selectedOptions = List.filled(20, null);

  late Timer _timer;

  Widget _buildQuizBody() {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildQuestion(),
            const SizedBox(height: 20),
            _buildOptions(),
            const SizedBox(height: 20),
            // _buildNextButton(),
          ],
        ),
        ConfettiWidget(
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: true,
          confettiController: cont,
        ),
      ],
    );
  }

  Widget _buildQuestion() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        _questions[_currentQuestionIndex],
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }

  Widget _buildOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _options[_currentQuestionIndex].map((option) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: () {
              _checkAnswer(option);
            },
            child: Text(option),
          ),
        );
      }).toList(),
    );
  }

  Future<void> _checkAnswer(String selectedOption) async {
    int correctAnswerIndex = _answers[_currentQuestionIndex];
    String correctAnswer = _options[_currentQuestionIndex][correctAnswerIndex];

    if (selectedOption == correctAnswer) {
      setState(() {
        score++;
      });
      showToast('Correct answer!');
      cont.play();
      await Future.delayed(const Duration(seconds: 3));
      cont.stop();
      // Answer is correct
      // You can add your logic here, e.g., increase score, show correct answer
      _nextQuestion();
    } else {
      // Answer is incorrect
      // You can add your logic here, e.g., show correct answer

      showToast('Wrong answer!');
    }

    // Move to the next question
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      if (_currentQuestionIndex >= _questions.length) {
        // All questions have been answered
        _showScoreDialog();
      }
    });
  }

  void _showScoreDialog() {
    _timer.cancel();
    int correctAnswers = 0;
    for (int i = 0; i < _questions.length; i++) {
      int correctAnswerIndex = _answers[i];
      String correctAnswer = _options[i][correctAnswerIndex];
      if (_selectedOptions[i] == correctAnswer) {
        correctAnswers++;
      }
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.white,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Multiple Choice Finished'),
          content: Text(
              'You answered $score out of ${_questions.length} questions correctly.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Assessmentpage()));
                // Reset quiz
                setState(() {
                  _currentQuestionIndex = 0;
                  _selectedOptions = List.filled(_questions.length, null);
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  showtimesupDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.white,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Times Up!'),
            content: const Text('Your time has ended!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                  // Reset quiz
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
}
