import 'package:utinder/domain/domain.dart';

class UsersMapper {
  final List<UserModel> users;
  final String message;

  UsersMapper({
    required this.users,
    required this.message,
  });

  factory UsersMapper.fromJson(Map<String, dynamic> json) => UsersMapper(
        users: List<UserModel>.from(
            json["users"].map((x) => UserModel.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "message": message,
      };

  List<Person> toPersonEntity() {
    return users.map((e) {
      return Person(
        user: User(id: e.id, name: e.name, email: e.email),
        profile: Profile(
          id: e.profile.id,
          username: e.profile.username,
          faculty: e.profile.faculty,
        ),
      );
    }).toList();
  }
}

class UserModel {
  final int id;
  final String name;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ProfileModel profile;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.profile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        profile: ProfileModel.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "profile": profile.toJson(),
      };
}

class ProfileModel {
  final int id;
  final String username;
  final String faculty;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProfileModel({
    required this.id,
    required this.username,
    required this.faculty,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
