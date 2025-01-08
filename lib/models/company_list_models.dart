class CompanyListModel {
  final String message;
  final bool status;
  final CompanyData data;

  CompanyListModel({required this.message, required this.status, required this.data});

  factory CompanyListModel.fromJson(Map<String, dynamic> json) {
    return CompanyListModel(
      message: json['message'],
      status: json['status'],
      data: CompanyData.fromJson(json['data']),
    );
  }
}

class CompanyData {
  final List<Business> data;
  final Meta meta;

  CompanyData({required this.data, required this.meta});

  factory CompanyData.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Business> businessList = list.map((i) => Business.fromJson(i)).toList();

    return CompanyData(
      data: businessList,
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class Business {
  final String slug;
  final String name;
  final String businessField;
  final String website;
  final String? logo;
  final CEO ceo;

  Business({
    required this.slug,
    required this.name,
    required this.businessField,
    required this.website,
     this.logo,
    required this.ceo,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      slug: json['slug'],
      name: json['name'],
      businessField: json['business_field'],
      website: json['website'],
      logo: json['logo'],
      ceo: CEO.fromJson(json['ceo']),
    );
  }
}

class CEO {
  final String firstName;
  final String lastName;
  final String phone;

  CEO({required this.firstName, required this.lastName, required this.phone});

  factory CEO.fromJson(Map<String, dynamic> json) {
    return CEO(
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
    );
  }
}

class Meta {
  final int total;

  Meta({required this.total});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json['total'],
    );
  }
}
