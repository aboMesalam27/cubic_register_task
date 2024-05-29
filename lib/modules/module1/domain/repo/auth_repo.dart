import 'package:cubic_task/core/networking/api_result.dart';

import '../../data/models/branches/branches_response.dart';

abstract class AuthenticationRepo {
  Future<ApiResult<BranchesResponse>> getBranches();
}
