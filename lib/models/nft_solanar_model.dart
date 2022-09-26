class NftSolana {
  String? id;
  String? mintAddress;
  String? sellerAddress;
  String? tokenAccount;
  int? price;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? v;

  NftSolana(
      {this.id,
      this.mintAddress,
      this.sellerAddress,
      this.tokenAccount,
      this.price,
      this.name,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.v});

  NftSolana.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["mintAddress"] is String) mintAddress = json["mintAddress"];
    if (json["sellerAddress"] is String) sellerAddress = json["sellerAddress"];
    if (json["tokenAccount"] is String) tokenAccount = json["tokenAccount"];
    if (json["price"] is int) price = json["price"];
    if (json["name"] is String) name = json["name"];
    if (json["image"] is String) image = json["image"];
    if (json["createdAt"] is String) createdAt = json["createdAt"];
    if (json["updatedAt"] is String) updatedAt = json["updatedAt"];
    if (json["__v"] is int) v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = id;
    data["mintAddress"] = mintAddress;
    data["sellerAddress"] = sellerAddress;
    data["tokenAccount"] = tokenAccount;
    data["price"] = price;
    data["name"] = name;
    data["image"] = image;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    return data;
  }
}
