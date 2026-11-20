import 'package:bta3_physia/core/helper/grade_name_helper.dart';

enum GradeOption {
  first('secondary_1'),
  second('secondary_2'),
  third('secondary_3');

  const GradeOption(this.id);

  final String id;

  String get label => GradeNameHelper.getGradeName(id);
}
