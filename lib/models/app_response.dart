class AppResponse<T> {
  bool? success;
  T? data;
  String? errorMessage;

  AppResponse({
    this.success,
    this.data,
    this.errorMessage,
  });
}
