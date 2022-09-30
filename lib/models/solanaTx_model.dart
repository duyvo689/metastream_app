class SolanaTx {
  String? id;
  String? mintAddress;
  String? seller;
  int? price;
  String? type;
  String? transaction;
  String? createdAt;
  String? updatedAt;
  int? v;

  SolanaTx(
      {this.id,
      this.mintAddress,
      this.seller,
      this.price,
      this.type,
      this.transaction,
      this.createdAt,
      this.updatedAt,
      this.v});

  SolanaTx.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["mintAddress"] is String) mintAddress = json["mintAddress"];
    if (json["seller"] is String) seller = json["seller"];
    if (json["price"] is int) price = json["price"];
    if (json["type"] is String) type = json["type"];
    if (json["transaction"] is String) transaction = json["transaction"];
    if (json["createdAt"] is String) createdAt = json["createdAt"];
    if (json["updatedAt"] is String) updatedAt = json["updatedAt"];
    if (json["__v"] is int) v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = id;
    data["mintAddress"] = mintAddress;
    data["seller"] = seller;
    data["price"] = price;
    data["type"] = type;
    data["transaction"] = transaction;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    return data;
  }
}
