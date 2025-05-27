class District {
  final int districtId;
  final String districtName;
  final int provinceId;

  District({
    required this.districtId,
    required this.districtName,
    required this.provinceId,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      districtId: json['DistrictID'] as int,
      districtName: json['DistrictName'] as String,
      provinceId: json['ProvinceID'] as int,
    );
  }
}