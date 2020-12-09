part of 'models.dart';

class Users extends Equatable {
  //attribute
  final String uid;
  final String email;
  final String name;
  final String profilePicture;

  //constructor

  Users(this.uid, this.email, {this.name, this.profilePicture});

  @override
  List<Object> get props => [uid, email, name, profilePicture];
}
