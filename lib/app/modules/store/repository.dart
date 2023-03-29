import '../../data/models/store.dart';
import '../../data/provider/api.dart';

class StoreRepository {
  final Api _api;

  StoreRepository(this._api);

  Future<StoreModel> getStore(int id) => _api.getStore(id);
}
