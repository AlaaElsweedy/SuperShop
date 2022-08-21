import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final bool statusCode;
  final String message;

  const ErrorMessageModel({
    required this.statusCode,
    required this.message,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['status'],
      message: json['message'],
    );
  }

  @override
  List<Object?> get props => [
        statusCode,
        message,
      ];
}
