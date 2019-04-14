// GENERATED CODE - DO NOT MODIFY BY HAND

part of petstore;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const OrderStatus _$placed = const OrderStatus._('placed');
const OrderStatus _$approved = const OrderStatus._('approved');
const OrderStatus _$delivered = const OrderStatus._('delivered');

OrderStatus _$valueOfOrderStatus(String name) {
  switch (name) {
    case 'placed':
      return _$placed;
    case 'approved':
      return _$approved;
    case 'delivered':
      return _$delivered;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<OrderStatus> _$orderStatusvalues =
    new BuiltSet<OrderStatus>(const <OrderStatus>[
  _$placed,
  _$approved,
  _$delivered,
]);

const PetStatus _$available = const PetStatus._('available');
const PetStatus _$pending = const PetStatus._('pending');
const PetStatus _$sold = const PetStatus._('sold');

PetStatus _$valueOfPetStatus(String name) {
  switch (name) {
    case 'available':
      return _$available;
    case 'pending':
      return _$pending;
    case 'sold':
      return _$sold;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PetStatus> _$petStatusvalues =
    new BuiltSet<PetStatus>(const <PetStatus>[
  _$available,
  _$pending,
  _$sold,
]);

Serializer<Order> _$orderSerializer = new _$OrderSerializer();
Serializer<User> _$userSerializer = new _$UserSerializer();
Serializer<Category> _$categorySerializer = new _$CategorySerializer();
Serializer<Tag> _$tagSerializer = new _$TagSerializer();
Serializer<Pet> _$petSerializer = new _$PetSerializer();
Serializer<ApiResponse> _$apiResponseSerializer = new _$ApiResponseSerializer();
Serializer<OrderStatus> _$orderStatusSerializer = new _$OrderStatusSerializer();
Serializer<PetStatus> _$petStatusSerializer = new _$PetStatusSerializer();

class _$OrderSerializer implements StructuredSerializer<Order> {
  @override
  final Iterable<Type> types = const [Order, _$Order];
  @override
  final String wireName = 'Order';

  @override
  Iterable serialize(Serializers serializers, Order object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.petId != null) {
      result
        ..add('petId')
        ..add(serializers.serialize(object.petId,
            specifiedType: const FullType(int)));
    }
    if (object.quantity != null) {
      result
        ..add('quantity')
        ..add(serializers.serialize(object.quantity,
            specifiedType: const FullType(int)));
    }
    if (object.shipDate != null) {
      result
        ..add('shipDate')
        ..add(serializers.serialize(object.shipDate,
            specifiedType: const FullType(DateTime)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(OrderStatus)));
    }
    if (object.complete != null) {
      result
        ..add('complete')
        ..add(serializers.serialize(object.complete,
            specifiedType: const FullType(bool)));
    }

    return result;
  }

  @override
  Order deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'petId':
          result.petId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'quantity':
          result.quantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'shipDate':
          result.shipDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(OrderStatus)) as OrderStatus;
          break;
        case 'complete':
          result.complete = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.username != null) {
      result
        ..add('username')
        ..add(serializers.serialize(object.username,
            specifiedType: const FullType(String)));
    }
    if (object.firstName != null) {
      result
        ..add('firstName')
        ..add(serializers.serialize(object.firstName,
            specifiedType: const FullType(String)));
    }
    if (object.lastName != null) {
      result
        ..add('lastName')
        ..add(serializers.serialize(object.lastName,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType: const FullType(String)));
    }
    if (object.phone != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(object.phone,
            specifiedType: const FullType(String)));
    }
    if (object.userStatus != null) {
      result
        ..add('userStatus')
        ..add(serializers.serialize(object.userStatus,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userStatus':
          result.userStatus = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$CategorySerializer implements StructuredSerializer<Category> {
  @override
  final Iterable<Type> types = const [Category, _$Category];
  @override
  final String wireName = 'Category';

  @override
  Iterable serialize(Serializers serializers, Category object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Category deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TagSerializer implements StructuredSerializer<Tag> {
  @override
  final Iterable<Type> types = const [Tag, _$Tag];
  @override
  final String wireName = 'Tag';

  @override
  Iterable serialize(Serializers serializers, Tag object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Tag deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TagBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PetSerializer implements StructuredSerializer<Pet> {
  @override
  final Iterable<Type> types = const [Pet, _$Pet];
  @override
  final String wireName = 'Pet';

  @override
  Iterable serialize(Serializers serializers, Pet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'photoUrls',
      serializers.serialize(object.photoUrls,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.category != null) {
      result
        ..add('category')
        ..add(serializers.serialize(object.category,
            specifiedType: const FullType(Category)));
    }
    if (object.tags != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(object.tags,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Tag)])));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(PetStatus)));
    }

    return result;
  }

  @override
  Pet deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'category':
          result.category.replace(serializers.deserialize(value,
              specifiedType: const FullType(Category)) as Category);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrls':
          result.photoUrls.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Tag)]))
              as BuiltList);
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(PetStatus)) as PetStatus;
          break;
      }
    }

    return result.build();
  }
}

