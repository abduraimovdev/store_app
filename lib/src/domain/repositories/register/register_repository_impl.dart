part of 'register_repository.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  RegisterUserRepositoryImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<Either<Failure, RegisterUserResponse>> registerUser({
    required Map<String, dynamic> request,
  }) async {
    try {
      final Response response = await dio.post(
        Constants.authUrl + Urls.register,
        data: request,
      );
      return Right(RegisterUserResponse.fromJson(response.data));
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }
}
