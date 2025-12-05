class UserEntity {
  final String id;
  final String name;
  final String email;

  UserEntity({required this.id, required this.name, required this.email});

  toMap() {
    return {'id': id, 'name': name, 'email': email};
  }
}
