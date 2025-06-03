import 'package:json_annotation/json_annotation.dart';

part 'provinceResponse.g.dart';

@JsonSerializable()
class ProvinceResponse {
  @JsonKey(name: 'ProvinceID')
  final int provinceID;

  @JsonKey(name: 'ProvinceName')
  final String provinceName;

  @JsonKey(name: 'CountryID')
  final int countryID;

  @JsonKey(name: 'Code')
  final String? code;

  @JsonKey(name: 'NameExtension')
  final List<String>? nameExtension;

  @JsonKey(name: 'IsEnable')
  final int? isEnable;

  @JsonKey(name: 'RegionID')
  final int? regionID;

  @JsonKey(name: 'RegionCPN')
  final int? regionCPN;

  @JsonKey(name: 'UpdatedBy')
  final int? updatedBy;

  @JsonKey(name: 'CreatedAt')
  final String? createdAt;

  @JsonKey(name: 'UpdatedAt')
  final String? updatedAt;

  @JsonKey(name: 'CanUpdateCOD')
  final bool? canUpdateCOD;

  @JsonKey(name: 'Status')
  final int? status;

  @JsonKey(name: 'UpdatedEmployee')
  final int? updatedEmployee;

  @JsonKey(name: 'UpdatedSource')
  final String? updatedSource;

  @JsonKey(name: 'UpdatedDate')
  final String? updatedDate;

  @JsonKey(name: 'ProvinceEncode')
  final String? provinceEncode;

  @JsonKey(name: 'AreaID')
  final int? areaID;

  @JsonKey(name: 'CreatedIP')
  final String? createdIP;

  @JsonKey(name: 'CreatedEmployee')
  final int? createdEmployee;

  @JsonKey(name: 'CreatedSource')
  final String? createdSource;

  @JsonKey(name: 'CreatedDate')
  final String? createdDate;

  @JsonKey(name: 'UpdatedIP')
  final String? updatedIP;

  ProvinceResponse({
    required this.provinceID,
    required this.provinceName,
    required this.countryID,
    this.code,
    this.nameExtension,
    this.isEnable,
    this.regionID,
    this.regionCPN,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.canUpdateCOD,
    this.status,
    this.updatedEmployee,
    this.updatedSource,
    this.updatedDate,
    this.provinceEncode,
    this.areaID,
    this.createdIP,
    this.createdEmployee,
    this.createdSource,
    this.createdDate,
    this.updatedIP,
  });

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
