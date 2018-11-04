import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

abstract class UserBaseModel {
  String email;

  UserBaseModel(this.email);
}

@JsonSerializable()
class UserModel extends UserBaseModel {
  String id;
  String name;
  String avatar;

  UserModel(this.id, String email, this.name, this.avatar): super(email);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class SignInRequestModel extends UserBaseModel {
  String password;

  SignInRequestModel(String email, this.password): super(email);

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) => _$SignInRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignInRequestModelToJson(this);
}

@JsonSerializable()
class SignUpRequestModel extends UserBaseModel {
  String name;
  String password;

  SignUpRequestModel(String email, this.password, this.name): super(email);

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) => _$SignUpRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}

@JsonSerializable()
class UserTokenModel {
  @JsonKey(name: 'auth_token')
  String authToken;

  UserTokenModel(this.authToken);

  factory UserTokenModel.fromJson(Map<String, dynamic> json) => _$UserTokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserTokenModelToJson(this);
}
