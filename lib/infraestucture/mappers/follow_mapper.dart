import 'package:utinder/domain/domain.dart';

class FollowMapper {
  final List<Follow> following;
  final List<Follow> followers;

  FollowMapper({
    required this.following,
    required this.followers,
  });

  factory FollowMapper.fromJson(Map<String, dynamic> json) => FollowMapper(
        following:
            List<Follow>.from(json["following"].map((x) => Follow.fromJson(x))),
        followers:
            List<Follow>.from(json["followers"].map((x) => Follow.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "following": List<dynamic>.from(following.map((x) => x.toJson())),
        "followers": List<dynamic>.from(followers.map((x) => x.toJson())),
      };

  Follows toEntityFollows() {
    final List<Profile> lFollowing = following.map((e) {
      return Profile(id: e.id, username: e.username, faculty: e.faculty);
    }).toList();

    final List<Profile> lFollowers = followers.map((e) {
      return Profile(id: e.id, username: e.username, faculty: e.faculty);
    }).toList();
    return Follows(following: lFollowing, followers: lFollowers);
  }
}

class Follow {
  final int id;
  final String username;
  final String faculty;
  final DateTime createdAt;
  final DateTime updatedAt;

  Follow({
    required this.id,
    required this.username,
    required this.faculty,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
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
