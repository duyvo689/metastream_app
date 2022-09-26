class Video {
  bool? isActive;
  List<dynamic>? nftsId;
  String? id;
  String? name;
  int? time;
  int? activityId;
  String? description;
  String? coverImage;
  bool? status;
  bool? isLive;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? playBackId;
  GameId? gameId;
  List<dynamic>? tagsId;
  UserId? userId;
  String? slug;
  String? playUrl;

  Video(
      {this.isActive,
      this.nftsId,
      this.id,
      this.name,
      this.time,
      this.activityId,
      this.description,
      this.coverImage,
      this.status,
      this.isLive,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.playBackId,
      this.gameId,
      this.tagsId,
      this.userId,
      this.slug,
      this.playUrl});

  Video.fromJson(Map<String, dynamic> json) {
    if (json["isActive"] is bool) isActive = json["isActive"];
    if (json["nfts_id"] is List) nftsId = json["nfts_id"] ?? [];
    if (json["_id"] is String) id = json["_id"];
    if (json["name"] is String) name = json["name"];
    if (json["time"] is int) time = json["time"];
    if (json["activityId"] is int) activityId = json["activityId"];
    if (json["description"] is String) description = json["description"];
    if (json["coverImage"] is String) coverImage = json["coverImage"];
    if (json["status"] is bool) status = json["status"];
    if (json["isLive"] is bool) isLive = json["isLive"];
    if (json["createdAt"] is String) createdAt = json["createdAt"];
    if (json["updatedAt"] is String) updatedAt = json["updatedAt"];
    if (json["__v"] is int) v = json["__v"];
    if (json["playBackId"] is String) playBackId = json["playBackId"];
    if (json["game_id"] is Map)
      gameId =
          json["game_id"] == null ? null : GameId.fromJson(json["game_id"]);
    if (json["tags_id"] is List) tagsId = json["tags_id"] ?? [];
    if (json["user_id"] is Map)
      userId =
          json["user_id"] == null ? null : UserId.fromJson(json["user_id"]);
    if (json["slug"] is String) slug = json["slug"];
    if (json["play_url"] is String) playUrl = json["play_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["isActive"] = isActive;
    if (nftsId != null) data["nfts_id"] = nftsId;
    data["_id"] = id;
    data["name"] = name;
    data["time"] = time;
    data["activityId"] = activityId;
    data["description"] = description;
    data["coverImage"] = coverImage;
    data["status"] = status;
    data["isLive"] = isLive;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    data["playBackId"] = playBackId;
    if (gameId != null) data["game_id"] = gameId?.toJson();
    if (tagsId != null) data["tags_id"] = tagsId;
    if (userId != null) data["user_id"] = userId?.toJson();
    data["slug"] = slug;
    data["play_url"] = playUrl;
    return data;
  }
}

class UserId {
  String? id;
  int? follow;
  String? descriptions;
  String? firstName;
  String? lastName;
  String? avatar;

  UserId(
      {this.id,
      this.follow,
      this.descriptions,
      this.firstName,
      this.lastName,
      this.avatar});

  UserId.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["follow"] is int) follow = json["follow"];
    if (json["descriptions"] is String) descriptions = json["descriptions"];
    if (json["firstName"] is String) firstName = json["firstName"];
    if (json["lastName"] is String) lastName = json["lastName"];
    if (json["avatar"] is String) avatar = json["avatar"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = id;
    data["follow"] = follow;
    data["descriptions"] = descriptions;
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["avatar"] = avatar;
    return data;
  }
}

class GameId {
  String? id;
  String? name;

  GameId({this.id, this.name});

  GameId.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["name"] is String) name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = id;
    data["name"] = name;
    return data;
  }
}
