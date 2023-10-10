
//TODO get ya da post istek atacağın modellere IBaseModel implement et
abstract class IBaseModel<T> {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();

  map(Function(dynamic e) param0) {}
}
