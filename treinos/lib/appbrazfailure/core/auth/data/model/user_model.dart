class UserModel {
  final int id;
  final String name;
  final String userName;
  final String token;
  final int userTypeId;

  UserModel(
      {required this.id,
      required this.name,
      required this.userName,
      required this.token,
      required this.userTypeId});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        userName: json["user_name"],
        token: json["token"],
        userTypeId: json["user_type_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_name": userName,
        "token": token,
        "user_type_id": userTypeId,
      };
  factory UserModel.empty() => UserModel(
        id: 0,
        name: "",
        userName: "",
        token: "",
        userTypeId: 0,
      );
}
