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
    if (json["_id"] is String) this.id = json["_id"];
    if (json["mintAddress"] is String) this.mintAddress = json["mintAddress"];
    if (json["seller"] is String) this.seller = json["seller"];
    if (json["price"] is int) this.price = json["price"];
    if (json["type"] is String) this.type = json["type"];
    if (json["transaction"] is String) this.transaction = json["transaction"];
    if (json["createdAt"] is String) this.createdAt = json["createdAt"];
    if (json["updatedAt"] is String) this.updatedAt = json["updatedAt"];
    if (json["__v"] is int) this.v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    data["mintAddress"] = this.mintAddress;
    data["seller"] = this.seller;
    data["price"] = this.price;
    data["type"] = this.type;
    data["transaction"] = this.transaction;
    data["createdAt"] = this.createdAt;
    data["updatedAt"] = this.updatedAt;
    data["__v"] = this.v;
    return data;
  }
}
