// ignore_for_file: public_member_api_docs, sort_constructors_first
class League {
  final int id;
  final String name;
  final String logo;
  League({
    required this.id,
    required this.name,
    required this.logo,
  });

  factory League.fromMap(Map<String, dynamic> map) {
    return League(
      id: map['id'] as int,
      name: map['name'] as String,
      logo: map['logo'] as String,
    );
  }
}
