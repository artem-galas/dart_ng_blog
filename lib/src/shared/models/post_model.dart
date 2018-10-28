import './user_model.dart';

class PostModel {
  final String id;
  String body;
  String image;
  String title;
  final UserModel author;
  PostModel(this.id, this.body, this.image, this.title, this.author);
}
