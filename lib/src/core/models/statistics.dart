class Statistics {
  Statistics({
    required this.team1,
    required this.team2,
  });

  final Team team1;
  final Team team2;

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      team1: Team.fromJson(json['response'][0]['statistics']),
      team2: Team.fromJson(json['response'][1]['statistics']),
    );
  }
}

class Team {
  Team({
    required this.shots,
    required this.shotsOnGoal,
    required this.possession,
    required this.passes,
    required this.passesAccuracy,
    required this.fouls,
    required this.yellowCards,
    required this.redCards,
    required this.offsides,
    required this.corners,
  });

  final int shots;
  final int shotsOnGoal;
  final String possession;
  final int passes;
  final String passesAccuracy;
  final int fouls;
  final int yellowCards;
  final int redCards;
  final int offsides;
  final int corners;

  factory Team.fromJson(List<dynamic> statistics) {
    return Team(
      shots: statistics[2]['value'] ?? 0,
      shotsOnGoal: statistics[0]['value'] ?? 0,
      possession: statistics[9]['value'] ?? '0%',
      passes: statistics[13]['value'] ?? 0,
      passesAccuracy: statistics[15]['value'] ?? '0%',
      fouls: statistics[6]['value'] ?? 0,
      yellowCards: statistics[10]['value'] ?? 0,
      redCards: statistics[11]['value'] ?? 0,
      offsides: statistics[8]['value'] ?? 0,
      corners: statistics[7]['value'] ?? 0,
    );
  }
}
