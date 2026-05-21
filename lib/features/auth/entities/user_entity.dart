import 'package:equatable/equatable.dart';

/// Core user entity in the domain layer.
/// Contains only business-relevant fields — no serialization logic.
class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
  });

  @override
  List<Object?> get props => [id, email, name];
}
