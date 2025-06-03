import 'package:json_annotation/json_annotation.dart';

part 'districtResponse.g.dart';

@JsonSerializable()
class DistrictResponse {
  @JsonKey(name: 'DistrictID')
  final int districtId;

  @JsonKey(name: 'DistrictName')
  final String districtName;

  @JsonKey(name: 'ProvinceID')
  final int provinceId;

  DistrictResponse({
    required this.districtId,
    required this.districtName,
    required this.provinceId,
  });

  factory DistrictResponse.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}
