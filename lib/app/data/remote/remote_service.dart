import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../utils/constants.dart';

import '../models/data_state.dart';
import 'api_constants.dart';

class RemoteService {
  Future<DataState<T, S>> callApi<T, S>(
    String path,
    FromJson<T> convertJsonToModel, {
    required ApiTypes apiTypes,
    String? baseUrl,
    Object? queryParam,
    Map<String, String>? headers,
    bool isPublic = false,
  }) async {
    baseUrl ??= apiBaseUrl;
    try {
      late http.Response response;

      if (apiTypes == ApiTypes.getApi) {
        response = await http.get(
          Uri.parse(baseUrl + path),
          headers: headers,
        );
      } else if (apiTypes == ApiTypes.postApi) {
        response = await http.post(
          Uri.parse(baseUrl + path),
          headers: headers,
          body: queryParam,
        );
      } else if (apiTypes == ApiTypes.putApi) {
        // headers.addAll({'Content-Type': 'application/json'});
        response = await http.put(
          Uri.parse(baseUrl + path),
          headers: headers,
          body: jsonEncode(queryParam),
        );
      } else if (apiTypes == ApiTypes.patchApi) {
        response = await http.patch(
          Uri.parse(baseUrl + path),
          headers: headers,
          body: queryParam,
        );
      } else if (apiTypes == ApiTypes.deleteApi) {
        response = await http.delete(
          Uri.parse(baseUrl + path),
          headers: headers,
          body: queryParam,
        );
      }

      return getResponseModel<T, S>(response, convertJsonToModel);
    } catch (e) {
      return DataFailed(code: 102, errorResponse: e.toString());
    }
  }

  DataState<T, S> getResponseModel<T, S>(http.Response response, FromJson<T> convertJsonToModel) {
    var decodedResponse = utf8.decode(response.bodyBytes);
    log('API Response ----------- $decodedResponse');
    var jsonResponse = jsonDecode(decodedResponse);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return DataSuccess<T, S>(data: convertJsonToModel(jsonResponse));
    } else {
      return OnlyError(data: decodedResponse);
    }
  }
}

enum ApiTypes { getApi, postApi, putApi, deleteApi, patchApi }
