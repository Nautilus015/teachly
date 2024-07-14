class UserModel {
  String? grade;
  String? lastName;
  String? firstName;
  String? email;
  String? city;
  String? phoneNumber;
  String? guardiansPhoneNumber;

  UserModel(
      {this.grade,
        this.lastName,
        this.firstName,
        this.email,
        this.city,
        this.phoneNumber,
        this.guardiansPhoneNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    email = json['email'];
    city = json['city'];
    phoneNumber = json['phoneNumber'];
    guardiansPhoneNumber = json['guardiansPhoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grade'] = this.grade;
    data['lastName'] = this.lastName;
    data['firstName'] = this.firstName;
    data['email'] = this.email;
    data['city'] = this.city;
    data['phoneNumber'] = this.phoneNumber;
    data['guardiansPhoneNumber'] = this.guardiansPhoneNumber;
    return data;
  }
}