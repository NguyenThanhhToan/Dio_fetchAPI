// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'districtResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictResponse _$DistrictFromJson(Map<String, dynamic> json) => DistrictResponse(
      districtId: (json['DistrictID'] as num).toInt(),
      districtName: json['DistrictName'] as String,
      provinceId: (json['ProvinceID'] as num).toInt(),
    );

Map<String, dynamic> _$DistrictToJson(DistrictResponse instance) => <String, dynamic>{
      'DistrictID': instance.districtId,
      'DistrictName': instance.districtName,
      'ProvinceID': instance.provinceId,
    };
