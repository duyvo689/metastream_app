class Collection {
  String? id;
  String? chain;
  String? name;
  String? symbol;
  String? gameId;
  String? image;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  Collection(
      {this.id,
      this.chain,
      this.name,
      this.symbol,
      this.gameId,
      this.image,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.v});

  Collection.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["chain"] is String) {
      chain = json["chain"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["symbol"] is String) {
      symbol = json["symbol"];
    }
    if (json["game_id"] is String) {
      gameId = json["game_id"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["isActive"] is bool) {
      isActive = json["isActive"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["chain"] = chain;
    data["name"] = name;
    data["symbol"] = symbol;
    data["game_id"] = gameId;
    data["image"] = image;
    data["isActive"] = isActive;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    return data;
  }
}
