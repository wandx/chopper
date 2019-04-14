library petstore;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'petstore.json.built.g.dart';

/// Swagger Petstore
/// 1.0.0
/// This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.
/// Terms: http://swagger.io/terms/
/// email: apiteam@swagger.io
/// Apache 2.0, http://www.apache.org/licenses/LICENSE-2.0.html

abstract class Order implements Built<Order, OrderBuilder> {
  @nullable
  int get id;

  @nullable
  int get petId;

  @nullable
  int get quantity;

  @nullable
  DateTime get shipDate;

  @nullable
  OrderStatus get status;

  @nullable
  bool get complete;

  Order._();
  factory Order([updates(OrderBuilder b)]) = _$Order;
  static Serializer<Order> get serializer => _$orderSerializer;
}

class OrderStatus extends EnumClass {
  static Serializer<OrderStatus> get serializer => _$orderStatusSerializer;

  static const OrderStatus placed = _$placed;
  static const OrderStatus approved = _$approved;
  static const OrderStatus delivered = _$delivered;

  const OrderStatus._(String name) : super(name);
  static BuiltSet<OrderStatus> get values => _$orderStatusvalues;
  static OrderStatus valueOf(String name) => _$valueOfOrderStatus(name);
}

abstract class User implements Built<User, UserBuilder> {
  @nullable
  int get id;

  @nullable
  String get username;

  @nullable
  String get firstName;

  @nullable
  String get lastName;

  @nullable
  String get email;

  @nullable
  String get password;

  @nullable
  String get phone;

  /// User Status
  @nullable
  int get userStatus;

  User._();
  factory User([updates(UserBuilder b)]) = _$User;
  static Serializer<User> get serializer => _$userSerializer;
}

abstract class Category implements Built<Category, CategoryBuilder> {
  @nullable
  int get id;

  @nullable
  String get name;

  Category._();
  factory Category([updates(CategoryBuilder b)]) = _$Category;
  static Serializer<Category> get serializer => _$categorySerializer;
}

abstract class Tag implements Built<Tag, TagBuilder> {
  @nullable
  int get id;

  @nullable
  String get name;

  Tag._();
  factory Tag([updates(TagBuilder b)]) = _$Tag;
  static Serializer<Tag> get serializer => _$tagSerializer;
}

abstract class Pet implements Built<Pet, PetBuilder> {
  @nullable
  int get id;

  @nullable
  Category get category;

  String get name;

  BuiltList<String> get photoUrls;

  @nullable
  BuiltList<Tag> get tags;

  /// pet status in the store
  /// Enum: available, pending, sold
  @nullable
  String get status;

  Pet._();
  factory Pet([updates(PetBuilder b)]) = _$Pet;
  static Serializer<Pet> get serializer => _$petSerializer;
}

abstract class ApiResponse implements Built<ApiResponse, ApiResponseBuilder> {
  @nullable
  int get code;

  @nullable
  String get type;

  @nullable
  String get message;

  ApiResponse._();
  factory ApiResponse([updates(ApiResponseBuilder b)]) = _$ApiResponse;
  static Serializer<ApiResponse> get serializer => _$apiResponseSerializer;
}
