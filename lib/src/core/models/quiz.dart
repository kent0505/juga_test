class Quiz {
  Quiz({
    required this.id,
    required this.title,
    required this.answers,
  });

  final int id;
  final String title;
  final List<Answer> answers;
}

class Answer {
  Answer({
    required this.title,
    required this.correct,
  });

  final String title;
  final bool correct;
}

List<Quiz> quizesList = [
  Quiz(
    id: 1,
    title: 'What year was the first FIFA World Cup held?',
    answers: [
      Answer(title: '1924', correct: false),
      Answer(title: '1930', correct: true),
      Answer(title: '1934', correct: false),
    ],
  ),
  Quiz(
    id: 2,
    title: 'Which country won the FIFA World Cup in 1998?',
    answers: [
      Answer(title: 'Brazil', correct: false),
      Answer(title: 'France', correct: true),
      Answer(title: 'Italy', correct: false),
    ],
  ),
  Quiz(
    id: 3,
    title: 'Who is known as "The King of Football"',
    answers: [
      Answer(title: 'Diego Maradona', correct: false),
      Answer(title: 'Pelé', correct: true),
      Answer(title: 'Johan Cruyff', correct: false),
    ],
  ),
  Quiz(
    id: 4,
    title:
        'What is the maximum number of players allowed on the field for one team during a match?',
    answers: [
      Answer(title: '9', correct: false),
      Answer(title: '10', correct: false),
      Answer(title: '11', correct: true),
    ],
  ),
  Quiz(
    id: 5,
    title: 'Which country has won the most World Cups?',
    answers: [
      Answer(title: 'Germany', correct: false),
      Answer(title: 'Brazil', correct: true),
      Answer(title: 'Argentina', correct: false),
    ],
  ),
  Quiz(
    id: 6,
    title: 'In which year was the Premier League founded?',
    answers: [
      Answer(title: '1988', correct: false),
      Answer(title: '1992', correct: false),
      Answer(title: '2000', correct: true),
    ],
  ),
  Quiz(
    id: 7,
    title: 'Who holds the record for the most goals in World Cup history?',
    answers: [
      Answer(title: 'Miroslav Klose', correct: true),
      Answer(title: 'Ronaldo', correct: false),
      Answer(title: 'Gerd Müller', correct: false),
    ],
  ),
  Quiz(
    id: 8,
    title: 'Which club is known as "The Red Devils"?',
    answers: [
      Answer(title: 'Liverpool', correct: false),
      Answer(title: 'Arsenal', correct: false),
      Answer(title: 'Manchester United', correct: true),
    ],
  ),
  Quiz(
    id: 9,
    title: 'Who was the first woman to score in a FIFA Women’s World Cup?',
    answers: [
      Answer(title: 'Abby Wambach', correct: false),
      Answer(title: 'Birgit Prinz', correct: false),
      Answer(title: 'Michelle Akers', correct: true),
    ],
  ),
  Quiz(
    id: 10,
    title:
        'What is the name of the trophy awarded to the FIFA World Cup winner?',
    answers: [
      Answer(title: 'Jules Rimet Trophy', correct: true),
      Answer(title: 'FIFA Trophy', correct: false),
      Answer(title: 'Golden Cup', correct: false),
    ],
  ),
  Quiz(
    id: 11,
    title: 'Who is the only player to have won the Ballon d\'Or five times?',
    answers: [
      Answer(title: 'Lionel Messi', correct: true),
      Answer(title: 'Cristiano Ronaldo', correct: false),
      Answer(title: 'Michael Owen', correct: false),
    ],
  ),
  Quiz(
    id: 12,
    title: 'Which country hosted the 2014 FIFA World Cup?',
    answers: [
      Answer(title: 'South Africa', correct: true),
      Answer(title: 'Brazil', correct: false),
      Answer(title: 'Germany', correct: false),
    ],
  ),
  Quiz(
    id: 13,
    title:
        'Which player has made the most appearances in the UEFA Champions League?',
    answers: [
      Answer(title: 'Cristiano Ronaldo', correct: false),
      Answer(title: 'Lionel Messi', correct: false),
      Answer(title: 'Iker Casillas', correct: true),
    ],
  ),
  Quiz(
    id: 14,
    title: 'What is the standard length of a football pitch?',
    answers: [
      Answer(title: '90-110 meters', correct: true),
      Answer(title: '100-120 meters', correct: false),
      Answer(title: '110-130 meters', correct: false),
    ],
  ),
  Quiz(
    id: 15,
    title: 'How many times has Italy won the FIFA World Cup?',
    answers: [
      Answer(title: '2', correct: true),
      Answer(title: '3', correct: false),
      Answer(title: '4', correct: false),
    ],
  ),
  Quiz(
    id: 16,
    title: 'Who won the UEFA European Championship in 2016?',
    answers: [
      Answer(title: 'France', correct: false),
      Answer(title: 'Portugal', correct: true),
      Answer(title: 'Spain', correct: false),
    ],
  ),
  Quiz(
    id: 17,
    title: 'What do the letters VAR stand for in football?',
    answers: [
      Answer(title: 'Video Assistance Review', correct: false),
      Answer(title: 'Video Assistant Referee', correct: true),
      Answer(title: 'Visual Assistant Referee', correct: false),
    ],
  ),
  Quiz(
    id: 18,
    title: 'Which footballer is known for the "Hand of God"?',
    answers: [
      Answer(title: 'Lionel Messi', correct: false),
      Answer(title: 'Diego Maradona', correct: true),
      Answer(title: 'Thierry Henry', correct: false),
    ],
  ),
  Quiz(
    id: 19,
    title:
        'How many players are on a soccer team in total, including substitutes?',
    answers: [
      Answer(title: '18', correct: false),
      Answer(title: '23', correct: true),
      Answer(title: '20', correct: false),
    ],
  ),
  Quiz(
    id: 20,
    title: 'Which is the oldest football club in the world?',
    answers: [
      Answer(title: 'Sheffield FC', correct: true),
      Answer(title: 'Notts County', correct: false),
      Answer(title: 'Leyton Orient', correct: false),
    ],
  ),
];
