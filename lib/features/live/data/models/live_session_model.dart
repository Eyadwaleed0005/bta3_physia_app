import 'package:equatable/equatable.dart';

class LiveSessionModel extends Equatable {
  const LiveSessionModel({
    required this.id,
    required this.title,
    required this.instructor,
    required this.platform,
  });

  final String id;
  final String title;
  final String instructor;
  final String platform;

  LiveSessionModel copyWith({
    String? id,
    String? title,
    String? instructor,
    String? platform,
  }) {
    return LiveSessionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      instructor: instructor ?? this.instructor,
      platform: platform ?? this.platform,
    );
  }

  @override
  List<Object?> get props => [id, title, instructor, platform];

  static const LiveSessionModel defaultSession = LiveSessionModel(
    id: '1',
    title: 'مراجعة قوانين الحركة',
    instructor: 'الأستاذ جمال محمد',
    platform: 'Zoom',
  );
}
