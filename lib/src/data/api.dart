import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:password_manager/src/config/constants/api_constants.dart';

enum RequestType { get, post, put, del }

class MainRepository {
  static final _dioClient = Dio();
  String? _token;

  call({
    required String methodName,
    required RequestType type,
    Map<String, dynamic>? args,
  }) async {
    args ??= {};

    final String requestPath = '${ApiConstants.domain}/$methodName';


    final Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final Response? response;
      switch (type) {
        case RequestType.get:
          response = await _dioClient.get(requestPath,
              data: jsonEncode(args),
              options:
                  Options(headers: headers, responseType: ResponseType.plain));
          break;
        case RequestType.post:
          response = await _dioClient.post(requestPath,
              data: jsonEncode(args),
              options:
                  Options(headers: headers, responseType: ResponseType.plain));
          break;
        case RequestType.put:
          response = await _dioClient.put(requestPath,
              data: jsonEncode(args),
              options:
                  Options(headers: headers, responseType: ResponseType.plain));
          break;
        case RequestType.del:
          response = await _dioClient.delete(requestPath,
              data: jsonEncode(args),
              options:
                  Options(headers: headers, responseType: ResponseType.plain));
          break;
      }
      if (response.statusCode != 200) {
        return null;
      }

      var responseData = jsonDecode(response.data);

      return responseData;
    } on Object catch (e) {
      print("Api response error - $e");
      return null;
    }
  }

  String? get token => _token;

  set token(String? value) {
    _token = value;
  }
}
