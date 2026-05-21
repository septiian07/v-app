import 'package:json_annotation/json_annotation.dart';

import 'package:tactical_app/features/auth/entities/user_entity.dart';

part 'login_response_model.g.dart';

/// Response model for the login API endpoint.
///
/// Uses [json_serializable] for compile-time JSON deserialization.
/// Run `dart run build_runner build` to generate the `.g.dart` file.
@JsonSerializable()
class LoginResponseModel {
  final String id;
  final String email;
  final String name;
  final String token;

  const LoginResponseModel({
    required this.id,
    required this.email,
    required this.name,
    required this.token,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  /// Map data model to a domain-layer [UserEntity].
  UserEntity toEntity() {
    return UserEntity(id: id, email: email, name: name);
  }
}
