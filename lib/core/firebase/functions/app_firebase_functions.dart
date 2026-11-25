import 'package:cloud_functions/cloud_functions.dart';

abstract final class AppFirebaseFunctions {
  static FirebaseFunctions get instance => FirebaseFunctions.instance;
}
