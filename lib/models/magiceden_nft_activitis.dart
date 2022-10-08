class MagicEdenNftActivities {
  String? signature;
  String? type;
  String? source;
  String? tokenMint;
  String? collectionSymbol;
  int? slot;
  int? blockTime;
  String? buyer;
  String? buyerReferral;
  dynamic seller;
  String? sellerReferral;
  int? price;

  MagicEdenNftActivities(
      {this.signature,
      this.type,
      this.source,
      this.tokenMint,
      this.collectionSymbol,
      this.slot,
      this.blockTime,
      this.buyer,
      this.buyerReferral,
      this.seller,
      this.sellerReferral,
      this.price});

  MagicEdenNftActivities.fromJson(Map<String, dynamic> json) {
    if (json["signature"] is String) {
      signature = json["signature"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["source"] is String) {
      source = json["source"];
    }
    if (json["tokenMint"] is String) {
      tokenMint = json["tokenMint"];
    }
    if (json["collectionSymbol"] is String) {
      collectionSymbol = json["collectionSymbol"];
    }
    if (json["slot"] is int) {
      slot = json["slot"];
    }
    if (json["blockTime"] is int) {
      blockTime = json["blockTime"];
    }
    if (json["buyer"] is String) {
      buyer = json["buyer"];
    }
    if (json["buyerReferral"] is String) {
      buyerReferral = json["buyerReferral"];
    }
    seller = json["seller"];
    if (json["sellerReferral"] is String) {
      sellerReferral = json["sellerReferral"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["signature"] = signature;
    data["type"] = type;
    data["source"] = source;
    data["tokenMint"] = tokenMint;
    data["collectionSymbol"] = collectionSymbol;
    data["slot"] = slot;
    data["blockTime"] = blockTime;
    data["buyer"] = buyer;
    data["buyerReferral"] = buyerReferral;
    data["seller"] = seller;
    data["sellerReferral"] = sellerReferral;
    data["price"] = price;
    return data;
  }
}
