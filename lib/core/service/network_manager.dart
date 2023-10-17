// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter_core/core/service/handling.dart';
import 'package:flutter_core/core/utils/typedef.dart';

import '../model/base_model.dart';
import 'failure.dart';

abstract interface class _NetworkOperation {
  ServicePost post({required String path, required IBaseModel data});
  ServiceGet get({required String path, required IBaseModel model});
}

final class DioManager {
  //TODO Base options projeye göre ayarlanacak
  DioManager._instance() {
    _dio = Dio(BaseOptions(baseUrl: '', headers: {}, queryParameters: {}));
  }
  static DioManager instance = DioManager._instance();
  late Dio _dio;
  Dio get dio => _dio;
}

final class NetworkManager implements _NetworkOperation {
  const NetworkManager._();
  static NetworkManager instance = const NetworkManager._();

  @override
  ServicePost post({required String path, required IBaseModel data}) async {
    try {
      final response = await DioManager.instance.dio.post(path, data: data);
      if (response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created) {
        return Succes(data: true);
      }
      return ServiceError(error: ServiceFailure(message: response.statusMessage));
    } on DioException catch (e) {
      return ServiceError(error: ServiceFailure(message: e.response?.statusCode.toString()));
    }
  }

  @override
  ServiceGet get({required String path, required IBaseModel model}) async {
    try {
      final response = await DioManager.instance.dio.get(path);
      final jsonData = response.data;
      if (response.statusCode == HttpStatus.ok) {
        if (jsonData is List) {
          final listData = jsonData.map((e) => model.fromJson(e)).toList();
          return Succes(data: listData);
        } else if (jsonData is Map<String, dynamic>) {
          final mapData = model.fromJson(jsonData);
          return Succes(data: mapData);
        }
      }
      return ServiceError(error: ServiceFailure(message: response.statusMessage));
    } on DioException catch (e) {
      return ServiceError(error: ServiceFailure(message: e.response?.statusCode.toString()));
    }
  }
}

//* Örnek model
class Model extends IBaseModel<Model> {
  int? id;
  Model({
    this.id,
  });

  @override
  Model fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

//TODO örnek kullanımı bu şekilde
class Example {
  void fetch() async {
  final serviceResponse = await NetworkManager.instance.get(path: '', model: Model());
  final value = switch (serviceResponse) {
    Succes(data: final data) => data,
    ServiceError(error: final error) => error,
  };
}

}
