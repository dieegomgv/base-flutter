import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  final int? id;
  final String? nombre;
  final String? apellido;
  final String? email;
  final int? tipo_usuario_id;

  User({this.id, this.nombre, this.apellido, this.email, this.tipo_usuario_id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      nombre: json['nombre'] as String?,
      apellido: json['apellido'] as String?,
      email: json['email'] as String?,
      tipo_usuario_id: json['tipo_usuario_id'] as int?,
    );
  }
}