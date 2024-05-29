import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../modules/module1/data/models/branches/branches_response.dart';
import 'api_constants.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


  @GET('http://81.29.111.142:8085/WRBOBSB/api/getBranches')
  Future<BranchesResponse> getBranches();
}
