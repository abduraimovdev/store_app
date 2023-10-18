import '../../../core/either_dart/either.dart';
import '../../../data/models/product.dart';
import '../../failure/failure.dart';

abstract interface class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getData({List<String>? category});

  Future<List<String>> getCategories();
}
