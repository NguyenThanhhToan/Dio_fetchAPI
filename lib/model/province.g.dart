// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Province _$ProvinceFromJson(Map<String, dynamic> json) => Province(
      provinceID: (json['ProvinceID'] as num).toInt(),
      provinceName: json['ProvinceName'] as String,
      countryID: (json['CountryID'] as num).toInt(),
      code: json['Code'] as String?,
      nameExtension: (json['NameExtension'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isEnable: (json['IsEnable'] as num?)?.toInt(),
      regionID: (json['RegionID'] as num?)?.toInt(),
      regionCPN: (json['RegionCPN'] as num?)?.toInt(),
      updatedBy: (json['UpdatedBy'] as num?)?.toInt(),
      createdAt: json['CreatedAt'] as String?,
      updatedAt: json['UpdatedAt'] as String?,
      canUpdateCOD: json['CanUpdateCOD'] as bool?,
      status: (json['Status'] as num?)?.toInt(),
      updatedEmployee: (json['UpdatedEmployee'] as num?)?.toInt(),
      updatedSource: json['UpdatedSource'] as String?,
      updatedDate: json['UpdatedDate'] as String?,
      provinceEncode: json['ProvinceEncode'] as String?,
      areaID: (json['AreaID'] as num?)?.toInt(),
      createdIP: json['CreatedIP'] as String?,
      createdEmployee: (json['CreatedEmployee'] as num?)?.toInt(),
      createdSource: json['CreatedSource'] as String?,
      createdDate: json['CreatedDate'] as String?,
      updatedIP: json['UpdatedIP'] as String?,
    );

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'ProvinceID': instance.provinceID,
      'ProvinceName': instance.provinceName,
      'CountryID': instance.countryID,
      'Code': instance.code,
      'NameExtension': instance.nameExtension,
      'IsEnable': instance.isEnable,
      'RegionID': instance.regionID,
      'RegionCPN': instance.regionCPN,
      'UpdatedBy': instance.updatedBy,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'CanUpdateCOD': instance.canUpdateCOD,
      'Status': instance.status,
      'UpdatedEmployee': instance.updatedEmployee,
      'UpdatedSource': instance.updatedSource,
      'UpdatedDate': instance.updatedDate,
      'ProvinceEncode': instance.provinceEncode,
      'AreaID': instance.areaID,
      'CreatedIP': instance.createdIP,
      'CreatedEmployee': instance.createdEmployee,
      'CreatedSource': instance.createdSource,
      'CreatedDate': instance.createdDate,
      'UpdatedIP': instance.updatedIP,
    };
