// ignore_for_file: public_member_api_docs, sort_constructors_first
class AdsModel {
  String? adsName;
  String? images;
  int? rating;
  String? linkAppStore;
  String? linkPlayStore;
  AdsModel({
    this.adsName,
    this.images,
    this.rating,
    this.linkAppStore,
    this.linkPlayStore,
  });

  // Map<String, dynamic> toJson() =>
  //     {adsName: 'ads', images: 'images', rating: 'rating'};

  AdsModel.fromJson(Map json) {
    adsName = json['ads'];
    images = json['images'];
    rating = json['rating'];
    linkAppStore = json['linkAppStore'];
    linkPlayStore = json['linkPlayStore'];
  }
}
