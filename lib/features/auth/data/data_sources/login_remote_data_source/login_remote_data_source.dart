import 'package:bta3_physia/features/auth/data/models/login_request_model.dart';

abstract interface class LoginRemoteDataSource {
  Future<void> login(LoginRequestModel request);
}
