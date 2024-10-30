class MatchModel {
  const MatchModel({
    required this.id,
    required this.league,
    required this.title1,
    required this.title2,
    required this.logo1,
    required this.logo2,
    required this.goals1,
    required this.goals2,
    required this.stadium,
  });

  final int id;
  final String league;
  final String title1;
  final String title2;
  final String logo1;
  final String logo2;
  final int goals1;
  final int goals2;
  final String stadium;

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      id: json['league']['id'],
      league: json['league']['name'],
      title1: json['teams']['home']['name'],
      title2: json['teams']['away']['name'],
      logo1: json['teams']['home']['logo'],
      logo2: json['teams']['away']['logo'],
      goals1: json['goals']['home'] ?? 0,
      goals2: json['goals']['away'] ?? 0,
      stadium: json['fixture']['venue']['name'] ?? '',
    );
  }
}
