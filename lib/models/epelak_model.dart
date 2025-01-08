class CEO {
  final String firstName;
  final String lastName;
  final String phone;

  CEO({
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  factory CEO.fromJson(Map<String, dynamic> json) {
    return CEO(
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
    );
  }
}

class Complex {
  final String name;

  Complex({required this.name});

  factory Complex.fromJson(Map<String, dynamic> json) {
    return Complex(name: json['name']);
  }
}

class BusinessData {
  final String name;
   String logo = 'https://360tools.io/baam.png';
  final String description;
  final String businessField;
  final String address;
  final String? website;
  final String? email;
  final String phone;
  final String building;
  final String floor;
  final String block;
  final String unit;
  final List<String> workingHours;
  final CEO ceo;
  final Complex complex;

  BusinessData({
    required this.name,
     required this.logo,
    required this.description,
    required this.businessField,
    required this.address,
    this.website,
    this.email,
    required this.phone,
    required this.building,
    required this.floor,
    required this.block,
    required this.unit,
    required this.workingHours,
    required this.ceo,
    required this.complex,
  });

  factory BusinessData.fromJson(Map<String, dynamic> json) {
    return BusinessData(
      name: json['name'],
      logo: json['logo'],
      description: json['description'],
      businessField: json['business_field'],
      address: json['address'],
      website: json['website'],
      email: json['email'],
      phone: json['phone'],
      building: json['building'],
      floor: json['floor'],
      block: json['block'],
      unit: json['unit'],
      workingHours: List<String>.from(json['working_hours']),
      ceo: CEO.fromJson(json['ceo']),
      complex: Complex.fromJson(json['complex']),
    );
  }
}
