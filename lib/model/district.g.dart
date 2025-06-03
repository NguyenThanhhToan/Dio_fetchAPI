// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      districtId: (json['DistrictID'] as num).toInt(),
      districtName: json['DistrictName'] as String,
      provinceId: (json['ProvinceID'] as num).toInt(),
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'DistrictID': instance.districtId,
      'DistrictName': instance.districtName,
      'ProvinceID': instance.provinceId,
    };
