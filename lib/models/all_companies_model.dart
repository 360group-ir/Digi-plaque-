class Business {
  final String slug;
  final String name;
  final String businessField;
  final String website;
  final String logo;
  final String ceoFirstName;
  final String ceoLastName;
  // final String? ceoPhone;

  Business({
    required this.slug,
    required this.name,
    required this.businessField,
    required this.website,
    required this.logo,
    required this.ceoFirstName,
    required this.ceoLastName,
    //  this.ceoPhone,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      slug: json['slug'],
      name: json['name'],
      businessField: json['business_field'],
      website: json['website'],
      logo: json['logo'],
      ceoFirstName: json['ceo']['first_name'],
      ceoLastName: json['ceo']['last_name'],
      // ceoPhone: json['ceo']['phone'],
    );
  }
}
