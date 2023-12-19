import 'dart:io';

final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');
const int PRODUCTS_PER_PAGE = 15;
const String ADMIN_LOCAL_STORAGE_KEY = 'admin';
const String APP_THEME_STORAGE_KEY = 'AppTheme';
String? globalToken;