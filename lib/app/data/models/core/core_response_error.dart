class CoreResponseError {
  dynamic errorCode;
  String? message;

  CoreResponseError({
    this.errorCode,
    this.message,
  });

  CoreResponseError.fromValues({
    required this.errorCode,
    required this.message,
  });
}
