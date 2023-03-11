// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buyer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BuyerModel _$BuyerModelFromJson(Map<String, dynamic> json) {
  return _BuyerModel.fromJson(json);
}

/// @nodoc
mixin _$BuyerModel {
  String? get id => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  List<ProductModel>? get productOnCart => throw _privateConstructorUsedError;
  List<OrderModel>? get orders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuyerModelCopyWith<BuyerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyerModelCopyWith<$Res> {
  factory $BuyerModelCopyWith(
          BuyerModel value, $Res Function(BuyerModel) then) =
      _$BuyerModelCopyWithImpl<$Res, BuyerModel>;
  @useResult
  $Res call(
      {String? id,
      String? phoneNumber,
      String? name,
      String? email,
      String? address,
      String? avatar,
      String? password,
      List<ProductModel>? productOnCart,
      List<OrderModel>? orders});
}

/// @nodoc
class _$BuyerModelCopyWithImpl<$Res, $Val extends BuyerModel>
    implements $BuyerModelCopyWith<$Res> {
  _$BuyerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phoneNumber = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? avatar = freezed,
    Object? password = freezed,
    Object? productOnCart = freezed,
    Object? orders = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      productOnCart: freezed == productOnCart
          ? _value.productOnCart
          : productOnCart // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BuyerModelCopyWith<$Res>
    implements $BuyerModelCopyWith<$Res> {
  factory _$$_BuyerModelCopyWith(
          _$_BuyerModel value, $Res Function(_$_BuyerModel) then) =
      __$$_BuyerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? phoneNumber,
      String? name,
      String? email,
      String? address,
      String? avatar,
      String? password,
      List<ProductModel>? productOnCart,
      List<OrderModel>? orders});
}

/// @nodoc
class __$$_BuyerModelCopyWithImpl<$Res>
    extends _$BuyerModelCopyWithImpl<$Res, _$_BuyerModel>
    implements _$$_BuyerModelCopyWith<$Res> {
  __$$_BuyerModelCopyWithImpl(
      _$_BuyerModel _value, $Res Function(_$_BuyerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? phoneNumber = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? avatar = freezed,
    Object? password = freezed,
    Object? productOnCart = freezed,
    Object? orders = freezed,
  }) {
    return _then(_$_BuyerModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      productOnCart: freezed == productOnCart
          ? _value._productOnCart
          : productOnCart // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      orders: freezed == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BuyerModel implements _BuyerModel {
  const _$_BuyerModel(
      {this.id,
      this.phoneNumber,
      this.name,
      this.email,
      this.address,
      this.avatar,
      this.password,
      final List<ProductModel>? productOnCart,
      final List<OrderModel>? orders})
      : _productOnCart = productOnCart,
        _orders = orders;

  factory _$_BuyerModel.fromJson(Map<String, dynamic> json) =>
      _$$_BuyerModelFromJson(json);

  @override
  final String? id;
  @override
  final String? phoneNumber;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? avatar;
  @override
  final String? password;
  final List<ProductModel>? _productOnCart;
  @override
  List<ProductModel>? get productOnCart {
    final value = _productOnCart;
    if (value == null) return null;
    if (_productOnCart is EqualUnmodifiableListView) return _productOnCart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<OrderModel>? _orders;
  @override
  List<OrderModel>? get orders {
    final value = _orders;
    if (value == null) return null;
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BuyerModel(id: $id, phoneNumber: $phoneNumber, name: $name, email: $email, address: $address, avatar: $avatar, password: $password, productOnCart: $productOnCart, orders: $orders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BuyerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.password, password) ||
                other.password == password) &&
            const DeepCollectionEquality()
                .equals(other._productOnCart, _productOnCart) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      phoneNumber,
      name,
      email,
      address,
      avatar,
      password,
      const DeepCollectionEquality().hash(_productOnCart),
      const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BuyerModelCopyWith<_$_BuyerModel> get copyWith =>
      __$$_BuyerModelCopyWithImpl<_$_BuyerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BuyerModelToJson(
      this,
    );
  }
}

abstract class _BuyerModel implements BuyerModel {
  const factory _BuyerModel(
      {final String? id,
      final String? phoneNumber,
      final String? name,
      final String? email,
      final String? address,
      final String? avatar,
      final String? password,
      final List<ProductModel>? productOnCart,
      final List<OrderModel>? orders}) = _$_BuyerModel;

  factory _BuyerModel.fromJson(Map<String, dynamic> json) =
      _$_BuyerModel.fromJson;

  @override
  String? get id;
  @override
  String? get phoneNumber;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get address;
  @override
  String? get avatar;
  @override
  String? get password;
  @override
  List<ProductModel>? get productOnCart;
  @override
  List<OrderModel>? get orders;
  @override
  @JsonKey(ignore: true)
  _$$_BuyerModelCopyWith<_$_BuyerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
