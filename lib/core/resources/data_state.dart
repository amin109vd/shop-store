abstract class DataState<T>{
  final T? data;
  final String? erroe;

  DataState(this.data, this.erroe);
}
class DataSuccess<T>  extends DataState<T>{
  DataSuccess(T? data) : super(data,null);
}
class DataFailed<T> extends DataState<T>{
  DataFailed(String? error):super(null,error);
}