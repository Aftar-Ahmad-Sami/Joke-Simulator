class UserInfoModel {
  late String? username;
  late String? email;
  late String? phoneNumber;
  late String? password;
  late String? gender;
  late String? bio;

  UserInfoModel(
      {required this.username,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.gender,
      required this.bio});
  UserInfoModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phoneNumber = json['number'];
    password = json['password'];
    gender = json['gender'];
    bio = json['bio'];
  }
}
