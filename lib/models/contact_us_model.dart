// Dart model for the API
class ContactUsModel {
  final String email;
  final String mobile;
  final String content;

  ContactUsModel({
    required this.email,
    required this.mobile,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'mobile': mobile,
      'content': content,
    };
  }

  factory ContactUsModel.fromJson(Map<String, dynamic> json) {
    return ContactUsModel(
      email: json['email'],
      mobile: json['mobile'],
      content: json['content'],
    );
  }
}

