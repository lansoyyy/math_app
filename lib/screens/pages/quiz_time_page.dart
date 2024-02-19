import 'package:flutter/material.dart';
import 'package:mathalino/screens/pages/assessment_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  final List<String> _questions = [
    'Which of the following are factors of 15?',
    'All of the following are factors of 12. Which of these is not?',
    'Which of the following is not a multiple of 4?',
    'Choose the correct multiples of 3.',
    'Which is a prime number?',
    'Which of the following is a composite number?',
    'Which of these numbers is a prime number?',
    'Write 16 as a product of its prime factors.',
    'How is 48 written as a product of its prime factors?',
    'Write 72 as a product of its prime factor.',
    'What is the Greatest Common Factor (GCF) of 14 and 28?',
    'What is the Greatest Common Factor (GCF) of 12 and 18?',
    'What are the common factors of 21 and 35?',
    'What is the Greatest Common Multiple (LCM) of 8 and 3?',
    'What is the Least Common Multiple (LCM) of 9 and 15?',
    'What are the first 5 common multiples of 4 and 8?',
    '''Jarcel exercise every 12 days and Jayvee every 8 day. Jarcel
and Jayvee both exercised today. How many days will it be
until they exercise together again?''',
    '''
Three girls went swimming at the river. After swimming, they
collected stones. They collected 48 white stones and 60
brown stones. What was the greatest number of stones they
collected per hour if they collected the same number of stones
per hour?
''',
    '''
Dayne and Amielle are going to pack old books with 6 Science
books and 8 mathematics books in a box. What will be the
smallest number of Science books and Mathematics books
that they can pack if these are of the same number?
''',
    '''
Lyka baked 48 cookies and 64 cupcakes. If she will pack
these in boxes with the same number, what is the biggest
number of cookies and cupcakes that can be packed in a
box?
''',
  ];
  final List<List<String>> _options = [
    ['1,3,5,7,13,15', '15,30', '1,3,5,15', '5,10,15'],
    ['8', '3', '4', '6'],
    ['16', '18', '36', '28'],
    ['6,9,15,21,27', '3,6,8,12,18', '12,14,16,18,20', '9,16,21,24,30'],
    ['99', '93', '97', '95'],
    ['47', '41', '49', '43'],
    ['35', '59', '51', '48'],
    ['2 x 2 x 2 x 2 x 2', '2 x 3 x 3', '2 x 2 x 2 x 2', '2 x 2 x 3'],
    ['2 x 3 x 8', '2 x 2 x 2 x 6', '2 x 2 x 2 x 2 x 3', '6 x 8'],
    [
      '3 x 3 x 3 x 3',
      '2 x 2 x 2 x 3',
      '2 x 2 x 2 x 2 x 2 x 2',
      '2 x 2 x 2 x 3 x 3'
    ],
    ['7', '9', '14', '28'],
    ['9', '6', '3', '12'],
    ['5 and 7', '3 and 7', '1 and 5', '1 and 7'],
    ['8', '24', '48', '3'],
    ['6', '45', '3', '15'],
    ['4,8,12,16,24', '5,10,15,20,25', '8,16,24,32,40', '2,4,6,8,10'],
    ['20', '18', '12', '24'],
    ['12', '20', '6', '24'],
    ['16', '12', '24', '32'],
    ['24', '32', '64', '16'],
  ];
  final List<int> _answers = [
    2,
    0,
    1,
    0,
    2,
    2,
    1,
    2,
    0,
    3,
    2,
    1,
    3,
    3,
    2,
    0,
    0,
    0,
    0,
    3,
  ]; // Index of the correct answer for each question

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Quiz Time'),
      ),
      body: _buildQuizBody(),
    );
  }

  int score = 0;

  List<String?> _selectedOptions = List.filled(20, null);

  Widget _buildQuizBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildQuestion(),
        const SizedBox(height: 20),
        _buildOptions(),
        const SizedBox(height: 20),
        // _buildNextButton(),
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
            onPressed: () => _checkAnswer(option),
            child: Text(option),
          ),
        );
      }).toList(),
    );
  }

  void _checkAnswer(String selectedOption) {
    int correctAnswerIndex = _answers[_currentQuestionIndex];
    String correctAnswer = _options[_currentQuestionIndex][correctAnswerIndex];

    if (selectedOption == correctAnswer) {
      setState(() {
        score++;
      });
      // Answer is correct
      // You can add your logic here, e.g., increase score, show correct answer
    } else {
      // Answer is incorrect
      // You can add your logic here, e.g., show correct answer
    }

    // Move to the next question
    _nextQuestion();
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
          title: const Text('Quiz Finished'),
          content: Text(
              'You answered $score out of ${_questions.length} questions correctly.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
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
}
