class UserModel {
  String? city;
  String? email;
  String? firstName;
  String? grade;
  String? guardiansPhoneNumber;
  String? lastMessage;
  String? lastName;
  String? circleAvatarImage;
  String? phoneNumber;

  UserModel(
      {this.city,
        this.email,
        this.firstName,
        this.grade,
        this.guardiansPhoneNumber,
        this.lastMessage,
        this.lastName,
        this.circleAvatarImage,
        this.phoneNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    email = json['email'];
    firstName = json['firstName'];
    grade = json['grade'];
    guardiansPhoneNumber = json['guardiansPhoneNumber'];
    lastMessage = json['lastMessage'];
    lastName = json['lastName'];
    circleAvatarImage = json['circleAvatarImage'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['grade'] = this.grade;
    data['guardiansPhoneNumber'] = this.guardiansPhoneNumber;
    data['lastMessage'] = this.lastMessage;
    data['lastName'] = this.lastName;
    data['circleAvatarImage'] = this.circleAvatarImage;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}