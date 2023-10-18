import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_app/src/core/constants/constants.dart';
import 'package:store_app/src/core/either_dart/either.dart';
import 'package:store_app/src/data/models/product.dart';
import 'package:store_app/src/domain/failure/failure.dart';

import '../../failure/server_error.dart';
import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl()
      : dio = Dio(
          BaseOptions(
            baseUrl: Constants.baseUrl,
            connectTimeout: const Duration(seconds: 4),
            receiveTimeout: const Duration(seconds: 4),
            contentType: Headers.jsonContentType,
          ),
        );

  final Dio dio;

  @override
  Future<Either<Failure, List<ProductModel>>> getData(
      {List<String>? category}) async {
    try {
      if (category != null && category.isNotEmpty) {
        final List<ProductModel> products = [];
        for(final item in category) {
          final response = await dio.get(Urls.productsCategories(item));

          if (response.statusCode == 200 || response.statusCode == 201) {
            final data = (response.data as List)
                .map((e) => ProductModel.fromJson(e))
                .toList();
            products.addAll(data);
          }
        }
        return Right(products);
      } else {
        final response = await dio.get(Urls.products);

        if (response.statusCode == 200 || response.statusCode == 201) {
          final data = (response.data as List)
              .map((e) => ProductModel.fromJson(e))
              .toList();
          return Right(data);
        }
      }
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
    return Left(ServerError.withError(message: 'Error not Found').failure);
  }

  @override
  Future<List<String>> getCategories() async {
    final response = await dio.get(Urls.productsCategory);
    print(response.data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return List.from(response.data as List);
    }
    return [];
  }
}
