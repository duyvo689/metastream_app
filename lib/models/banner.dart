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
    if (json["_id"] is String) this.id = json["_id"];
    if (json["description"] is String) this.description = json["description"];
    if (json["createdAt"] is String) this.createdAt = json["createdAt"];
    if (json["updatedAt"] is String) this.updatedAt = json["updatedAt"];
    if (json["__v"] is int) this.v = json["__v"];
    if (json["order"] is int) this.order = json["order"];
    if (json["name"] is String) this.name = json["name"];
    if (json["type"] is String) this.type = json["type"];
    if (json["assetUrl"] is String) this.assetUrl = json["assetUrl"];
    if (json["isActive"] is bool) this.isActive = json["isActive"];
    if (json["game_id"] is String) this.gameId = json["game_id"];
    if (json["websiteUrl"] is String) this.websiteUrl = json["websiteUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    data["description"] = this.description;
    data["createdAt"] = this.createdAt;
    data["updatedAt"] = this.updatedAt;
    data["__v"] = this.v;
    data["order"] = this.order;
    data["name"] = this.name;
    data["type"] = this.type;
    data["assetUrl"] = this.assetUrl;
    data["isActive"] = this.isActive;
    data["game_id"] = this.gameId;
    data["websiteUrl"] = this.websiteUrl;
    return data;
  }
}
