class LiveStream {
  PrimaryPlatform? primaryPlatform;
  StreamKey? streamKey;
  String? id;
  UserId? userId;
  bool? isVerify;
  bool? isBan;
  bool? isActive;
  List<dynamic>? otherPlatform;
  GameId? gameId;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? activityId;
  int? status;
  bool? streamWithProfileGame;
  GameStream? gameStream;

  LiveStream(
      {this.primaryPlatform,
      this.streamKey,
      this.id,
      this.userId,
      this.isVerify,
      this.isBan,
      this.isActive,
      this.otherPlatform,
      this.gameId,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.activityId,
      this.status,
      this.streamWithProfileGame,
      this.gameStream});

  LiveStream.fromJson(Map<String, dynamic> json) {
    if (json["primaryPlatform"] is Map)
      this.primaryPlatform = json["primaryPlatform"] == null
          ? null
          : PrimaryPlatform.fromJson(json["primaryPlatform"]);
    if (json["streamKey"] is Map)
      this.streamKey = json["streamKey"] == null
          ? null
          : StreamKey.fromJson(json["streamKey"]);
    if (json["_id"] is String) this.id = json["_id"];
    if (json["user_id"] is Map)
      this.userId =
          json["user_id"] == null ? null : UserId.fromJson(json["user_id"]);
    if (json["isVerify"] is bool) this.isVerify = json["isVerify"];
    if (json["isBan"] is bool) this.isBan = json["isBan"];
    if (json["isActive"] is bool) this.isActive = json["isActive"];
    if (json["otherPlatform"] is List)
      this.otherPlatform = json["otherPlatform"] ?? [];
    if (json["game_id"] is Map)
      this.gameId =
          json["game_id"] == null ? null : GameId.fromJson(json["game_id"]);
    if (json["createdAt"] is String) this.createdAt = json["createdAt"];
    if (json["updatedAt"] is String) this.updatedAt = json["updatedAt"];
    if (json["__v"] is int) this.v = json["__v"];
    if (json["activityId"] is String) this.activityId = json["activityId"];
    if (json["status"] is int) this.status = json["status"];
    if (json["streamWithProfileGame"] is bool)
      this.streamWithProfileGame = json["streamWithProfileGame"];
    if (json["gameStream"] is Map)
      this.gameStream = json["gameStream"] == null
          ? null
          : GameStream.fromJson(json["gameStream"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.primaryPlatform != null)
      data["primaryPlatform"] = this.primaryPlatform?.toJson();
    if (this.streamKey != null) data["streamKey"] = this.streamKey?.toJson();
    data["_id"] = this.id;
    if (this.userId != null) data["user_id"] = this.userId?.toJson();
    data["isVerify"] = this.isVerify;
    data["isBan"] = this.isBan;
    data["isActive"] = this.isActive;
    if (this.otherPlatform != null) data["otherPlatform"] = this.otherPlatform;
    if (this.gameId != null) data["game_id"] = this.gameId?.toJson();
    data["createdAt"] = this.createdAt;
    data["updatedAt"] = this.updatedAt;
    data["__v"] = this.v;
    data["activityId"] = this.activityId;
    data["status"] = this.status;
    data["streamWithProfileGame"] = this.streamWithProfileGame;
    if (this.gameStream != null) data["gameStream"] = this.gameStream?.toJson();
    return data;
  }
}

class GameStream {
  String? id;
  String? name;
  String? logo;
  String? featureImg;
  String? slug;

  GameStream({this.id, this.name, this.logo, this.featureImg, this.slug});

  GameStream.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) this.id = json["_id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["logo"] is String) this.logo = json["logo"];
    if (json["featureImg"] is String) this.featureImg = json["featureImg"];
    if (json["slug"] is String) this.slug = json["slug"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    data["name"] = this.name;
    data["logo"] = this.logo;
    data["featureImg"] = this.featureImg;
    data["slug"] = this.slug;
    return data;
  }
}

class GameId {
  String? id;
  String? name;
  String? slug;

  GameId({this.id, this.name, this.slug});

  GameId.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) this.id = json["_id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["slug"] is String) this.slug = json["slug"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    data["name"] = this.name;
    data["slug"] = this.slug;
    return data;
  }
}

class UserId {
  String? id;
  String? descriptions;
  String? firstName;
  String? lastName;
  String? userName;
  String? avatar;
  String? title;
  String? activityId;
  List<TagsId>? tagsId;

  UserId(
      {this.id,
      this.descriptions,
      this.firstName,
      this.lastName,
      this.userName,
      this.avatar,
      this.title,
      this.activityId,
      this.tagsId});

  UserId.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) this.id = json["_id"];
    if (json["descriptions"] is String)
      this.descriptions = json["descriptions"];
    if (json["firstName"] is String) this.firstName = json["firstName"];
    if (json["lastName"] is String) this.lastName = json["lastName"];
    if (json["userName"] is String) this.userName = json["userName"];
    if (json["avatar"] is String) this.avatar = json["avatar"];
    if (json["title"] is String) this.title = json["title"];
    if (json["activityId"] is String) this.activityId = json["activityId"];
    if (json["tags_id"] is List)
      this.tagsId = json["tags_id"] == null
          ? null
          : (json["tags_id"] as List).map((e) => TagsId.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    data["descriptions"] = this.descriptions;
    data["firstName"] = this.firstName;
    data["lastName"] = this.lastName;
    data["userName"] = this.userName;
    data["avatar"] = this.avatar;
    data["title"] = this.title;
    data["activityId"] = this.activityId;
    if (this.tagsId != null)
      data["tags_id"] = this.tagsId?.map((e) => e.toJson()).toList();
    return data;
  }
}

class TagsId {
  String? id;
  String? name;
  String? slug;

  TagsId({this.id, this.name, this.slug});

  TagsId.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) this.id = json["_id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["slug"] is String) this.slug = json["slug"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    data["name"] = this.name;
    data["slug"] = this.slug;
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

class PrimaryPlatform {
  String? title;
  String? url;

  PrimaryPlatform({this.title, this.url});

  PrimaryPlatform.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) this.title = json["title"];
    if (json["url"] is String) this.url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = this.title;
    data["url"] = this.url;
    return data;
  }
}
