import 'dart:convert';

OpenseaModel openseaModelFromJson(String str) =>
    OpenseaModel.fromJson(json.decode(str));

String openseaModelToJson(OpenseaModel data) => json.encode(data.toJson());

class OpenseaModel {
  String next;
  dynamic previous;
  List<Asset>? assets;

  OpenseaModel({
    required this.next,
    this.previous,
    required this.assets,
  });

  factory OpenseaModel.fromJson(Map<String, dynamic> json) => OpenseaModel(
        next: json["next"],
        previous: json["previous"],
        assets: List<Asset>.from(json["assets"].map((x) => Asset.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "next": next,
        "previous": previous,
        "assets": List<dynamic>.from(assets!.map((x) => x.toJson())),
      };
}

class Asset {
  String? imageUrl;
  String? name;
  String? description;
  String? permalink;

  Asset({
    this.imageUrl,
    this.name,
    this.description,
    this.permalink,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        imageUrl: json["image_url"],
        name: json["name"],
        description: json["description"],
        permalink: json["permalink"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "name": name,
        "description": description,
        "permalink": permalink,
      };
}
