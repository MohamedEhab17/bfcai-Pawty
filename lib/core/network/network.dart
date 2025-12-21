sealed class NetworkResult<T> {
  const NetworkResult();
}

class NetworkSuccess<T> extends NetworkResult<T> {
  final T? data;
  const NetworkSuccess({this.data});
}

class NetworkError<T> extends NetworkResult<T> {
  final String message;
  const NetworkError(this.message);
}
