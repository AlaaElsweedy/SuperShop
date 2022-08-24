class Home {
  final bool status;
  final HomeData data;

  Home({
    required this.status,
    required this.data,
  });
}

class HomeData {
  final List<Banner> banners;
  final List<Product> products;

  HomeData({
    required this.banners,
    required this.products,
  });
}

class Banner {
  final int id;
  final String image;

  Banner({
    required this.id,
    required this.image,
  });
}

class Product {
  final int id;
  dynamic price;
  dynamic oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final bool isFavorite;
  final bool isCart;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.isFavorite,
    required this.isCart,
  });
}
