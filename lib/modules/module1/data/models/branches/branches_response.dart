import 'package:json_annotation/json_annotation.dart';
part 'branches_response.g.dart';

@JsonSerializable()
class BranchesResponse {
  final List<BranchesResult> result;
  BranchesResponse({
    required this.result,
  });
  factory BranchesResponse.fromJson(Map<String, dynamic> json) =>
      _$BranchesResponseFromJson(json);
}

@JsonSerializable()
class BranchesResult {
  final String id;
  final String branchcode;
  final String branchname;
  final String branchcity;
  final String branchlat;
  final String branchlng;
  final int branchstatus;

  BranchesResult({
    required this.id,
    required this.branchcode,
    required this.branchname,
    required this.branchcity,
    required this.branchlat,
    required this.branchlng,
    required this.branchstatus,
  });

  factory BranchesResult.fromJson(Map<String, dynamic> json) =>
      _$BranchesResultFromJson(json);
}
