import 'dart:convert';


import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/cart_model.dart';


abstract interface class CartRepository {
  Future<void> saveCard(CartModel card);

  CartModel getCard();
}

class CartRepositoryImpl implements CartRepository {
  @override
  Future<void> saveCard(CartModel card) async {
    await LocalDataService.save<String>(BoxKeys.card, jsonEncode(card.toJson()));
  }

  @override
  CartModel getCard() {
    final String? result = LocalDataService.getData<String>(
      BoxKeys.card,
      null,
    );
    if (result == null) return CartModel(id: const Uuid().v4(), items: []);
    return CartModel.fromJson(jsonDecode(result));
  }
}



class LocalDataService {
  const LocalDataService._();
  static final Box _box = Hive.box('mainApp');

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>('mainApp');
  }

  static Future<void> save<T>(BoxKeys key, T data) async {
    await _box.put(key.name, data);
  }

  static T? getData<T>(BoxKeys key, dynamic defaultValue) => _box.get(key.name, defaultValue: defaultValue) as T?;

  static Future<void> delete(BoxKeys key) async{
    await _box.delete(key.name);
  }
}

enum BoxKeys {
  card,
  favourites,
  auth,
}
