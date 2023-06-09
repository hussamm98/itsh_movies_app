import 'package:movies_app/movies/data/model/error_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}

class LocalException implements Exception{
  final ErrorMessageModel errorMessageModel;

  const LocalException({
    required this.errorMessageModel,
  });
}
