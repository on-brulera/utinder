import 'package:utinder/domain/entities/profile.dart';
import 'package:utinder/domain/entities/user.dart';

class Person {
  final User user;
  final Profile profile;

  Person({required this.user, required this.profile});
}
