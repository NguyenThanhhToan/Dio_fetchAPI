import 'package:json_annotation/json_annotation.dart';

part 'districtRequest.g.dart';

@JsonSerializable()
class DistrictRequest {
  @JsonKey(name: 'province_id')
  final int provinceId;

  DistrictRequest({required this.provinceId});

  factory DistrictRequest.fromJson(Map<String, dynamic> json) =>
      _$DistrictRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictRequestToJson(this);
}
