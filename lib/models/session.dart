class Session {

  final int id;

  final String name;

  final String username;

  final String email;

  final String firstLastname;

  final String secondLastname;

  final DateTime birthDate;

  Session.blank(this.id, this.name, this.username, this.email, this.firstLastname, this.secondLastname, this.birthDate);

  Session(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.firstLastname,
      required this.secondLastname,
      required this.birthDate
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      firstLastname: json['firstLastname'],
      secondLastname: json['secondLastname'],
      birthDate: json['birthDate'],
    );
  }
}