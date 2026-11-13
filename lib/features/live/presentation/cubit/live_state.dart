import 'package:equatable/equatable.dart';

enum LiveViewMode { available, empty, loading, failure, offline, opening }

class LiveState extends Equatable {
  const LiveState({
    this.viewMode = LiveViewMode.available,
    this.liveTitle = 'لا يوجد بث مباشر حاليا',
    this.grade = 'الصف الثالث الثانوي',
    this.subject = 'الفيزياء',
    this.teacher = 'مع الأستاذ جمال محمد',
  });

  final LiveViewMode viewMode;
  final String liveTitle;
  final String grade;
  final String subject;
  final String teacher;

  LiveState copyWith({
    LiveViewMode? viewMode,
    String? liveTitle,
    String? grade,
    String? subject,
    String? teacher,
  }) {
    return LiveState(
      viewMode: viewMode ?? this.viewMode,
      liveTitle: liveTitle ?? this.liveTitle,
      grade: grade ?? this.grade,
      subject: subject ?? this.subject,
      teacher: teacher ?? this.teacher,
    );
  }

  @override
  List<Object?> get props => [viewMode, liveTitle, grade, subject, teacher];
}