class _$ApiResponseSerializer implements StructuredSerializer<ApiResponse> {
  @override
  final Iterable<Type> types = const [ApiResponse, _$ApiResponse];
  @override
  final String wireName = 'ApiResponse';

  @override
  Iterable serialize(Serializers serializers, ApiResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.code != null) {
      result
        ..add('code')
        ..add(serializers.serialize(object.code,
            specifiedType: const FullType(int)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  ApiResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$OrderStatusSerializer implements PrimitiveSerializer<OrderStatus> {
  @override
  final Iterable<Type> types = const <Type>[OrderStatus];
  @override
  final String wireName = 'OrderStatus';

  @override
  Object serialize(Serializers serializers, OrderStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  OrderStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      OrderStatus.valueOf(serialized as String);
}

class _$PetStatusSerializer implements PrimitiveSerializer<PetStatus> {
  @override
  final Iterable<Type> types = const <Type>[PetStatus];
  @override
  final String wireName = 'PetStatus';

  @override
  Object serialize(Serializers serializers, PetStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  PetStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PetStatus.valueOf(serialized as String);
}

class _$Order extends Order {
  @override
  final int id;
  @override
  final int petId;
  @override
  final int quantity;
  @override
  final DateTime shipDate;
  @override
  final OrderStatus status;
  @override
  final bool complete;

  factory _$Order([void updates(OrderBuilder b)]) =>
      (new OrderBuilder()..update(updates)).build();

  _$Order._(
      {this.id,
      this.petId,
      this.quantity,
      this.shipDate,
      this.status,
      this.complete})
      : super._();

  @override
  Order rebuild(void updates(OrderBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderBuilder toBuilder() => new OrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Order &&
        id == other.id &&
        petId == other.petId &&
        quantity == other.quantity &&
        shipDate == other.shipDate &&
        status == other.status &&
        complete == other.complete;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), petId.hashCode),
                    quantity.hashCode),
                shipDate.hashCode),
            status.hashCode),
        complete.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Order')
          ..add('id', id)
          ..add('petId', petId)
          ..add('quantity', quantity)
          ..add('shipDate', shipDate)
          ..add('status', status)
          ..add('complete', complete))
        .toString();
  }
}

class OrderBuilder implements Builder<Order, OrderBuilder> {
  _$Order _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _petId;
  int get petId => _$this._petId;
  set petId(int petId) => _$this._petId = petId;

  int _quantity;
  int get quantity => _$this._quantity;
  set quantity(int quantity) => _$this._quantity = quantity;

  DateTime _shipDate;
  DateTime get shipDate => _$this._shipDate;
  set shipDate(DateTime shipDate) => _$this._shipDate = shipDate;

  OrderStatus _status;
  OrderStatus get status => _$this._status;
  set status(OrderStatus status) => _$this._status = status;

  bool _complete;
  bool get complete => _$this._complete;
  set complete(bool complete) => _$this._complete = complete;

  OrderBuilder();

  OrderBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _petId = _$v.petId;
      _quantity = _$v.quantity;
      _shipDate = _$v.shipDate;
      _status = _$v.status;
      _complete = _$v.complete;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Order other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Order;
  }

  @override
  void update(void updates(OrderBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Order build() {
    final _$result = _$v ??
        new _$Order._(
            id: id,
            petId: petId,
            quantity: quantity,
            shipDate: shipDate,
            status: status,
            complete: complete);
    replace(_$result);
    return _$result;
  }
}

class _$User extends User {
  @override
  final int id;
  @override
  final String username;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String phone;
  @override
  final int userStatus;

  factory _$User([void updates(UserBuilder b)]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phone,
      this.userStatus})
      : super._();

  @override
  User rebuild(void updates(UserBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        username == other.username &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        password == other.password &&
        phone == other.phone &&
        userStatus == other.userStatus;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), username.hashCode),
                            firstName.hashCode),
                        lastName.hashCode),
                    email.hashCode),
                password.hashCode),
            phone.hashCode),
        userStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('id', id)
          ..add('username', username)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('email', email)
          ..add('password', password)
          ..add('phone', phone)
          ..add('userStatus', userStatus))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  int _userStatus;
  int get userStatus => _$this._userStatus;
  set userStatus(int userStatus) => _$this._userStatus = userStatus;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _username = _$v.username;
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _email = _$v.email;
      _password = _$v.password;
      _phone = _$v.phone;
      _userStatus = _$v.userStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void updates(UserBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            id: id,
            username: username,
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            phone: phone,
            userStatus: userStatus);
    replace(_$result);
    return _$result;
  }
}

class _$Category extends Category {
  @override
  final int id;
  @override
  final String name;

  factory _$Category([void updates(CategoryBuilder b)]) =>
      (new CategoryBuilder()..update(updates)).build();

