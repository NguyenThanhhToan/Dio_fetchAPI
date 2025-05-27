class Province {
  final int provinceID;
  final String provinceName;
  final int countryID;
  final String? code;
  final List<String>? nameExtension;
  final int? isEnable;
  final int? regionID;
  final int? regionCPN;
  final int? updatedBy;
  final String? createdAt;
  final String? updatedAt;
  final bool? canUpdateCOD;
  final int? status;
  final int? updatedEmployee;
  final String? updatedSource;
  final String? updatedDate;
  final String? provinceEncode;
  final int? areaID;
  final String? createdIP;
  final int? createdEmployee;
  final String? createdSource;
  final String? createdDate;
  final String? updatedIP;

  Province({
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

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      provinceID: json['ProvinceID'],
      provinceName: json['ProvinceName'],
      countryID: json['CountryID'],
      code: json['Code'],
      nameExtension: (json['NameExtension'] as List?)?.map((e) => e.toString()).toList(),
      isEnable: json['IsEnable'],
      regionID: json['RegionID'],
      regionCPN: json['RegionCPN'],
      updatedBy: json['UpdatedBy'],
      createdAt: json['CreatedAt'],
      updatedAt: json['UpdatedAt'],
      canUpdateCOD: json['CanUpdateCOD'],
      status: json['Status'],
      updatedEmployee: json['UpdatedEmployee'],
      updatedSource: json['UpdatedSource'],
      updatedDate: json['UpdatedDate'],
      provinceEncode: json['ProvinceEncode'],
      areaID: json['AreaID'],
      createdIP: json['CreatedIP'],
      createdEmployee: json['CreatedEmployee'],
      createdSource: json['CreatedSource'],
      createdDate: json['CreatedDate'],
      updatedIP: json['UpdatedIP'],
    );
  }
}
