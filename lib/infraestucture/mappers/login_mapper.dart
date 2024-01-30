import 'package:utinder/domain/domain.dart';

class LoginMapper {
  final UserMapper user;
  final ProfileMapper profile;
  final String token;
  final String message;

  LoginMapper({
    required this.user,
    required this.profile,
    required this.token,
    required this.message,
  });

  factory LoginMapper.fromJson(Map<String, dynamic> json) => LoginMapper(
        user: UserMapper.fromJson(json["user"]),
        profile: ProfileMapper.fromJson(json["profile"]),
        token: json["token"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "profile": profile.toJson(),
        "token": token,
        "message": message,
      };

  Session toSessionEntity() => Session(
      user: User(id: user.id,name: user.name, email: user.email),
      profile: Profile(
          username: profile.username,
          faculty: profile.faculty,
          ),
      token: token);
}

class ProfileMapper {
  final int id;
  final String username;
  final String faculty;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProfileMapper({
    required this.id,
    required this.username,
    required this.faculty,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProfileMapper.fromJson(Map<String, dynamic> json) => ProfileMapper(
        id: json["id"],
        username: json["username"],
        faculty: json["faculty"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "faculty": faculty,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class UserMapper {
  final int id;
  final String name;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserMapper({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserMapper.fromJson(Map<String, dynamic> json) => UserMapper(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
