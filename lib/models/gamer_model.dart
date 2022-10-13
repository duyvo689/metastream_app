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
      background = json["background"] == null
          ? null
          : Background.fromJson(json["background"]);
    if (json["developer"] is Map)
      developer = json["developer"] == null
          ? null
          : Developer.fromJson(json["developer"]);
    if (json["_id"] is String) id = json["_id"];
    if (json["name"] is String) name = json["name"];
    if (json["logo"] is String) logo = json["logo"];
    if (json["featureImg"] is String) featureImg = json["featureImg"];
    if (json["description"] is String) description = json["description"];
    if (json["websiteUrl"] is String) websiteUrl = json["websiteUrl"];
    if (json["views"] is int) views = json["views"];
    if (json["follows"] is int) follows = json["follows"];
    if (json["chain_id"] is Map)
      chainId =
          json["chain_id"] == null ? null : ChainId.fromJson(json["chain_id"]);
    if (json["tags"] is List)
      tags = json["tags"] == null
          ? null
          : (json["tags"] as List).map((e) => Tags.fromJson(e)).toList();
    if (json["public"] is bool) public = json["public"];
    if (json["isActive"] is bool) isActive = json["isActive"];
    if (json["genres_id"] is List)
      genresId = json["genres_id"] == null
          ? null
          : (json["genres_id"] as List)
              .map((e) => GenresId.fromJson(e))
              .toList();
    if (json["screenShots"] is List)
      screenShots = json["screenShots"] == null
          ? null
          : List<String>.from(json["screenShots"]);
    if (json["link"] is List)
      link = json["link"] == null
          ? null
          : (json["link"] as List).map((e) => Link.fromJson(e)).toList();
    if (json["addressCollection"] is String)
      addressCollection = json["addressCollection"];
    if (json["slug"] is String) slug = json["slug"];
    if (json["createdAt"] is String) createdAt = json["createdAt"];
    if (json["updatedAt"] is String) updatedAt = json["updatedAt"];
    if (json["__v"] is int) v = json["__v"];
    if (json["release"] is String) release = json["release"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (background != null) data["background"] = background?.toJson();
    if (developer != null) data["developer"] = developer?.toJson();
    data["_id"] = id;
    data["name"] = name;
    data["logo"] = logo;
    data["featureImg"] = featureImg;
    data["description"] = description;
    data["websiteUrl"] = websiteUrl;
    data["views"] = views;
    data["follows"] = follows;
    if (chainId != null) data["chain_id"] = chainId?.toJson();
    if (tags != null) data["tags"] = tags?.map((e) => e.toJson()).toList();
    data["public"] = public;
    data["isActive"] = isActive;
    if (genresId != null)
      data["genres_id"] = genresId?.map((e) => e.toJson()).toList();
    if (screenShots != null) data["screenShots"] = screenShots;
    if (link != null) data["link"] = link?.map((e) => e.toJson()).toList();
    data["addressCollection"] = addressCollection;
    data["slug"] = slug;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["__v"] = v;
    data["release"] = release;
    return data;
  }
}

class Link {
  String? title;
  String? url;
  String? id;

  Link({this.title, this.url, this.id});

  Link.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) title = json["title"];
    if (json["url"] is String) url = json["url"];
    if (json["_id"] is String) id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = title;
    data["url"] = url;
    data["_id"] = id;
    return data;
  }
}

class GenresId {
  String? id;
  String? name;

  GenresId({this.id, this.name});

  GenresId.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["name"] is String) name = json["name"];
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
    if (json["title"] is String) title = json["title"];
    if (json["url"] is String) url = json["url"];
    if (json["_id"] is String) id = json["_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = title;
    data["url"] = url;
    data["_id"] = id;
    return data;
  }
}

class ChainId {
  String? id;
  String? name;
  String? code;

  ChainId({this.id, this.name, this.code});

  ChainId.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["name"] is String) name = json["name"];
    if (json["code"] is String) code = json["code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["_id"] = id;
    data["name"] = name;
    data["code"] = code;
    return data;
  }
}

class Developer {
  String? name;
  String? link;

  Developer({this.name, this.link});

  Developer.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) name = json["name"];
    if (json["link"] is String) link = json["link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = name;
    data["link"] = link;
    return data;
  }
}

class Background {
  String? type;
  String? url;

  Background({this.type, this.url});

  Background.fromJson(Map<String, dynamic> json) {
    if (json["type"] is String) type = json["type"];
    if (json["url"] is String) url = json["url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["type"] = type;
    data["url"] = url;
    return data;
  }
}
