import 'package:equatable/equatable.dart';

class ProfileAccountModel extends Equatable {
  const ProfileAccountModel({
    required this.id,
    required this.name,
    required this.email,
    required this.grade,
    this.avatarIndex = 0,
  });

  final String id;
  final String name;
  final String email;
  final String grade;

  final int avatarIndex;

  ProfileAccountModel copyWith({
    String? id,
    String? name,
    String? email,
    String? grade,
    int? avatarIndex,
  }) {
    return ProfileAccountModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      grade: grade ?? this.grade,
      avatarIndex: avatarIndex ?? this.avatarIndex,
    );
  }

  @override
  List<Object?> get props => [id, name, email, grade, avatarIndex];

  static List<ProfileAccountModel> defaultAccounts() {
    return const [
      ProfileAccountModel(
        id: '1',
        name: 'أحمد محمد',
        email: 'ahmed@example.com',
        grade: 'الصف الثالث الثانوي',
        avatarIndex: 0,
      ),
      ProfileAccountModel(
        id: '2',
        name: 'مريم أحمد',
        email: 'mariam@example.com',
        grade: 'الصف الثاني الثانوي',
        avatarIndex: 1,
      ),
    ];
  }
}
