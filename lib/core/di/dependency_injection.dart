import 'package:cubic_task/modules/module1/data/repos/auth_repo_imp.dart';
import 'package:cubic_task/modules/module1/domain/repo/auth_repo.dart';
import 'package:cubic_task/modules/module1/domain/usecase/auth_uc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../modules/module1/view/screens/register/logic/cubit/auth_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<AuthenticationRepo>(
      () => AuthenticationRepoImp(getIt()));
  getIt.registerLazySingleton(
    () => AuthenticationUseCase(getIt()),
  );

  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
}
