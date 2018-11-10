import 'package:json_annotation/json_annotation.dart';

import './user_model.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  final String id;
  final String body;
  final String image;
  final String title;
  final UserModel author;
  PostModel({this.id, this.body, this.image, this.title, this.author});

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
