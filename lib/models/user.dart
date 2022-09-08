class User {
  StreamKey? streamKey;
  List<dynamic>? nftsId;
  String? numberStop;
  bool? isActive;
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? addressWallet;
  String? descriptions;
  String? avatar;
  int? follow;
  List<dynamic>? followGame;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? coverImage;
  String? userName;
  String? idMux;
  String? idPlayBack;
  String? activityId;
  String? title;
  int? gems;
  List<String>? follower;
  String? gameId;

  User(
      {this.streamKey,
      this.nftsId,
      this.numberStop,
      this.isActive,
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.addressWallet,
      this.descriptions,
      this.avatar,
      this.follow,
      this.followGame,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.coverImage,
      this.userName,
      this.idMux,
      this.idPlayBack,
      this.activityId,
      this.title,
      this.gems,
      this.follower,
      this.gameId});

  User.fromJson(Map<String, dynamic> json) {
    if (json["streamKey"] is Map)
      this.streamKey = json["streamKey"] == null
          ? null
          : StreamKey.fromJson(json["streamKey"]);
    if (json["nfts_id"] is List) this.nftsId = json["nfts_id"] ?? [];
    if (json["numberStop"] is String) this.numberStop = json["numberStop"];
    if (json["isActive"] is bool) this.isActive = json["isActive"];
    if (json["_id"] is String) this.id = json["_id"];
    if (json["firstName"] is String) this.firstName = json["firstName"];
    if (json["lastName"] is String) this.lastName = json["lastName"];
    if (json["email"] is String) this.email = json["email"];
    if (json["addressWallet"] is String)
      this.addressWallet = json["addressWallet"];
    if (json["descriptions"] is String)
      this.descriptions = json["descriptions"];
    if (json["avatar"] is String) this.avatar = json["avatar"];
    if (json["follow"] is int) this.follow = json["follow"];
    if (json["followGame"] is List) this.followGame = json["followGame"] ?? [];
    if (json["createdAt"] is String) this.createdAt = json["createdAt"];
    if (json["updatedAt"] is String) this.updatedAt = json["updatedAt"];
    if (json["__v"] is int) this.v = json["__v"];
    if (json["coverImage"] is String) this.coverImage = json["coverImage"];
    if (json["userName"] is String) this.userName = json["userName"];
    if (json["idMux"] is String) this.idMux = json["idMux"];
    if (json["idPlayBack"] is String) this.idPlayBack = json["idPlayBack"];
    if (json["activityId"] is String) this.activityId = json["activityId"];
    if (json["title"] is String) this.title = json["title"];
    if (json["gems"] is int) this.gems = json["gems"];
    if (json["follower"] is List)
      this.follower =
          json["follower"] == null ? null : List<String>.from(json["follower"]);
    if (json["game_id"] is String) this.gameId = json["game_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.streamKey != null) data["streamKey"] = this.streamKey?.toJson();
    if (this.nftsId != null) data["nfts_id"] = this.nftsId;
    data["numberStop"] = this.numberStop;
    data["isActive"] = this.isActive;
    data["_id"] = this.id;
    data["firstName"] = this.firstName;
    data["lastName"] = this.lastName;
    data["email"] = this.email;
    data["addressWallet"] = this.addressWallet;
    data["descriptions"] = this.descriptions;
    data["avatar"] = this.avatar;
    data["follow"] = this.follow;
    if (this.followGame != null) data["followGame"] = this.followGame;
    data["createdAt"] = this.createdAt;
    data["updatedAt"] = this.updatedAt;
    data["__v"] = this.v;
    data["coverImage"] = this.coverImage;
    data["userName"] = this.userName;
    data["idMux"] = this.idMux;
    data["idPlayBack"] = this.idPlayBack;
    data["activityId"] = this.activityId;
    data["title"] = this.title;
    data["gems"] = this.gems;
    if (this.follower != null) data["follower"] = this.follower;
    data["game_id"] = this.gameId;
    return data;
  }
}

class StreamKey {
  String? pushPath;
  String? streamingCode;

  StreamKey({this.pushPath, this.streamingCode});

  StreamKey.fromJson(Map<String, dynamic> json) {
    if (json["PushPath"] is String) this.pushPath = json["PushPath"];
    if (json["StreamingCode"] is String)
      this.streamingCode = json["StreamingCode"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["PushPath"] = this.pushPath;
    data["StreamingCode"] = this.streamingCode;
    return data;
  }
}
