class ApiConstance {
  static const baseUrl = 'https://student.valuxapps.com/api';
  static const signUpPath = '/register';
  static const loginPath = '/login';
  static const homePath = '/home';
  static const categoriesPath = '/categories';
  static const postFavoritesPath = '/favorites';
  static const getFavoritesPath = '/favorites';
  static const postCartPath = '/carts';
  static const searchProductsPath = '/products/search';

  static String productDetailsPath(int id) => '/products/$id';
  static String categoryProductsPath(int id) => '/categories/$id';
}
