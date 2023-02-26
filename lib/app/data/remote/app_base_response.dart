class AppBaseResponse<T> {
  AppBaseResponse({this.successResponse, this.statusCode = 0, this.messege});

  final String? messege;
  final int statusCode;
  final T? successResponse;
}