  _$Category._({this.id, this.name}) : super._();

  @override
  Category rebuild(void updates(CategoryBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryBuilder toBuilder() => new CategoryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Category && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Category')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class CategoryBuilder implements Builder<Category, CategoryBuilder> {
  _$Category _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  CategoryBuilder();

  CategoryBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Category other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Category;
  }

  @override
  void update(void updates(CategoryBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Category build() {
    final _$result = _$v ?? new _$Category._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

class _$Tag extends Tag {
  @override
  final int id;
  @override
  final String name;

  factory _$Tag([void updates(TagBuilder b)]) =>
      (new TagBuilder()..update(updates)).build();

  _$Tag._({this.id, this.name}) : super._();

  @override
  Tag rebuild(void updates(TagBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TagBuilder toBuilder() => new TagBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Tag && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Tag')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class TagBuilder implements Builder<Tag, TagBuilder> {
  _$Tag _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  TagBuilder();

  TagBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Tag other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Tag;
  }

  @override
  void update(void updates(TagBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Tag build() {
    final _$result = _$v ?? new _$Tag._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

class _$Pet extends Pet {
  @override
  final int id;
  @override
  final Category category;
  @override
  final String name;
  @override
  final BuiltList<String> photoUrls;
  @override
  final BuiltList<Tag> tags;
  @override
  final PetStatus status;

  factory _$Pet([void updates(PetBuilder b)]) =>
      (new PetBuilder()..update(updates)).build();

  _$Pet._(
      {this.id,
      this.category,
      this.name,
      this.photoUrls,
      this.tags,
      this.status})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Pet', 'name');
    }
    if (photoUrls == null) {
      throw new BuiltValueNullFieldError('Pet', 'photoUrls');
    }
  }

  @override
  Pet rebuild(void updates(PetBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PetBuilder toBuilder() => new PetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pet &&
        id == other.id &&
        category == other.category &&
        name == other.name &&
        photoUrls == other.photoUrls &&
        tags == other.tags &&
        status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), category.hashCode), name.hashCode),
                photoUrls.hashCode),
            tags.hashCode),
        status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Pet')
          ..add('id', id)
          ..add('category', category)
          ..add('name', name)
          ..add('photoUrls', photoUrls)
          ..add('tags', tags)
          ..add('status', status))
        .toString();
  }
}

class PetBuilder implements Builder<Pet, PetBuilder> {
  _$Pet _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  CategoryBuilder _category;
  CategoryBuilder get category => _$this._category ??= new CategoryBuilder();
  set category(CategoryBuilder category) => _$this._category = category;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<String> _photoUrls;
  ListBuilder<String> get photoUrls =>
      _$this._photoUrls ??= new ListBuilder<String>();
  set photoUrls(ListBuilder<String> photoUrls) => _$this._photoUrls = photoUrls;

  ListBuilder<Tag> _tags;
  ListBuilder<Tag> get tags => _$this._tags ??= new ListBuilder<Tag>();
  set tags(ListBuilder<Tag> tags) => _$this._tags = tags;

  PetStatus _status;
  PetStatus get status => _$this._status;
  set status(PetStatus status) => _$this._status = status;

  PetBuilder();

  PetBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _category = _$v.category?.toBuilder();
      _name = _$v.name;
      _photoUrls = _$v.photoUrls?.toBuilder();
      _tags = _$v.tags?.toBuilder();
      _status = _$v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Pet other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Pet;
  }

  @override
  void update(void updates(PetBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Pet build() {
    _$Pet _$result;
    try {
      _$result = _$v ??
          new _$Pet._(
              id: id,
              category: _category?.build(),
              name: name,
              photoUrls: photoUrls.build(),
              tags: _tags?.build(),
              status: status);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'category';
        _category?.build();

        _$failedField = 'photoUrls';
        photoUrls.build();
        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Pet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ApiResponse extends ApiResponse {
  @override
  final int code;
  @override
  final String type;
  @override
  final String message;

  factory _$ApiResponse([void updates(ApiResponseBuilder b)]) =>
      (new ApiResponseBuilder()..update(updates)).build();

  _$ApiResponse._({this.code, this.type, this.message}) : super._();

  @override
  ApiResponse rebuild(void updates(ApiResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseBuilder toBuilder() => new ApiResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponse &&
        code == other.code &&
        type == other.type &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, code.hashCode), type.hashCode), message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ApiResponse')
          ..add('code', code)
          ..add('type', type)
          ..add('message', message))
        .toString();
  }
}

class ApiResponseBuilder implements Builder<ApiResponse, ApiResponseBuilder> {
  _$ApiResponse _$v;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ApiResponseBuilder();

  ApiResponseBuilder get _$this {
    if (_$v != null) {
      _code = _$v.code;
      _type = _$v.type;
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ApiResponse;
  }

  @override
  void update(void updates(ApiResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ApiResponse build() {
    final _$result =
        _$v ?? new _$ApiResponse._(code: code, type: type, message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
