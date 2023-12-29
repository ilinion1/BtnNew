import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footbal_app/src/common/const/app_colors.dart';
import 'package:footbal_app/src/common/const/app_text_styles.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;

  final List<Map<String, Object>> questions = [
    {
      'question': 'How many players are there in a football team?',
      'options': ['9', '10', '11', '12'],
      'correctAnswerIndex': 2,
    },
    {
      'question': 'Where was the first FIFA World Cup held?',
      'options': ['England', 'Italy', 'Uruguay', 'France'],
      'correctAnswerIndex': 2,
    },
    {
      'question': 'Which country has won the most FIFA World Cup titles?',
      'options': ['Brazil', 'Germany', 'Italy', 'Argentina'],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'Who is the all-time top scorer in the FIFA World Cup?',
      'options': [
        'Lionel Messi',
        'Pele',
        'Cristiano Ronaldo',
        'Diego Maradona'
      ],
      'correctAnswerIndex': 1,
    },
    {
      'question':
          'In what year was the first official international football match played?',
      'options': ['1888', '1900', '1872', '1904'],
      'correctAnswerIndex': 2,
    },
    {
      'question':
          'Which football club has won the most UEFA Champions League titles?',
      'options': ['Real Madrid', 'FC Barcelona', 'AC Milan', 'Liverpool'],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'Who is known as the "King of Football"?',
      'options': [
        'Diego Maradona',
        'Pele',
        'Lionel Messi',
        'Cristiano Ronaldo'
      ],
      'correctAnswerIndex': 1,
    },
    {
      'question': 'Which stadium is the largest in terms of seating capacity?',
      'options': [
        'Camp Nou',
        'Old Trafford',
        'Melbourne Cricket Ground',
        'Rungrado 1st of May Stadium'
      ],
      'correctAnswerIndex': 3,
    },
    {
      'question': 'Who won the FIFA Ballon d\'Or in 2021?',
      'options': [
        'Lionel Messi',
        'Robert Lewandowski',
        'Cristiano Ronaldo',
        'Mohamed Salah'
      ],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'Which nation hosted the first Women\'s World Cup in 1991?',
      'options': ['United States', 'China', 'Sweden', 'Norway'],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'In what year did the Premier League begin?',
      'options': ['1990', '1992', '1988', '1994'],
      'correctAnswerIndex': 1,
    },
    {
      'question': 'Who is the manager of the Manchester City football club?',
      'options': [
        'Jurgen Klopp',
        'Thomas Tuchel',
        'Pep Guardiola',
        'Ole Gunnar Solskjaer'
      ],
      'correctAnswerIndex': 2,
    },
    {
      'question': 'Which country won the UEFA Euro 2020 tournament?',
      'options': ['France', 'Italy', 'England', 'Belgium'],
      'correctAnswerIndex': 1,
    },
    {
      'question':
          'Who holds the record for the most goals scored in a single European Championship?',
      'options': [
        'Cristiano Ronaldo',
        'Michel Platini',
        'Alan Shearer',
        'Zlatan Ibrahimovic'
      ],
      'correctAnswerIndex': 1,
    },
    {
      'question': 'Which player is famously known as the "Egyptian King"?',
      'options': ['Mohamed Salah', 'Sadio Mane', 'Riyad Mahrez', 'Trezeguet'],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'In what year did the United States host the FIFA World Cup?',
      'options': ['1982', '1994', '2002', '1978'],
      'correctAnswerIndex': 1,
    },
    {
      'question':
          'Which African nation has won the most Africa Cup of Nations titles?',
      'options': ['Nigeria', 'Ghana', 'Cameroon', 'Egypt'],
      'correctAnswerIndex': 3,
    },
    {
      'question':
          'Who is the all-time leading goal scorer in the UEFA Champions League?',
      'options': [
        'Lionel Messi',
        'Cristiano Ronaldo',
        'Raul',
        'Robert Lewandowski'
      ],
      'correctAnswerIndex': 1,
    },
    {
      'question': 'Which footballer is known as the "Little Magician"?',
      'options': [
        'Andres Iniesta',
        'Neymar',
        'Philippe Coutinho',
        'Luka Modric'
      ],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'Which nation won the first FIFA World Cup in 1930?',
      'options': ['Uruguay', 'Brazil', 'Argentina', 'Italy'],
      'correctAnswerIndex': 0,
    },
    {
      'question':
          'Who won the FIFA Puskas Award in 2021 for the best goal of the year?',
      'options': ['Lionel Messi', 'Robert Lewandowski', 'Erik Lamela', 'Pedri'],
      'correctAnswerIndex': 2,
    },
    {
      'question':
          'Which goalkeeper holds the record for the most clean sheets in Premier League history?',
      'options': [
        'Edwin van der Sar',
        'Petr Cech',
        'David De Gea',
        'Thibaut Courtois'
      ],
      'correctAnswerIndex': 1,
    },
    {
      'question':
          'Who is the all-time top scorer in the history of the Copa America?',
      'options': ['Lionel Messi', 'Neymar', 'Zico', 'Pelé'],
      'correctAnswerIndex': 3,
    },
    {
      'question':
          'Which club did Cristiano Ronaldo join after leaving Manchester United in 2009?',
      'options': ['Real Madrid', 'Barcelona', 'Bayern Munich', 'Juventus'],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'Who won the FIFA Women\'s World Cup in 2019?',
      'options': ['United States', 'Netherlands', 'France', 'Germany'],
      'correctAnswerIndex': 0,
    },
    {
      'question':
          'In what year did Brazil host the FIFA World Cup for the second time?',
      'options': ['1950', '1962', '1970', '2014'],
      'correctAnswerIndex': 3,
    },
    {
      'question': 'Who is the captain of the Argentina national football team?',
      'options': [
        'Lionel Messi',
        'Sergio Ramos',
        'Paulo Dybala',
        'Angel Di Maria'
      ],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'Which stadium is known as the "Theatre of Dreams"?',
      'options': ['Camp Nou', 'Anfield', 'Old Trafford', 'Santiago Bernabeu'],
      'correctAnswerIndex': 2,
    },
    {
      'question':
          'Who won the FIFA Golden Glove award for the best goalkeeper in the 2018 World Cup?',
      'options': [
        'Thibaut Courtois',
        'Jordan Pickford',
        'Alisson Becker',
        'Hugo Lloris'
      ],
      'correctAnswerIndex': 0,
    },
    {
      'question':
          'Who is the all-time top scorer in the history of the Premier League?',
      'options': [
        'Thierry Henry',
        'Alan Shearer',
        'Wayne Rooney',
        'Frank Lampard'
      ],
      'correctAnswerIndex': 1,
    }
  ];

  void answerQuestion(int selectedAnswerIndex) {
    setState(() {
      if (selectedAnswerIndex ==
          questions[currentQuestionIndex]['correctAnswerIndex']) {
        correctAnswers++;
      }

      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Show the result when all questions are answered
        showResult();
      }
    });
  }

  void showResult() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Result'),
          content: Text(
              'Correct Answers: $correctAnswers out of ${questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetQuiz();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      correctAnswers = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.gradientBackground,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 80.h,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Quiz',
            style: AppTextStyle.leagueTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: ColoredBox(
                    color: AppColors.backgroundMiddle,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 22.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${currentQuestionIndex + 1}/30',
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45.w),
                            child: Text(
                              questions[currentQuestionIndex]['question']
                                  .toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ...(questions[currentQuestionIndex]['options'] as List<String>)
                    .map((option) {
                  return Padding(
                    padding: EdgeInsets.only(top: 21.h),
                    child: SizedBox(
                      height: 65.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.backgroundMiddle,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        onPressed: () => answerQuestion(
                            (questions[currentQuestionIndex]['options']
                                    as List<String>)
                                .indexOf(option)),
                        child: Text(
                          option,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
