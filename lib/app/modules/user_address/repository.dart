import 'package:hortifrutti_app/app/data/models/city.dart';
import 'package:hortifrutti_app/app/data/models/user_address_request.dart';
import 'package:hortifrutti_app/app/data/provider/api.dart';

class UserAddressRepository {
  final Api _api;

  UserAddressRepository(this._api);

  Future<List<CityModel>> getCities() => _api.getCities();

  Future<void> postAddress(UserAddressRequestModel userAddressRequest) =>
      _api.postAddress(userAddressRequest);

  Future<void> putAddress(UserAddressRequestModel userAddressRequest) =>
      _api.putAddress(userAddressRequest);
}
