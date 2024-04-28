import 'package:watch_store/data/src/home_data_src.dart';

import '../model/home_model.dart';

abstract class IHomeRepo {
  Future<HomeModel> getHome();
}

class HomeRepository implements IHomeRepo {
  final IHomeDataSrc _homeDataSrc;

  HomeRepository(this._homeDataSrc);

  @override
  Future<HomeModel> getHome() => _homeDataSrc.getHome();
}
