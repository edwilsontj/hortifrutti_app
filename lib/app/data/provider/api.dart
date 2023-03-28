import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:hortifrutti_app/app/data/models/store.dart';

const baseUrl = 'http://127.0.0.1:3333/';

class Api extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });
    super.onInit();
  }

  Future<List<StoreModel>> getStores() async {
    var response = _errorHandler(await get('cidades/2/estabelecimentos'));

    List<StoreModel> data = [];
    for (var store in response.body) {
      data.add(StoreModel.fromJson(store));
    }

    return data;
  }

  Response _errorHandler(Response response) {
    // ignore: avoid_print
    print(response.bodyString);

    switch (response.statusCode) {
      case 200:
      case 202:
      case 204:
        return response;
      default:
        throw 'Ocorreu um erro';
    }
  }
}
