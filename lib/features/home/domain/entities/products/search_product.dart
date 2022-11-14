import 'package:equatable/equatable.dart';

import 'search_products.dart';

class SearchProduct extends Equatable {
  final bool status;
  final String? message;
  final SearchProducts data;

  const SearchProduct({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [status, message, data];
}
