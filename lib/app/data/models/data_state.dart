import 'dart:io';

import 'error_model.dart';

abstract class DataState<T, S> {
  const DataState({this.successDataObject, this.error, this.statusCode, this.errorMessage, this.errorDataObject});

  final HttpException? error;
  final ErrorModel? errorDataObject;
  final String? errorMessage;
  final int? statusCode;
  final T? successDataObject;
}

class DataSuccess<T, S> extends DataState<T, S> {
  const DataSuccess({T? data}) : super(successDataObject: data);
}

class OnlyError<T, S> extends DataState<T, S> {
  const OnlyError({String? data}) : super(errorMessage: data);
}

class DataFailed<T, S> extends DataState<T, S> {
  const DataFailed({
    int? code,
    ErrorModel? errorDataObject,
    Exception? exception,
    required String errorResponse,
  }) : super(
          statusCode: code,
          errorDataObject: errorDataObject,
          errorMessage: errorResponse,
        );
}
