import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DioHelper {
  Dio dio = Dio();

  Future<Map<String, dynamic>?> getData({required String URL}) async {
    print('Before response');
    Response response = await dio.get(
      URL,
      options: Options(
        headers: {
          "Authorization":
              "Bearer ${PrefService.getString(key: CacheKeys.token)}",
        },
      ),
    );
    print('After response');
    return response.data;
  }

  Future<Map<String, dynamic>?> postData({
    // bool handleError = true,
    required String URL,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      Response response = await dio.post(
        URL,
        data: body,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
          headers: {
            "Authorization":
                "Bearer ${PrefService.getString(key: CacheKeys.token)}",
          },
        ),
      );
      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
        print(
            "/////////////////// API Data Fetched Successfully ///////////////////////");
        print(response.data);
        return response.data;
      } else if (response.statusCode == 403) {}
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<Response> postFormData({
    bool handleError = true,
    required String URL,
    FormData? formData,
    String? token,
  }) async {
    try {
      Response response = await dio.post(
        URL,
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
          headers: {
            "Authorization":
                "Bearer ${PrefService.getString(key: CacheKeys.token)}",
          },
        ),
      );
      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
      } else if (response.statusCode == 403) {}
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<Response> postDataWithoutAuth({
    bool handleError = true,
    required String URL,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      Response response = await dio.post(
        URL,
        data: body,
      );
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
      } else if (response.statusCode == 403) {
        if (kDebugMode) {
          print(response.data);
        }
      }
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<Response> putData({
    required String URL,
    Map<String, dynamic>? body,
  }) async {
    return await dio.put(URL,
        data: body,
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${PrefService.getString(key: CacheKeys.token)}",
          },
        ));
  }

  Future<Response> patchData({
    required String URL,
    Map<String, dynamic>? body,
  }) async {
    return await dio.patch(URL,
        data: body,
        options: Options(headers: {
          "Authorization":
              "Bearer ${PrefService.getString(key: CacheKeys.token)}",
        }));
  }

  Future<Response> deleteFromCart({
    required String URL,
    Map<String, dynamic>? body,
  }) async {
    return await dio.put(URL,
        data: body,
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${PrefService.getString(key: CacheKeys.token)}",
          },
        ));
  }

  Future<Response> deleteData({
    required String URL,
    Map<String, dynamic>? body,
    // String? token,
  }) async {
    return await dio.delete(URL,
        data: body,
        options: Options(headers: {
          "Authorization":
              "Bearer ${PrefService.getString(key: CacheKeys.token)}",
        }));
  }

  static void logout(BuildContext context) async {
    await PrefService.clearShared();
    context.pushReplacementNamed(DRoutesName.loginRoute);
  }
}
