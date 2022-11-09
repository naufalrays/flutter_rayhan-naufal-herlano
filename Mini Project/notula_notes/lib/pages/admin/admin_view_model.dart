import 'package:flutter/material.dart';
import 'package:notula_notes/models/ads_model.dart';
import 'package:notula_notes/models/api/ads_api.dart';

enum AdminViewState {
  none,
  loading,
  error,
}

class AdminViewModel extends ChangeNotifier {
  List<AdsModel> _ads = [];
  List<AdsModel> get ads => _ads;
  AdminViewState _adminState = AdminViewState.none;
  AdminViewState get adminState => _adminState;

  changeState(AdminViewState s) {
    _adminState = s;
    notifyListeners();
  }

  getAds() async {
    changeState(AdminViewState.loading);
    try {
      final response = await AdsAPI().fetchAds();
      _ads = response;
      print('Data ${_ads.first.adsName}');
      changeState(AdminViewState.none);
    } catch (e) {
      changeState(AdminViewState.error);
    }
    notifyListeners();
  }
}
