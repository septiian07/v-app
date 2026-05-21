import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

/// Request body model for the login API endpoint.
///
/// Uses [json_serializable] for compile-time JSON serialization.
/// Run `dart run build_runner build` to generate the `.g.dart` file.
@JsonSerializable()
class LoginRequestModel {
  final String email;
  final String password;

  const LoginRequestModel({
    required this.email,
    required this.password,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
