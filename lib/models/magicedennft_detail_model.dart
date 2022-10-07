class MagicEdenNftDetail {
  String? mintAddress;
  String? owner;
  int? supply;
  String? collection;
  String? name;
  String? updateAuthority;
  bool? primarySaleHappened;
  int? sellerFeeBasisPoints;
  String? image;
  String? externalUrl;
  List<Attributes>? attributes;
  Properties? properties;

  MagicEdenNftDetail(
      {this.mintAddress,
      this.owner,
      this.supply,
      this.collection,
      this.name,
      this.updateAuthority,
      this.primarySaleHappened,
      this.sellerFeeBasisPoints,
      this.image,
      this.externalUrl,
      this.attributes,
      this.properties});

  MagicEdenNftDetail.fromJson(Map<String, dynamic> json) {
    if (json["mintAddress"] is String) {
      mintAddress = json["mintAddress"];
    }
    if (json["owner"] is String) {
      owner = json["owner"];
    }
    if (json["supply"] is int) {
      supply = json["supply"];
    }
    if (json["collection"] is String) {
      collection = json["collection"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["updateAuthority"] is String) {
      updateAuthority = json["updateAuthority"];
    }
    if (json["primarySaleHappened"] is bool) {
      primarySaleHappened = json["primarySaleHappened"];
    }
    if (json["sellerFeeBasisPoints"] is int) {
      sellerFeeBasisPoints = json["sellerFeeBasisPoints"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["externalUrl"] is String) {
      externalUrl = json["externalUrl"];
    }
    if (json["attributes"] is List) {
      attributes = json["attributes"] == null
          ? null
          : (json["attributes"] as List)
              .map((e) => Attributes.fromJson(e))
              .toList();
    }
    if (json["properties"] is Map) {
      properties = json["properties"] == null
          ? null
          : Properties.fromJson(json["properties"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["mintAddress"] = mintAddress;
    data["owner"] = owner;
    data["supply"] = supply;
    data["collection"] = collection;
    data["name"] = name;
    data["updateAuthority"] = updateAuthority;
    data["primarySaleHappened"] = primarySaleHappened;
    data["sellerFeeBasisPoints"] = sellerFeeBasisPoints;
    data["image"] = image;
    data["externalUrl"] = externalUrl;
    if (attributes != null) {
      data["attributes"] = attributes?.map((e) => e.toJson()).toList();
    }
    if (properties != null) {
      data["properties"] = properties?.toJson();
    }
    return data;
  }
}

class Properties {
  List<Files>? files;
  String? category;
  List<Creators>? creators;

  Properties({this.files, this.category, this.creators});

  Properties.fromJson(Map<String, dynamic> json) {
    if (json["files"] is List) {
      files = json["files"] == null
          ? null
          : (json["files"] as List).map((e) => Files.fromJson(e)).toList();
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["creators"] is List) {
      creators = json["creators"] == null
          ? null
          : (json["creators"] as List)
              .map((e) => Creators.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (files != null) {
      data["files"] = files?.map((e) => e.toJson()).toList();
    }
    data["category"] = category;
    if (creators != null) {
      data["creators"] = creators?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Creators {
  String? address;
  int? share;

  Creators({this.address, this.share});

  Creators.fromJson(Map<String, dynamic> json) {
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["share"] is int) {
      share = json["share"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["address"] = address;
    data["share"] = share;
    return data;
  }
}

class Files {
  String? uri;
  String? type;

  Files({this.uri, this.type});

  Files.fromJson(Map<String, dynamic> json) {
    if (json["uri"] is String) {
      uri = json["uri"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["uri"] = uri;
    data["type"] = type;
    return data;
  }
}

class Attributes {
  String? traitType;
  String? value;

  Attributes({this.traitType, this.value});

  Attributes.fromJson(Map<String, dynamic> json) {
    if (json["trait_type"] is String) {
      traitType = json["trait_type"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["trait_type"] = traitType;
    data["value"] = value;
    return data;
  }
}
