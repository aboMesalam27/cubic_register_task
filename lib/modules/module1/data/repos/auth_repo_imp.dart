import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../domain/repo/auth_repo.dart';
import '../models/branches/branches_response.dart';

class AuthenticationRepoImp implements AuthenticationRepo {
  final ApiService _apiService;
  AuthenticationRepoImp(this._apiService);
  @override
  Future<ApiResult<BranchesResponse>> getBranches() async {
    try {
      final response = await _apiService.getBranches();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
