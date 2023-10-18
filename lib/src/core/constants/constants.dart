import 'package:flutter/material.dart';

part 'app_keys.dart';

sealed class Constants {
  Constants._();

  /// test
  static const baseUrl = 'https://fakestoreapi.com';


  static Map<String, String> query({int page = 1, int limit = 10}) => {
        'page': page.toString(),
        'limit': limit.toString(),
      };
  static const authUrl = 'https://api.auth.u-code.io';

  /// id
  static const String projectId = '';
  static const String environmentId = '';
  static const String resourceId = 'a';
  static const String apiKey = '';

  static const String clientTypeId = '';
  static const String companyId = '';
  static const String expiresAt = '';
  static const String roledId = '';

  static GlobalKey<FormState> bottomNavigatorKey = GlobalKey<FormState>();
}

sealed class Urls {
  Urls._();

  static const String register = '';
  static const String sendMessage = '';
  static const String verifyEmail = '';

  static const products = '/products';
  static const productsCategory = '/products/categories/';
  static String productsCategories(String category) => '/products/category/$category';
}

// The splash page animation duration.
const Duration splashPageAnimationDuration = Duration(milliseconds: 1500);

// The animation display duration.
const Duration animationDuration = Duration(milliseconds: 300);
