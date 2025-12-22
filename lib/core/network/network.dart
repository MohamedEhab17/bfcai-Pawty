sealed class NetworkResult<T> {
  const NetworkResult();

  const factory NetworkResult.success({T? data}) =
      NetworkSuccess<T>;

  const factory NetworkResult.error({required String message}) =
      NetworkError<T>;
}

class NetworkSuccess<T> extends NetworkResult<T> {
  final T? data;
  const NetworkSuccess({this.data});
}

class NetworkError<T> extends NetworkResult<T> {
  final String message;
  const NetworkError({required this.message});

  @override
  String toString() => message;
}
