class MagicEdenNft {
  String? pdaAddress;
  String? auctionHouse;
  String? tokenAddress;
  String? tokenMint;
  String? seller;
  String? sellerReferral;
  int? tokenSize;
  num? price;
  Rarity? rarity;
  Extra? extra;
  int? expiry;

  MagicEdenNft(
      {this.pdaAddress,
      this.auctionHouse,
      this.tokenAddress,
      this.tokenMint,
      this.seller,
      this.sellerReferral,
      this.tokenSize,
      this.price,
      this.rarity,
      this.extra,
      this.expiry});

  MagicEdenNft.fromJson(Map<String, dynamic> json) {
    if (json["pdaAddress"] is String) {
      pdaAddress = json["pdaAddress"];
    }
    if (json["auctionHouse"] is String) {
      auctionHouse = json["auctionHouse"];
    }
    if (json["tokenAddress"] is String) {
      tokenAddress = json["tokenAddress"];
    }
    if (json["tokenMint"] is String) {
      tokenMint = json["tokenMint"];
    }
    if (json["seller"] is String) {
      seller = json["seller"];
    }
    if (json["sellerReferral"] is String) {
      sellerReferral = json["sellerReferral"];
    }
    if (json["tokenSize"] is int) {
      tokenSize = json["tokenSize"];
    }
    if (json["price"] is num) {
      price = json["price"];
    }
    if (json["rarity"] is Map) {
      rarity = json["rarity"] == null ? null : Rarity.fromJson(json["rarity"]);
    }
    if (json["extra"] is Map) {
      extra = json["extra"] == null ? null : Extra.fromJson(json["extra"]);
    }
    if (json["expiry"] is int) {
      expiry = json["expiry"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["pdaAddress"] = pdaAddress;
    data["auctionHouse"] = auctionHouse;
    data["tokenAddress"] = tokenAddress;
    data["tokenMint"] = tokenMint;
    data["seller"] = seller;
    data["sellerReferral"] = sellerReferral;
    data["tokenSize"] = tokenSize;
    data["price"] = price;
    if (rarity != null) {
      data["rarity"] = rarity?.toJson();
    }
    if (extra != null) {
      data["extra"] = extra?.toJson();
    }
    data["expiry"] = expiry;
    return data;
  }
}

class Extra {
  String? img;

  Extra({img});

  Extra.fromJson(Map<String, dynamic> json) {
    if (json["img"] is String) {
      img = json["img"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["img"] = img;
    return data;
  }
}

class Rarity {
  Moonrank? moonrank;
  Merarity? merarity;

  Rarity({moonrank, merarity});

  Rarity.fromJson(Map<String, dynamic> json) {
    if (json["moonrank"] is Map) {
      moonrank =
          json["moonrank"] == null ? null : Moonrank.fromJson(json["moonrank"]);
    }
    if (json["merarity"] is Map) {
      merarity =
          json["merarity"] == null ? null : Merarity.fromJson(json["merarity"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (moonrank != null) {
      data["moonrank"] = moonrank?.toJson();
    }
    if (merarity != null) {
      data["merarity"] = merarity?.toJson();
    }
    return data;
  }
}

class Merarity {
  String? tokenKey;
  int? score;
  int? totalSupply;
  int? rank;

  Merarity({tokenKey, score, totalSupply, rank});

  Merarity.fromJson(Map<String, dynamic> json) {
    if (json["tokenKey"] is String) {
      tokenKey = json["tokenKey"];
    }
    if (json["score"] is int) {
      score = json["score"];
    }
    if (json["totalSupply"] is int) {
      totalSupply = json["totalSupply"];
    }
    if (json["rank"] is int) {
      rank = json["rank"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["tokenKey"] = tokenKey;
    data["score"] = score;
    data["totalSupply"] = totalSupply;
    data["rank"] = rank;
    return data;
  }
}

class Moonrank {
  int? rank;
  int? absoluteRarity;
  Crawl? crawl;

  Moonrank({rank, absoluteRarity, crawl});

  Moonrank.fromJson(Map<String, dynamic> json) {
    if (json["rank"] is int) {
      rank = json["rank"];
    }
    if (json["absolute_rarity"] is int) {
      absoluteRarity = json["absolute_rarity"];
    }
    if (json["crawl"] is Map) {
      crawl = json["crawl"] == null ? null : Crawl.fromJson(json["crawl"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["rank"] = rank;
    data["absolute_rarity"] = absoluteRarity;
    if (crawl != null) {
      data["crawl"] = crawl?.toJson();
    }
    return data;
  }
}

class Crawl {
  String? id;
  String? created;
  String? updated;
  int? firstMintTs;
  int? lastMintTs;
  String? firstMint;
  String? lastMint;
  int? expectedPieces;
  int? seenPieces;
  int? lastCrawlId;
  bool? complete;
  bool? blocked;
  int? unblockAtTs;

  Crawl(
      {this.id,
      this.created,
      this.updated,
      this.firstMintTs,
      this.lastMintTs,
      this.firstMint,
      this.lastMint,
      this.expectedPieces,
      this.seenPieces,
      this.lastCrawlId,
      this.complete,
      this.blocked,
      this.unblockAtTs});

  Crawl.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["created"] is String) {
      created = json["created"];
    }
    if (json["updated"] is String) {
      updated = json["updated"];
    }
    if (json["first_mint_ts"] is int) {
      firstMintTs = json["first_mint_ts"];
    }
    if (json["last_mint_ts"] is int) {
      lastMintTs = json["last_mint_ts"];
    }
    if (json["first_mint"] is String) {
      firstMint = json["first_mint"];
    }
    if (json["last_mint"] is String) {
      lastMint = json["last_mint"];
    }
    if (json["expected_pieces"] is int) {
      expectedPieces = json["expected_pieces"];
    }
    if (json["seen_pieces"] is int) {
      seenPieces = json["seen_pieces"];
    }
    if (json["last_crawl_id"] is int) {
      lastCrawlId = json["last_crawl_id"];
    }
    if (json["complete"] is bool) {
      complete = json["complete"];
    }
    if (json["blocked"] is bool) {
      blocked = json["blocked"];
    }
    if (json["unblock_at_ts"] is int) {
      unblockAtTs = json["unblock_at_ts"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["created"] = created;
    data["updated"] = updated;
    data["first_mint_ts"] = firstMintTs;
    data["last_mint_ts"] = lastMintTs;
    data["first_mint"] = firstMint;
    data["last_mint"] = lastMint;
    data["expected_pieces"] = expectedPieces;
    data["seen_pieces"] = seenPieces;
    data["last_crawl_id"] = lastCrawlId;
    data["complete"] = complete;
    data["blocked"] = blocked;
    data["unblock_at_ts"] = unblockAtTs;
    return data;
  }
}
