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
    if (json["isActive"] is bool) this.isActive = json["isActive"];
    if (json["nfts_id"] is List) this.nftsId = json["nfts_id"] ?? [];
    if (json["_id"] is String) this.id = json["_id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["time"] is int) this.time = json["time"];
    if (json["activityId"] is int) this.activityId = json["activityId"];
    if (json["description"] is String) this.description = json["description"];
    if (json["coverImage"] is String) this.coverImage = json["coverImage"];
    if (json["status"] is bool) this.status = json["status"];
    if (json["isLive"] is bool) this.isLive = json["isLive"];
    if (json["createdAt"] is String) this.createdAt = json["createdAt"];
    if (json["updatedAt"] is String) this.updatedAt = json["updatedAt"];
    if (json["__v"] is int) this.v = json["__v"];
    if (json["playBackId"] is String) this.playBackId = json["playBackId"];
    if (json["game_id"] is Map)
      this.gameId =
          json["game_id"] == null ? null : GameId.fromJson(json["game_id"]);
    if (json["tags_id"] is List) this.tagsId = json["tags_id"] ?? [];
    if (json["user_id"] is Map)
      this.userId =
          json["user_id"] == null ? null : UserId.fromJson(json["user_id"]);
    if (json["slug"] is String) this.slug = json["slug"];
    if (json["play_url"] is String) this.playUrl = json["play_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["isActive"] = this.isActive;
    if (this.nftsId != null) data["nfts_id"] = this.nftsId;
    data["_id"] = this.id;
    data["name"] = this.name;
    data["time"] = this.time;
    data["activityId"] = this.activityId;
    data["description"] = this.description;
    data["coverImage"] = this.coverImage;
    data["status"] = this.status;
    data["isLive"] = this.isLive;
    data["createdAt"] = this.createdAt;
    data["updatedAt"] = this.updatedAt;
    data["__v"] = this.v;
    data["playBackId"] = this.playBackId;
    if (this.gameId != null) data["game_id"] = this.gameId?.toJson();
    if (this.tagsId != null) data["tags_id"] = this.tagsId;
    if (this.userId != null) data["user_id"] = this.userId?.toJson();
    data["slug"] = this.slug;
    data["play_url"] = this.playUrl;
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
    if (json["_id"] is String) this.id = json["_id"];
    if (json["follow"] is int) this.follow = json["follow"];
    if (json["descriptions"] is String)
      this.descriptions = json["descriptions"];
    if (json["firstName"] is String) this.firstName = json["firstName"];
    if (json["lastName"] is String) this.lastName = json["lastName"];
    if (json["avatar"] is String) this.avatar = json["avatar"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    data["follow"] = this.follow;
    data["descriptions"] = this.descriptions;
    data["firstName"] = this.firstName;
    data["lastName"] = this.lastName;
    data["avatar"] = this.avatar;
    return data;
  }
}

class GameId {
  String? id;
  String? name;

  GameId({this.id, this.name});

  GameId.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) this.id = json["_id"];
    if (json["name"] is String) this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    data["name"] = this.name;
    return data;
  }
}
