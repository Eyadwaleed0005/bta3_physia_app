import 'package:bta3_physia/features/courses/data/models/lesson_pdf_viewer_arguments.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/course_cubit.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/lesson_detail_cubit.dart';
import 'package:bta3_physia/features/courses/presentation/cubit/lesson_pdf_cubit.dart';
import 'package:get_it/get_it.dart';

void registerCoursesDependencies(GetIt getIt) {
  _registerCubits(getIt);
}

void _registerCubits(GetIt getIt) {
  getIt.registerFactory<CourseCubit>(() => CourseCubit());
  getIt.registerFactory<LessonDetailCubit>(() => LessonDetailCubit());
  getIt.registerFactoryParam<LessonPdfCubit, LessonPdfViewerArguments, void>(
    (arguments, _) =>
        LessonPdfCubit(title: arguments.title, url: arguments.url),
  );
}
