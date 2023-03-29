import '../../data/models/store.dart';
import '../../data/provider/api.dart';

class HomeRepository {
  final Api _api;

  HomeRepository(this._api);

  Future<List<StoreModel>> getStores() => _api.getStores();
}
