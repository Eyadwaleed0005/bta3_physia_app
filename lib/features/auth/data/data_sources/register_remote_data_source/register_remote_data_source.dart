import 'package:bta3_physia/features/auth/data/models/register_request_model.dart';

abstract interface class RegisterRemoteDataSource {
  Future<void> register(RegisterRequestModel request);
}
