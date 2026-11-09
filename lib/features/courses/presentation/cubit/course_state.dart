import 'package:bta3_physia/features/courses/data/models/course_model.dart';
import 'package:equatable/equatable.dart';

enum CourseViewMode { loading, available, empty, failure }

enum CourseFilter { free, paid }

class CourseState extends Equatable {
  const CourseState({
    this.title = 'الكورسات',
    this.subTitle = 'الصف الثالث الثانوي · الفيزياء',
    this.viewMode = CourseViewMode.available,
    this.filter = CourseFilter.free,
    this.query = '',
    this.courses = const [],
  });

  final String title;
  final String subTitle;
  final CourseViewMode viewMode;
  final CourseFilter filter;
  final String query;
  final List<CourseModel> courses;

  List<CourseModel> get visibleCourses => courses
      .where(
        (course) =>
            filter == CourseFilter.free ? course.isFree : !course.isFree,
      )
      .where((course) => course.matchesQuery(query))
      .toList();

  CourseState copyWith({
    String? title,
    String? subTitle,
    CourseViewMode? viewMode,
    CourseFilter? filter,
    String? query,
    List<CourseModel>? courses,
  }) {
    return CourseState(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      viewMode: viewMode ?? this.viewMode,
      filter: filter ?? this.filter,
      query: query ?? this.query,
      courses: courses ?? this.courses,
    );
  }

  @override
  List<Object?> get props => [
    title,
    subTitle,
    viewMode,
    filter,
    query,
    courses,
  ];
}
