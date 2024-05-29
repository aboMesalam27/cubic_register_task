import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/models/branches/branches_response.dart';

part 'auth_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = Initial;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.success(dynamic response) = Success;
  const factory RegisterState.error({required String error}) = Error;
  const factory RegisterState.branchesLoaded(List<BranchesResult> branches) =
      BranchesLoaded;
}
