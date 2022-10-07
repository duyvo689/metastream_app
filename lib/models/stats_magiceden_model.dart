class StatsMagicEden {
  Magic? magic;
  Data? data;

  StatsMagicEden({this.magic, this.data});

  StatsMagicEden.fromJson(Map<String, dynamic> json) {
    if (json["magic"] is Map) {
      magic = json["magic"] == null ? null : Magic.fromJson(json["magic"]);
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (magic != null) {
      data["magic"] = magic?.toJson();
    }
    if (this.data != null) {
      data["data"] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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

class Magic {
  String? symbol;
  int? floorPrice;
  int? listedCount;
  double? avgPrice24Hr;
  double? volumeAll;

  Magic(
      {this.symbol,
      this.floorPrice,
      this.listedCount,
      this.avgPrice24Hr,
      this.volumeAll});

  Magic.fromJson(Map<String, dynamic> json) {
    if (json["symbol"] is String) {
      symbol = json["symbol"];
    }
    if (json["floorPrice"] is int) {
      floorPrice = json["floorPrice"];
    }
    if (json["listedCount"] is int) {
      listedCount = json["listedCount"];
    }
    if (json["avgPrice24hr"] is double) {
      avgPrice24Hr = json["avgPrice24hr"];
    }
    if (json["volumeAll"] is double) {
      volumeAll = json["volumeAll"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["symbol"] = symbol;
    data["floorPrice"] = floorPrice;
    data["listedCount"] = listedCount;
    data["avgPrice24hr"] = avgPrice24Hr;
    data["volumeAll"] = volumeAll;
    return data;
  }
}
