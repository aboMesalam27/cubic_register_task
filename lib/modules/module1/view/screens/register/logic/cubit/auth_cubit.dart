import 'package:cubic_task/modules/module1/domain/usecase/auth_uc.dart';
import 'package:flutter/material.dart';
import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthenticationUseCase _authenticationUseCase;
  RegisterCubit(this._authenticationUseCase)
      : super(const RegisterState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  void getBranches() async {
    emit(const RegisterState.loading());
    final response = await _authenticationUseCase.getBranches();
    response.when(success: (branchesResponse) {
      emit(RegisterState.branchesLoaded(branchesResponse.result));
    }, failure: (error) {
      emit(RegisterState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
