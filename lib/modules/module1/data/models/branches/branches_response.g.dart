// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchesResponse _$BranchesResponseFromJson(Map<String, dynamic> json) =>
    BranchesResponse(
      result: (json['result'] as List<dynamic>)
          .map((e) => BranchesResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BranchesResponseToJson(BranchesResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

BranchesResult _$BranchesResultFromJson(Map<String, dynamic> json) =>
    BranchesResult(
      id: json['id'] as String,
      branchcode: json['branchcode'] as String,
      branchname: json['branchname'] as String,
      branchcity: json['branchcity'] as String,
      branchlat: json['branchlat'] as String,
      branchlng: json['branchlng'] as String,
      branchstatus: (json['branchstatus'] as num).toInt(),
    );

Map<String, dynamic> _$BranchesResultToJson(BranchesResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branchcode': instance.branchcode,
      'branchname': instance.branchname,
      'branchcity': instance.branchcity,
      'branchlat': instance.branchlat,
      'branchlng': instance.branchlng,
      'branchstatus': instance.branchstatus,
    };
