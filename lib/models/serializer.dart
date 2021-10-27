// Serializer responsible to serialize and deserialize json data
abstract class Serializer<T> {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
