import 'package:dio/dio.dart';
import 'package:password_manager/src/config/constants/api_constants.dart';

class ApiRepository {
  static final Dio _dioClient = Dio();

  static void rawCall({
    required String requestPath,
    Map<String, dynamic>? args,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    args ??= {};

    try {
      final Response response = await _dioClient
          .post(
            requestPath,
            data: args,
            options:
                Options(headers: headers, responseType: ResponseType.plain),
            cancelToken: cancelToken,
          )
          .onError((error, stackTrace) => Response(
              requestOptions: RequestOptions(),
              statusCode: 404,
              data: {'error': '${error}'}))
          .catchError((err) => Response(
              requestOptions: RequestOptions(),
              statusCode: 404,
              data: {'error': '${err}'}))
          .timeout(const Duration(seconds: 30),
              onTimeout: () => Response(
                  requestOptions: RequestOptions(),
                  statusCode: 408,
                  statusMessage: ''));

      print('rawResponse - ${response.data}');



    } on Object catch (e) {

    }
  }
}
