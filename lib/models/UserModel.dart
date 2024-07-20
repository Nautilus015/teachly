class UserModel {
  String? circleAvatarImage;
  String? city;
  String? email;
  String? firstName;
  String? grade;
  String? guardiansPhoneNumber;
  String? lastMessage;
  String? lastName;
  String? phoneNumber;
  String? uid;

  UserModel(
      {this.circleAvatarImage,
        this.city,
        this.email,
        this.firstName,
        this.grade,
        this.guardiansPhoneNumber,
        this.lastMessage,
        this.lastName,
        this.phoneNumber,
        this.uid});

  UserModel.fromJson(Map<String, dynamic> json) {
    circleAvatarImage = json['circleAvatarImage'];
    city = json['city'];
    email = json['email'];
    firstName = json['firstName'];
    grade = json['grade'];
    guardiansPhoneNumber = json['guardiansPhoneNumber'];
    lastMessage = json['lastMessage'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['circleAvatarImage'] = this.circleAvatarImage;
    data['city'] = this.city;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['grade'] = this.grade;
    data['guardiansPhoneNumber'] = this.guardiansPhoneNumber;
    data['lastMessage'] = this.lastMessage;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['uid'] = this.uid;
    return data;
  }
}