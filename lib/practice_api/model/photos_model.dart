


import 'dart:convert';

List<PhotosModel> photosModelFromJson(String str) => List<PhotosModel>.from(json.decode(str).map((x) => PhotosModel.fromJson(x)));

String photosModelToJson(List<PhotosModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosModel {
  String title;
  String url;

  PhotosModel({
    required this.title,
    required this.url,
  });

  factory PhotosModel.fromJson(Map<String, dynamic> json) => PhotosModel(
    title: json["title"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "url": url,
  };
}
