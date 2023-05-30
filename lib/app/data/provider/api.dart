import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:hortifrutti_app/app/data/models/address.dart';
import 'package:hortifrutti_app/app/data/models/city.dart';
import 'package:hortifrutti_app/app/data/models/order_request.dart';
import 'package:hortifrutti_app/app/data/models/store.dart';
import 'package:hortifrutti_app/app/data/models/user_address_request.dart';

import '../models/user.dart';
import '../models/user_login_request.dart';
import '../models/user_login_response.dart';
import '../models/user_profile_request.dart';
import '../services/storage/service.dart';

// IP para rodar app como linux
const baseUrl = 'http://127.0.0.1:3333/';

// IP para rodar app adb wsa
// const baseUrl = 'http://172.25.32.1:3333/';

class Api extends GetConnect {
  final _storageService = Get.find<StorageService>();

  @override
  void onInit() {
    // httpClient.baseUrl = 'http://127.0.0.1:3333/';
    // httpClient.baseUrl = 'http://172.25.32.1:3333/';
    httpClient.baseUrl = baseUrl;

    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });

    httpClient.addAuthenticator((Request request) {
      var token = _storageService.token;
      var headers = {'Authorization': "Bearer $token"};

      request.headers.addAll(headers);

      return request;
    });

    super.onInit();
  }

  Future<List<CityModel>> getCities() async {
    var response = _errorHandler(await get('cidades'));

    List<CityModel> data = [];
    for (var city in response.body) {
      data.add(CityModel.fromJson(city));
    }

    return data;
  }

  Future<UserLoginResponseModel> login(UserLoginRequestModel data) async {
    var response = _errorHandler(await post('login', jsonEncode(data)));

    return UserLoginResponseModel.fromJson(response.body);
  }

  Future<UserModel> register(UserProfileRequestModel data) async {
    var response =
        _errorHandler(await post('cliente/cadastro', jsonEncode(data)));

    return UserModel.fromJson(response.body);
  }

  Future<UserModel> getUser() async {
    var response = _errorHandler(await get('auth/me'));
    return UserModel.fromJson(response.body);
  }

  Future<UserModel> putUser(UserProfileRequestModel data) async {
    var response = _errorHandler(await put('cliente', jsonEncode(data)));

    return UserModel.fromJson(response.body);
  }

  Future<List<AddressModel>> getUserAddresses() async {
    var response = _errorHandler(await get('enderecos'));

    List<AddressModel> data = [];
    for (var address in response.body) {
      data.add(AddressModel.fromJson(address));
    }

    return data;
  }

  Future<void> postAddress(UserAddressRequestModel data) async {
    _errorHandler(await post('enderecos', jsonEncode(data)));
  }

  Future<void> putAddress(UserAddressRequestModel data) async {
    _errorHandler(await put('enderecos/${data.id}', jsonEncode(data)));
  }

  Future<List<StoreModel>> getStores() async {
    var response = _errorHandler(await get('cidades/1/estabelecimentos'));

    List<StoreModel> data = [];
    for (var store in response.body) {
      data.add(StoreModel.fromJson(store));
    }

    return data;
  }

  Future<StoreModel> getStore(int id) async {
    var response = _errorHandler(await get('estabelecimentos/$id'));

    return StoreModel.fromJson(response.body);
  }

  // PEDIDOS
  Future postOrder(OrderRequestModel data) async {
    _errorHandler(await post('pedidos', jsonEncode(data)));
  }

  Response _errorHandler(Response response) {
    // ignore: avoid_print
    print(response.bodyString);

    switch (response.statusCode) {
      case 200:
      case 202:
      case 204:
        return response;
      case 422:
        throw response.body['errors'].first['message'];
      default:
        throw 'Ocorreu um erro';
    }
  }
}
