class Game {
  Background? background;
  String? id;
  String? name;
  String? logo;
  String? featureImg;
  String? description;
  String? websiteUrl;
  int? views;
  int? follows;
  List<Tags>? tags;
  bool? public;
  bool? isActive;
  List<GenresId>? genresId;
  String? slug;
  String? createdAt;
  String? updatedAt;
  int? v;
  ChainId? chainId;

  Game(
      {this.background,
      this.id,
      this.name,
      this.logo,
      this.featureImg,
      this.description,
      this.websiteUrl,
      this.views,
      this.follows,
      this.tags,
      this.public,
      this.isActive,
      this.genresId,
      this.slug,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.chainId});

  Game.fromJson(Map<String, dynamic> json) {
    this.background = json["background"] == null
        ? null
        : Background.fromJson(json["background"]);
    this.id = json["_id"];
    this.name = json["name"];
    this.logo = json["logo"];
    this.featureImg = json["featureImg"];
    this.description = json["description"];
    this.websiteUrl = json["websiteUrl"];
    this.views = json["views"];
    this.follows = json["follows"];
    this.tags = json["tags"] == null
        ? null
        : (json["tags"] as List).map((e) => Tags.fromJson(e)).toList();
    this.public = json["public"];
    this.isActive = json["isActive"];
    this.genresId = json["genres_id"] == null
        ? null
        : (json["genres_id"] as List).map((e) => GenresId.fromJson(e)).toList();
    this.slug = json["slug"];
    this.createdAt = json["createdAt"];
    this.updatedAt = json["updatedAt"];
    this.v = json["__v"];
    this.chainId =
        json["chain_id"] == null ? null : ChainId.fromJson(json["chain_id"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.background != null) data["background"] = this.background?.toJson();
    data["_id"] = this.id;
    data["name"] = this.name;
    data["logo"] = this.logo;
    data["featureImg"] = this.featureImg;
    data["description"] = this.description;
    data["websiteUrl"] = this.websiteUrl;
    data["views"] = this.views;
    data["follows"] = this.follows;
    if (this.tags != null)
      data["tags"] = this.tags?.map((e) => e.toJson()).toList();
    data["public"] = this.public;
    data["isActive"] = this.isActive;
    if (this.genresId != null)
      data["genres_id"] = this.genresId?.map((e) => e.toJson()).toList();
    data["slug"] = this.slug;
    data["createdAt"] = this.createdAt;
    data["updatedAt"] = this.updatedAt;
    data["__v"] = this.v;
    if (this.chainId != null) data["chain_id"] = this.chainId?.toJson();
    return data;
  }
}

class ChainId {
  String? id;
  String? name;
  String? code;

  ChainId({this.id, this.name, this.code});

  ChainId.fromJson(Map<String, dynamic> json) {
    this.id = json["_id"];
    this.name = json["name"];
    this.code = json["code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = this.id;
    data["name"] = this.name;
    data["code"] = this.code;
    return data;
  }
}

class GenresId {
  String? id;
  String? name;

  GenresId({this.id, this.name});

  GenresId.fromJson(Map<String, dynamic> json) {
    this.id = json["_id"];
    this.name = json["name"];
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
    this.title = json["title"];
    this.url = json["url"];
    this.id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = this.title;
    data["url"] = this.url;
    data["_id"] = this.id;
    return data;
  }
}

class Background {
  String? type;
  String? url;

  Background({this.type, this.url});

  Background.fromJson(Map<String, dynamic> json) {
    this.type = json["type"];
    this.url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["type"] = this.type;
    data["url"] = this.url;
    return data;
  }
}
