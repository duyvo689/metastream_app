class MessageModel {
  Content? content;
  Nft? nft;
  String? id;
  User? user;
  bool? isLive;
  String? chatId;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? v;

  MessageModel(
      {this.content,
      this.nft,
      this.id,
      this.user,
      this.isLive,
      this.chatId,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.v});

  MessageModel.fromJson(Map<String, dynamic> json) {
    if (json["content"] is Map) {
      content =
          json["content"] == null ? null : Content.fromJson(json["content"]);
    }
    if (json["nft"] is Map) {
      nft = json["nft"] == null ? null : Nft.fromJson(json["nft"]);
    }
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if (json["isLive"] is bool) {
      isLive = json["isLive"];
    }
    if (json["chat_id"] is String) {
      chatId = json["chat_id"];
    }
    if (json["isActive"] is bool) {
      isActive = json["isActive"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (content != null) {
      _data["content"] = content?.toJson();
    }
    if (nft != null) {
      _data["nft"] = nft?.toJson();
    }
    _data["_id"] = id;
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    _data["isLive"] = isLive;
    _data["chat_id"] = chatId;
    _data["isActive"] = isActive;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    return _data;
  }
}

class User {
  String? numberStop;
  List<dynamic>? follower;
  bool? isActive;
  List<dynamic>? nftsEthId;
  List<dynamic>? nftsEthAffiliateId;
  String? id;
  String? addressWallet;
  int? follow;
  List<dynamic>? followGame;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? descriptions;
  String? email;
  String? firstName;
  String? lastName;
  String? userName;
  String? avatar;
  List<String>? nftsId;
  String? gameId;
  String? title;
  int? gems;
  String? chain;
  String? activityId;
  List<String>? tagsId;
  List<String>? idPayment;

  User(
      {this.numberStop,
      this.follower,
      this.isActive,
      this.nftsEthId,
      this.nftsEthAffiliateId,
      this.id,
      this.addressWallet,
      this.follow,
      this.followGame,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.descriptions,
      this.email,
      this.firstName,
      this.lastName,
      this.userName,
      this.avatar,
      this.nftsId,
      this.gameId,
      this.title,
      this.gems,
      this.chain,
      this.activityId,
      this.tagsId,
      this.idPayment});

  User.fromJson(Map<String, dynamic> json) {
    if (json["numberStop"] is String) {
      numberStop = json["numberStop"];
    }
    if (json["follower"] is List) {
      follower = json["follower"] ?? [];
    }
    if (json["isActive"] is bool) {
      isActive = json["isActive"];
    }
    if (json["nftsEth_id"] is List) {
      nftsEthId = json["nftsEth_id"] ?? [];
    }
    if (json["nftsEthAffiliate_id"] is List) {
      nftsEthAffiliateId = json["nftsEthAffiliate_id"] ?? [];
    }
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["addressWallet"] is String) {
      addressWallet = json["addressWallet"];
    }
    if (json["follow"] is int) {
      follow = json["follow"];
    }
    if (json["followGame"] is List) {
      followGame = json["followGame"] ?? [];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
    if (json["descriptions"] is String) {
      descriptions = json["descriptions"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["firstName"] is String) {
      firstName = json["firstName"];
    }
    if (json["lastName"] is String) {
      lastName = json["lastName"];
    }
    if (json["userName"] is String) {
      userName = json["userName"];
    }
    if (json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if (json["nfts_id"] is List) {
      nftsId =
          json["nfts_id"] == null ? null : List<String>.from(json["nfts_id"]);
    }
    if (json["game_id"] is String) {
      gameId = json["game_id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["gems"] is int) {
      gems = json["gems"];
    }
    if (json["chain"] is String) {
      chain = json["chain"];
    }
    if (json["activityId"] is String) {
      activityId = json["activityId"];
    }
    if (json["tags_id"] is List) {
      tagsId =
          json["tags_id"] == null ? null : List<String>.from(json["tags_id"]);
    }
    if (json["idPayment"] is List) {
      idPayment = json["idPayment"] == null
          ? null
          : List<String>.from(json["idPayment"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["numberStop"] = numberStop;
    if (follower != null) {
      _data["follower"] = follower;
    }
    _data["isActive"] = isActive;
    if (nftsEthId != null) {
      _data["nftsEth_id"] = nftsEthId;
    }
    if (nftsEthAffiliateId != null) {
      _data["nftsEthAffiliate_id"] = nftsEthAffiliateId;
    }
    _data["_id"] = id;
    _data["addressWallet"] = addressWallet;
    _data["follow"] = follow;
    if (followGame != null) {
      _data["followGame"] = followGame;
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    _data["descriptions"] = descriptions;
    _data["email"] = email;
    _data["firstName"] = firstName;
    _data["lastName"] = lastName;
    _data["userName"] = userName;
    _data["avatar"] = avatar;
    if (nftsId != null) {
      _data["nfts_id"] = nftsId;
    }
    _data["game_id"] = gameId;
    _data["title"] = title;
    _data["gems"] = gems;
    _data["chain"] = chain;
    _data["activityId"] = activityId;
    if (tagsId != null) {
      _data["tags_id"] = tagsId;
    }
    if (idPayment != null) {
      _data["idPayment"] = idPayment;
    }
    return _data;
  }
}

class Nft {
  String? name;
  String? image;
  double? price;
  String? chain;

  Nft({this.name, this.image, this.price, this.chain});

  Nft.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["price"] is double) {
      price = json["price"];
    }
    if (json["chain"] is String) {
      chain = json["chain"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["image"] = image;
    _data["price"] = price;
    _data["chain"] = chain;
    return _data;
  }
}

class Content {
  String? content;
  String? color;

  Content({this.content, this.color});

  Content.fromJson(Map<String, dynamic> json) {
    if (json["content"] is String) {
      content = json["content"];
    }
    if (json["color"] is String) {
      color = json["color"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["content"] = content;
    _data["color"] = color;
    return _data;
  }
}
