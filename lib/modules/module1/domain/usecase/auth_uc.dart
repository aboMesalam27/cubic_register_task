import 'package:cubic_task/modules/module1/domain/repo/auth_repo.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/branches/branches_response.dart';

class AuthenticationUseCase {
  final AuthenticationRepo _authenticationRepo;

  AuthenticationUseCase(this._authenticationRepo);

  Future<ApiResult<BranchesResponse>> getBranches() async {
    return await _authenticationRepo.getBranches();
  }
}
