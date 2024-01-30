import 'package:utinder/domain/domain.dart';

class Follows {
  final List<Profile> following;
  final List<Profile> followers;

  Follows({required this.following, required this.followers});
}
