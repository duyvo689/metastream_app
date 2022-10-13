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
      // ignore: curly_braces_in_flow_control_structures
      primaryPlatform = json["primaryPlatform"] == null
          ? null
          : PrimaryPlatform.fromJson(json["primaryPlatform"]);
    if (json["streamKey"] is Map)
      // ignore: curly_braces_in_flow_control_structures
      streamKey = json["streamKey"] == null
          ? null
          : StreamKey.fromJson(json["streamKey"]);
    if (json["_id"] is String) id = json["_id"];
    if (json["user_id"] is Map)
      // ignore: curly_braces_in_flow_control_structures
      userId =
          json["user_id"] == null ? null : UserId.fromJson(json["user_id"]);
    if (json["isVerify"] is bool) isVerify = json["isVerify"];
    if (json["isBan"] is bool) isBan = json["isBan"];
    if (json["isActive"] is bool) isActive = json["isActive"];
    if (json["otherPlatform"] is List)
      // ignore: curly_braces_in_flow_control_structures
      otherPlatform = json["otherPlatform"] ?? [];
    if (json["game_id"] is Map)
      // ignore: curly_braces_in_flow_control_structures
      gameId =
          json["game_id"] == null ? null : GameId.fromJson(json["game_id"]);
    if (json["createdAt"] is String) createdAt = json["createdAt"];
    if (json["updatedAt"] is String) updatedAt = json["updatedAt"];
    if (json["__v"] is int) v = json["__v"];
    if (json["activityId"] is String) activityId = json["activityId"];
    if (json["status"] is int) status = json["status"];
    if (json["streamWithProfileGame"] is bool)
      // ignore: curly_braces_in_flow_control_structures
      streamWithProfileGame = json["streamWithProfileGame"];
    if (json["gameStream"] is Map)
      // ignore: curly_braces_in_flow_control_structures
      gameStream = json["gameStream"] == null
          ? null
          : GameStream.fromJson(json["gameStream"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (primaryPlatform != null)
      // ignore: curly_braces_in_flow_control_structures
      data["primaryPlatform"] = primaryPlatform?.toJson();
    if (streamKey != null) data["streamKey"] = streamKey?.toJson();
    data["_id"] = id;
    if (userId != null) data["user_id"] = userId?.toJson();
    data["isVerify"] = isVerify;
    data["isBan"] = isBan;
    data["isActive"] = isActive;
    if (otherPlatform != null) data["otherPlatform"] = otherPlatform;
    if (gameId != null) data["game_id"] = gameId?.toJson();
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    data["activityId"] = activityId;
    data["status"] = status;
    data["streamWithProfileGame"] = streamWithProfileGame;
    if (gameStream != null) data["gameStream"] = gameStream?.toJson();
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
    if (json["_id"] is String) id = json["_id"];
    if (json["name"] is String) name = json["name"];
    if (json["logo"] is String) logo = json["logo"];
    if (json["featureImg"] is String) featureImg = json["featureImg"];
    if (json["slug"] is String) slug = json["slug"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = id;
    data["name"] = name;
    data["logo"] = logo;
    data["featureImg"] = featureImg;
    data["slug"] = slug;
    return data;
  }
}

class GameId {
  String? id;
  String? name;
  String? slug;

  GameId({this.id, this.name, this.slug});

  GameId.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["name"] is String) name = json["name"];
    if (json["slug"] is String) slug = json["slug"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = id;
    data["name"] = name;
    data["slug"] = slug;
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
    if (json["_id"] is String) id = json["_id"];
    if (json["descriptions"] is String)
      // ignore: curly_braces_in_flow_control_structures
      descriptions = json["descriptions"];
    if (json["firstName"] is String) firstName = json["firstName"];
    if (json["lastName"] is String) lastName = json["lastName"];
    if (json["userName"] is String) userName = json["userName"];
    if (json["avatar"] is String) avatar = json["avatar"];
    if (json["title"] is String) title = json["title"];
    if (json["activityId"] is String) activityId = json["activityId"];
    if (json["tags_id"] is List)
      // ignore: curly_braces_in_flow_control_structures
      tagsId = json["tags_id"] == null
          ? null
          : (json["tags_id"] as List).map((e) => TagsId.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = id;
    data["descriptions"] = descriptions;
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["userName"] = userName;
    data["avatar"] = avatar;
    data["title"] = title;
    data["activityId"] = activityId;
    if (tagsId != null)
      // ignore: curly_braces_in_flow_control_structures
      data["tags_id"] = tagsId?.map((e) => e.toJson()).toList();
    return data;
  }

  containsKey(String s) {}
}

class TagsId {
  String? id;
  String? name;
  String? slug;

  TagsId({this.id, this.name, this.slug});

  TagsId.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["name"] is String) name = json["name"];
    if (json["slug"] is String) slug = json["slug"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = id;
    data["name"] = name;
    data["slug"] = slug;
    return data;
  }
}

class StreamKey {
  String? pushPath;
  String? streamingCode;

  StreamKey({this.pushPath, this.streamingCode});

  StreamKey.fromJson(Map<String, dynamic> json) {
    if (json["PushPath"] is String) pushPath = json["PushPath"];
    if (json["StreamingCode"] is String)
      // ignore: curly_braces_in_flow_control_structures
      streamingCode = json["StreamingCode"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["PushPath"] = pushPath;
    data["StreamingCode"] = streamingCode;
    return data;
  }
}

class PrimaryPlatform {
  String? title;
  String? url;

  PrimaryPlatform({this.title, this.url});

  PrimaryPlatform.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) title = json["title"];
    if (json["url"] is String) url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = title;
    data["url"] = url;
    return data;
  }
}
