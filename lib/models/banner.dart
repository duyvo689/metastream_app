class Banner {
  String? id;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? order;
  String? name;
  String? type;
  String? assetUrl;
  bool? isActive;
  String? gameId;
  String? websiteUrl;

  Banner(
      {this.id,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.order,
      this.name,
      this.type,
      this.assetUrl,
      this.isActive,
      this.gameId,
      this.websiteUrl});

  Banner.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["description"] is String) description = json["description"];
    if (json["createdAt"] is String) createdAt = json["createdAt"];
    if (json["updatedAt"] is String) updatedAt = json["updatedAt"];
    if (json["__v"] is int) v = json["__v"];
    if (json["order"] is int) order = json["order"];
    if (json["name"] is String) name = json["name"];
    if (json["type"] is String) type = json["type"];
    if (json["assetUrl"] is String) assetUrl = json["assetUrl"];
    if (json["isActive"] is bool) isActive = json["isActive"];
    if (json["game_id"] is String) gameId = json["game_id"];
    if (json["websiteUrl"] is String) websiteUrl = json["websiteUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = id;
    data["description"] = description;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    data["order"] = order;
    data["name"] = name;
    data["type"] = type;
    data["assetUrl"] = assetUrl;
    data["isActive"] = isActive;
    data["game_id"] = gameId;
    data["websiteUrl"] = websiteUrl;
    return data;
  }
}
