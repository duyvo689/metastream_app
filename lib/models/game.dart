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
    background = json["background"] == null
        ? null
        : Background.fromJson(json["background"]);
    id = json["_id"];
    name = json["name"];
    logo = json["logo"];
    featureImg = json["featureImg"];
    description = json["description"];
    websiteUrl = json["websiteUrl"];
    views = json["views"];
    follows = json["follows"];
    tags = json["tags"] == null
        ? null
        : (json["tags"] as List).map((e) => Tags.fromJson(e)).toList();
    public = json["public"];
    isActive = json["isActive"];
    genresId = json["genres_id"] == null
        ? null
        : (json["genres_id"] as List).map((e) => GenresId.fromJson(e)).toList();
    slug = json["slug"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    chainId =
        json["chain_id"] == null ? null : ChainId.fromJson(json["chain_id"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (background != null) data["background"] = background?.toJson();
    data["_id"] = id;
    data["name"] = name;
    data["logo"] = logo;
    data["featureImg"] = featureImg;
    data["description"] = description;
    data["websiteUrl"] = websiteUrl;
    data["views"] = views;
    data["follows"] = follows;
    if (tags != null) data["tags"] = tags?.map((e) => e.toJson()).toList();
    data["public"] = public;
    data["isActive"] = isActive;
    if (genresId != null)
      data["genres_id"] = genresId?.map((e) => e.toJson()).toList();
    data["slug"] = slug;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    if (chainId != null) data["chain_id"] = chainId?.toJson();
    return data;
  }
}

class ChainId {
  String? id;
  String? name;
  String? code;

  ChainId({this.id, this.name, this.code});

  ChainId.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = id;
    data["name"] = name;
    data["code"] = code;
    return data;
  }
}

class GenresId {
  String? id;
  String? name;

  GenresId({this.id, this.name});

  GenresId.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = id;
    data["name"] = name;
    return data;
  }
}

class Tags {
  String? title;
  String? url;
  String? id;

  Tags({this.title, this.url, this.id});

  Tags.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    url = json["url"];
    id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = title;
    data["url"] = url;
    data["_id"] = id;
    return data;
  }
}

class Background {
  String? type;
  String? url;

  Background({this.type, this.url});

  Background.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["type"] = type;
    data["url"] = url;
    return data;
  }
}
