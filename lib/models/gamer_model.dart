class Game {
  Background? background;
  Developer? developer;
  String? id;
  String? name;
  String? logo;
  String? featureImg;
  String? description;
  String? websiteUrl;
  int? views;
  int? follows;
  ChainId? chainId;
  List<Tags>? tags;
  bool? public;
  bool? isActive;
  List<GenresId>? genresId;
  List<String>? screenShots;
  List<Link>? link;
  String? addressCollection;
  String? slug;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? release;

  Game(
      {this.background,
      this.developer,
      this.id,
      this.name,
      this.logo,
      this.featureImg,
      this.description,
      this.websiteUrl,
      this.views,
      this.follows,
      this.chainId,
      this.tags,
      this.public,
      this.isActive,
      this.genresId,
      this.screenShots,
      this.link,
      this.addressCollection,
      this.slug,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.release});

  Game.fromJson(Map<String, dynamic> json) {
    if (json["background"] is Map)
      this.background = json["background"] == null
          ? null
          : Background.fromJson(json["background"]);
    if (json["developer"] is Map)
      this.developer = json["developer"] == null
          ? null
          : Developer.fromJson(json["developer"]);
    if (json["_id"] is String) this.id = json["_id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["logo"] is String) this.logo = json["logo"];
    if (json["featureImg"] is String) this.featureImg = json["featureImg"];
    if (json["description"] is String) this.description = json["description"];
    if (json["websiteUrl"] is String) this.websiteUrl = json["websiteUrl"];
    if (json["views"] is int) this.views = json["views"];
    if (json["follows"] is int) this.follows = json["follows"];
    if (json["chain_id"] is Map)
      this.chainId =
          json["chain_id"] == null ? null : ChainId.fromJson(json["chain_id"]);
    if (json["tags"] is List)
      this.tags = json["tags"] == null
          ? null
          : (json["tags"] as List).map((e) => Tags.fromJson(e)).toList();
    if (json["public"] is bool) this.public = json["public"];
    if (json["isActive"] is bool) this.isActive = json["isActive"];
    if (json["genres_id"] is List)
      this.genresId = json["genres_id"] == null
          ? null
          : (json["genres_id"] as List)
              .map((e) => GenresId.fromJson(e))
              .toList();
    if (json["screenShots"] is List)
      this.screenShots = json["screenShots"] == null
          ? null
          : List<String>.from(json["screenShots"]);
    if (json["link"] is List)
      this.link = json["link"] == null
          ? null
          : (json["link"] as List).map((e) => Link.fromJson(e)).toList();
    if (json["addressCollection"] is String)
      this.addressCollection = json["addressCollection"];
    if (json["slug"] is String) this.slug = json["slug"];
    if (json["createdAt"] is String) this.createdAt = json["createdAt"];
    if (json["updatedAt"] is String) this.updatedAt = json["updatedAt"];
    if (json["__v"] is int) this.v = json["__v"];
    if (json["release"] is String) this.release = json["release"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.background != null) data["background"] = this.background?.toJson();
    if (this.developer != null) data["developer"] = this.developer?.toJson();
    data["_id"] = this.id;
    data["name"] = this.name;
    data["logo"] = this.logo;
    data["featureImg"] = this.featureImg;
    data["description"] = this.description;
    data["websiteUrl"] = this.websiteUrl;
    data["views"] = this.views;
    data["follows"] = this.follows;
    if (this.chainId != null) data["chain_id"] = this.chainId?.toJson();
    if (this.tags != null)
      data["tags"] = this.tags?.map((e) => e.toJson()).toList();
    data["public"] = this.public;
    data["isActive"] = this.isActive;
    if (this.genresId != null)
      data["genres_id"] = this.genresId?.map((e) => e.toJson()).toList();
    if (this.screenShots != null) data["screenShots"] = this.screenShots;
    if (this.link != null)
      data["link"] = this.link?.map((e) => e.toJson()).toList();
    data["addressCollection"] = this.addressCollection;
    data["slug"] = this.slug;
    data["createdAt"] = this.createdAt;
    data["updatedAt"] = this.updatedAt;
    data["__v"] = this.v;
    data["release"] = this.release;
    return data;
  }
}

class Link {
  String? title;
  String? url;
  String? id;

  Link({this.title, this.url, this.id});

  Link.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) this.title = json["title"];
    if (json["url"] is String) this.url = json["url"];
    if (json["_id"] is String) this.id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = this.title;
    data["url"] = this.url;
    data["_id"] = this.id;
    return data;
  }
}

class GenresId {
  String? id;
  String? name;

  GenresId({this.id, this.name});

  GenresId.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) this.id = json["_id"];
    if (json["name"] is String) this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    data["name"] = this.name;
    return data;
  }
}

class Tags {
  String? title;
  String? url;
  String? id;

  Tags({this.title, this.url, this.id});

  Tags.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) this.title = json["title"];
    if (json["url"] is String) this.url = json["url"];
    if (json["_id"] is String) this.id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = this.title;
    data["url"] = this.url;
    data["_id"] = this.id;
    return data;
  }
}

class ChainId {
  String? id;
  String? name;
  String? code;

  ChainId({this.id, this.name, this.code});

  ChainId.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) this.id = json["_id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["code"] is String) this.code = json["code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    data["name"] = this.name;
    data["code"] = this.code;
    return data;
  }
}

class Developer {
  String? name;
  String? link;

  Developer({this.name, this.link});

  Developer.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) this.name = json["name"];
    if (json["link"] is String) this.link = json["link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name;
    data["link"] = this.link;
    return data;
  }
}

class Background {
  String? type;
  String? url;

  Background({this.type, this.url});

  Background.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) this.type = json["type"];
    if (json["url"] is String) this.url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["type"] = this.type;
    data["url"] = this.url;
    return data;
  }
}
