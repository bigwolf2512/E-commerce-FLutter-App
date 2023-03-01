// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MerchantUserModel _$MerchantUserModelFromJson(Map<String, dynamic> json) {
  return _MerchantUserModel.fromJson(json);
}

/// @nodoc
mixin _$MerchantUserModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get storePhoneNumber => throw _privateConstructorUsedError;
  String? get storeAddress => throw _privateConstructorUsedError;
  List<ProductModel>? get productOnSale => throw _privateConstructorUsedError;
  List<OrderModel>? get orders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MerchantUserModelCopyWith<MerchantUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantUserModelCopyWith<$Res> {
  factory $MerchantUserModelCopyWith(
          MerchantUserModel value, $Res Function(MerchantUserModel) then) =
      _$MerchantUserModelCopyWithImpl<$Res, MerchantUserModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? email,
      String? storePhoneNumber,
      String? storeAddress,
      List<ProductModel>? productOnSale,
      List<OrderModel>? orders});
}

/// @nodoc
class _$MerchantUserModelCopyWithImpl<$Res, $Val extends MerchantUserModel>
    implements $MerchantUserModelCopyWith<$Res> {
  _$MerchantUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? storePhoneNumber = freezed,
    Object? storeAddress = freezed,
    Object? productOnSale = freezed,
    Object? orders = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      storePhoneNumber: freezed == storePhoneNumber
          ? _value.storePhoneNumber
          : storePhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      storeAddress: freezed == storeAddress
          ? _value.storeAddress
          : storeAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      productOnSale: freezed == productOnSale
          ? _value.productOnSale
          : productOnSale // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      orders: freezed == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MerchantUserModelCopyWith<$Res>
    implements $MerchantUserModelCopyWith<$Res> {
  factory _$$_MerchantUserModelCopyWith(_$_MerchantUserModel value,
          $Res Function(_$_MerchantUserModel) then) =
      __$$_MerchantUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? email,
      String? storePhoneNumber,
      String? storeAddress,
      List<ProductModel>? productOnSale,
      List<OrderModel>? orders});
}

/// @nodoc
class __$$_MerchantUserModelCopyWithImpl<$Res>
    extends _$MerchantUserModelCopyWithImpl<$Res, _$_MerchantUserModel>
    implements _$$_MerchantUserModelCopyWith<$Res> {
  __$$_MerchantUserModelCopyWithImpl(
      _$_MerchantUserModel _value, $Res Function(_$_MerchantUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? storePhoneNumber = freezed,
    Object? storeAddress = freezed,
    Object? productOnSale = freezed,
    Object? orders = freezed,
  }) {
    return _then(_$_MerchantUserModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      storePhoneNumber: freezed == storePhoneNumber
          ? _value.storePhoneNumber
          : storePhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      storeAddress: freezed == storeAddress
          ? _value.storeAddress
          : storeAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      productOnSale: freezed == productOnSale
          ? _value._productOnSale
          : productOnSale // ignore: cast_nullable_to_non_nullable
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
class _$_MerchantUserModel implements _MerchantUserModel {
  const _$_MerchantUserModel(
      {this.id,
      this.name,
      this.email,
      this.storePhoneNumber,
      this.storeAddress,
      final List<ProductModel>? productOnSale,
      final List<OrderModel>? orders})
      : _productOnSale = productOnSale,
        _orders = orders;

  factory _$_MerchantUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_MerchantUserModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? storePhoneNumber;
  @override
  final String? storeAddress;
  final List<ProductModel>? _productOnSale;
  @override
  List<ProductModel>? get productOnSale {
    final value = _productOnSale;
    if (value == null) return null;
    if (_productOnSale is EqualUnmodifiableListView) return _productOnSale;
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
    return 'MerchantUserModel(id: $id, name: $name, email: $email, storePhoneNumber: $storePhoneNumber, storeAddress: $storeAddress, productOnSale: $productOnSale, orders: $orders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MerchantUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.storePhoneNumber, storePhoneNumber) ||
                other.storePhoneNumber == storePhoneNumber) &&
            (identical(other.storeAddress, storeAddress) ||
                other.storeAddress == storeAddress) &&
            const DeepCollectionEquality()
                .equals(other._productOnSale, _productOnSale) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      storePhoneNumber,
      storeAddress,
      const DeepCollectionEquality().hash(_productOnSale),
      const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MerchantUserModelCopyWith<_$_MerchantUserModel> get copyWith =>
      __$$_MerchantUserModelCopyWithImpl<_$_MerchantUserModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MerchantUserModelToJson(
      this,
    );
  }
}

abstract class _MerchantUserModel implements MerchantUserModel {
  const factory _MerchantUserModel(
      {final int? id,
      final String? name,
      final String? email,
      final String? storePhoneNumber,
      final String? storeAddress,
      final List<ProductModel>? productOnSale,
      final List<OrderModel>? orders}) = _$_MerchantUserModel;

  factory _MerchantUserModel.fromJson(Map<String, dynamic> json) =
      _$_MerchantUserModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get storePhoneNumber;
  @override
  String? get storeAddress;
  @override
  List<ProductModel>? get productOnSale;
  @override
  List<OrderModel>? get orders;
  @override
  @JsonKey(ignore: true)
  _$$_MerchantUserModelCopyWith<_$_MerchantUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
