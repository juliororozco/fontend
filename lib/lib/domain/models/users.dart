class User {
  String id;
  String name;
  String email;
  String department;
  String city;
  String direction;
  String token;  
  User({
    required this.id,
    required this.name,
     required this.email,
     required this.department,
    required this.city,
    required this.direction,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      department: json['department'],
      city: json['city'],
      direction: json['direction'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'department': department,
      'city': city,
      'direction': direction,
      'token': token,
    };
  }
}
