// import 'package:flutter/foundation.dart';
// import 'package:your_app/models/home_item.dart';
// import 'package:your_app/services/home_service.dart';

// class HomeProvider extends ChangeNotifier {
//   final HomeService _homeService = HomeService();
//   List<HomeItem> _homeItems = [];

//   List<HomeItem> get homeItems => _homeItems;

//   Future<void> getHomeItems() async {
//     _homeItems = await _homeService.fetchHomeItems();
//     notifyListeners();
//   }
// }
