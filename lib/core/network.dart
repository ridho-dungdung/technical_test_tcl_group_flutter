import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient {
  final Dio dio = Dio(
      BaseOptions(
          baseUrl: 'http://192.168.1.7:8080',
          // contentType: 'application/json',
          receiveTimeout: Duration(minutes: 1),
          connectTimeout: Duration(minutes: 1)
      )
  )
    ..interceptors.add(LogInterceptor(
      logPrint: (o) => debugPrint(o.toString()),
    ),);

  Future post(
      String uri, {
        dynamic data,
        Map<String, dynamic>? params,
      }) async {
    try{
      final response = await dio.post(
        uri,
        data: data,
        queryParameters: params
      );
      return response.data;
    } catch(err) {
      return {'success': false};
    }
  }

  Future get(
      String uri, {
        Map<String, dynamic>? data,
        Map<String, dynamic>? params,
        bool typeBytes = false,
      }) async {
    try{
      final response = await dio.get(
        uri,
        data: data,
        queryParameters: params,
      );
      return response.data;
    } on DioException {
      rethrow;
    } catch(err) {
      return err;
    }
  }

  Future put(
      String uri, {
        dynamic data,
      }) async {
    try{
      final response = await dio.put(
        uri,
        data: data,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future delete(
      String uri, {
        dynamic data,
      }) async {
    try{
      final response = await dio.delete(
        uri,
        data: data,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future download(String uri, String patch) async {
    try{
      final response = await dio.download(
        uri,
        patch,
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }
}