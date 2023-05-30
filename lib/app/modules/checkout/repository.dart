import 'package:hortifrutti_app/app/data/models/address.dart';
import 'package:hortifrutti_app/app/data/models/order_request.dart';

import '../../data/provider/api.dart';

class CheckoutRepository {
  // ignore: unused_field
  final Api _api;

  CheckoutRepository(this._api);

  Future<List<AddressModel>> getUserAddresses() => _api.getUserAddresses();

  Future postOrder(OrderRequestModel orderRequest) =>
      _api.postOrder(orderRequest);
}
