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
      streamKey = json["streamKey"] == null
          ? null
          : StreamKey.fromJson(json["streamKey"]);
    if (json["nfts_id"] is List) nftsId = json["nfts_id"] ?? [];
    if (json["numberStop"] is String) numberStop = json["numberStop"];
    if (json["isActive"] is bool) isActive = json["isActive"];
    if (json["_id"] is String) id = json["_id"];
    if (json["firstName"] is String) firstName = json["firstName"];
    if (json["lastName"] is String) lastName = json["lastName"];
    if (json["email"] is String) email = json["email"];
    if (json["addressWallet"] is String) addressWallet = json["addressWallet"];
    if (json["descriptions"] is String) descriptions = json["descriptions"];
    if (json["avatar"] is String) avatar = json["avatar"];
    if (json["follow"] is int) follow = json["follow"];
    if (json["followGame"] is List) followGame = json["followGame"] ?? [];
    if (json["createdAt"] is String) createdAt = json["createdAt"];
    if (json["updatedAt"] is String) updatedAt = json["updatedAt"];
    if (json["__v"] is int) v = json["__v"];
    if (json["coverImage"] is String) coverImage = json["coverImage"];
    if (json["userName"] is String) userName = json["userName"];
    if (json["idMux"] is String) idMux = json["idMux"];
    if (json["idPlayBack"] is String) idPlayBack = json["idPlayBack"];
    if (json["activityId"] is String) activityId = json["activityId"];
    if (json["title"] is String) title = json["title"];
    if (json["gems"] is int) gems = json["gems"];
    if (json["follower"] is List)
      follower =
          json["follower"] == null ? null : List<String>.from(json["follower"]);
    if (json["game_id"] is String) gameId = json["game_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (streamKey != null) data["streamKey"] = streamKey?.toJson();
    if (nftsId != null) data["nfts_id"] = nftsId;
    data["numberStop"] = numberStop;
    data["isActive"] = isActive;
    data["_id"] = id;
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["email"] = email;
    data["addressWallet"] = addressWallet;
    data["descriptions"] = descriptions;
    data["avatar"] = avatar;
    data["follow"] = follow;
    if (followGame != null) data["followGame"] = followGame;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    data["coverImage"] = coverImage;
    data["userName"] = userName;
    data["idMux"] = idMux;
    data["idPlayBack"] = idPlayBack;
    data["activityId"] = activityId;
    data["title"] = title;
    data["gems"] = gems;
    if (follower != null) data["follower"] = follower;
    data["game_id"] = gameId;
    return data;
  }
}

class StreamKey {
  String? pushPath;
  String? streamingCode;

  StreamKey({this.pushPath, this.streamingCode});

  StreamKey.fromJson(Map<String, dynamic> json) {
    if (json["PushPath"] is String) pushPath = json["PushPath"];
    if (json["StreamingCode"] is String) streamingCode = json["StreamingCode"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["PushPath"] = pushPath;
    data["StreamingCode"] = streamingCode;
    return data;
  }
}
