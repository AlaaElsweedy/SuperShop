import 'package:equatable/equatable.dart';

class Banner extends Equatable {
  final int id;
  final String image;

  const Banner({
    required this.id,
    required this.image,
  });

  @override
  List<Object> get props => [id, image];
}
