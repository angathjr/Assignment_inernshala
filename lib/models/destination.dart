import 'dart:convert';

DestinationModel destinationModelFromJson(String str) =>
    DestinationModel.fromJson(json.decode(str));

String destinationModelToJson(DestinationModel data) =>
    json.encode(data.toJson());

class DestinationModel {
  final String? bannerTitle;
  final List<String>? bannerImages;
  final double? rating;
  final String? description;
  final List<String>? details;
  final List<PopularTrek>? popularTreks;

  DestinationModel({
    this.bannerTitle,
    this.bannerImages,
    this.rating,
    this.description,
    this.details,
    this.popularTreks,
  });

  DestinationModel copyWith({
    String? bannerTitle,
    List<String>? bannerImages,
    double? rating,
    String? description,
    List<String>? details,
    List<PopularTrek>? popularTreks,
  }) =>
      DestinationModel(
        bannerTitle: bannerTitle ?? this.bannerTitle,
        bannerImages: bannerImages ?? this.bannerImages,
        rating: rating ?? this.rating,
        description: description ?? this.description,
        details: details ?? this.details,
        popularTreks: popularTreks ?? this.popularTreks,
      );

  factory DestinationModel.fromJson(Map<String, dynamic> json) =>
      DestinationModel(
        bannerTitle: json["bannerTitle"] ?? '',
        bannerImages: json["bannerImages"] == null
            ? []
            : List<String>.from(json["bannerImages"]!.map((x) => x)),
        rating: json["rating"].toDouble() ?? 4,
        description: json["description"] ?? '',
        details: json["details"] == null
            ? []
            : List<String>.from(json["details"]!.map((x) => x)),
        popularTreks: json["popularTreks"] == null
            ? []
            : List<PopularTrek>.from(
                json["popularTreks"]!.map((x) => PopularTrek.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bannerTitle": bannerTitle,
        "bannerImages": bannerImages == null
            ? []
            : List<dynamic>.from(bannerImages!.map((x) => x)),
        "rating": rating,
        "description": description,
        "details":
            details == null ? [] : List<dynamic>.from(details!.map((x) => x)),
        "popularTreks": popularTreks == null
            ? []
            : List<dynamic>.from(popularTreks!.map((x) => x.toJson())),
      };
}

class PopularTrek {
  final String? title;
  final String? thumbnail;

  PopularTrek({
    this.title,
    this.thumbnail,
  });

  PopularTrek copyWith({
    String? title,
    String? thumbnail,
  }) =>
      PopularTrek(
        title: title ?? this.title,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory PopularTrek.fromJson(Map<String, dynamic> json) => PopularTrek(
        title: json["title"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "thumbnail": thumbnail,
      };
}
