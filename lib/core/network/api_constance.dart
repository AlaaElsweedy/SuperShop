class ApiConstance {
  static const baseUrl = 'https://student.valuxapps.com/api';
  static const signUpPath = '/register';
  static const loginPath = '/login';
  static const homePath = '/home';
  static const categoriesPath = '/categories';
  static const postFavoritesPath = '/favorites';
  static const getFavoritesPath = '/favorites';
  static const searchProductsPath = '/products/search';
  static const addCartProductPath = '/carts';
  static const addOrderPath = '/orders';
  static const getOrdersPath = '/orders';
  static const getCartPath = '/carts';
  static const getProfilePath = '/profile';
  static const updateProfilePath = '/update-profile';
  static const getAddressesPath = '/addresses';

  static String productDetailsPath(int id) => '/products/$id';
  static String categoryProductsPath(int id) => '/categories/$id';

  static String deleteCartProductsPath(int id) => '/carts/$id';
  static String updateCartProductsPath(int id) => '/carts/$id';
  static String deleteAddressPath(int id) => '/addresses/$id';
}
