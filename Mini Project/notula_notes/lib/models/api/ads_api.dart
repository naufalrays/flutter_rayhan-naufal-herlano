import 'package:dio/dio.dart';
import 'package:notula_notes/models/ads_model.dart';

class AdsAPI {
  final Dio dio = Dio();

  Future fetchAds() async {
    try {
      final Response response = await dio.get(
          'https://mini-project-56307-default-rtdb.asia-southeast1.firebasedatabase.app/ads.json');

      List<AdsModel> adsData =
          (response.data as List).map((e) => AdsModel.fromJson(e)).toList();
      // debugPrint(adsData.first.images);
      return adsData;
    } catch (e) {
      rethrow;
    }
  }
}
