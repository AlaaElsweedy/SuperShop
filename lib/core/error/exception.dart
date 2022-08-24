import '../network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}

class LocalDataBaseException implements Exception {
  final String message;

  const LocalDataBaseException({required this.message});
}
