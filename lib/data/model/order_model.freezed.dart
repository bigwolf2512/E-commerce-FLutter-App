// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String? get id => throw _privateConstructorUsedError;
  SellerModel? get seller => throw _privateConstructorUsedError;
  BuyerModel? get buyer => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;
  DateTime? get boughtDate => throw _privateConstructorUsedError;
  DateTime? get receiveExpectDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String? id,
      SellerModel? seller,
      BuyerModel? buyer,
      ProductModel? product,
      DateTime? boughtDate,
      DateTime? receiveExpectDate});

  $SellerModelCopyWith<$Res>? get seller;
  $BuyerModelCopyWith<$Res>? get buyer;
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? seller = freezed,
    Object? buyer = freezed,
    Object? product = freezed,
    Object? boughtDate = freezed,
    Object? receiveExpectDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as SellerModel?,
      buyer: freezed == buyer
          ? _value.buyer
          : buyer // ignore: cast_nullable_to_non_nullable
              as BuyerModel?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      boughtDate: freezed == boughtDate
          ? _value.boughtDate
          : boughtDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      receiveExpectDate: freezed == receiveExpectDate
          ? _value.receiveExpectDate
          : receiveExpectDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SellerModelCopyWith<$Res>? get seller {
    if (_value.seller == null) {
      return null;
    }

    return $SellerModelCopyWith<$Res>(_value.seller!, (value) {
      return _then(_value.copyWith(seller: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BuyerModelCopyWith<$Res>? get buyer {
    if (_value.buyer == null) {
      return null;
    }

    return $BuyerModelCopyWith<$Res>(_value.buyer!, (value) {
      return _then(_value.copyWith(buyer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$_OrderModelCopyWith(
          _$_OrderModel value, $Res Function(_$_OrderModel) then) =
      __$$_OrderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      SellerModel? seller,
      BuyerModel? buyer,
      ProductModel? product,
      DateTime? boughtDate,
      DateTime? receiveExpectDate});

  @override
  $SellerModelCopyWith<$Res>? get seller;
  @override
  $BuyerModelCopyWith<$Res>? get buyer;
  @override
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$_OrderModelCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$_OrderModel>
    implements _$$_OrderModelCopyWith<$Res> {
  __$$_OrderModelCopyWithImpl(
      _$_OrderModel _value, $Res Function(_$_OrderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? seller = freezed,
    Object? buyer = freezed,
    Object? product = freezed,
    Object? boughtDate = freezed,
    Object? receiveExpectDate = freezed,
  }) {
    return _then(_$_OrderModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as SellerModel?,
      buyer: freezed == buyer
          ? _value.buyer
          : buyer // ignore: cast_nullable_to_non_nullable
              as BuyerModel?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      boughtDate: freezed == boughtDate
          ? _value.boughtDate
          : boughtDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      receiveExpectDate: freezed == receiveExpectDate
          ? _value.receiveExpectDate
          : receiveExpectDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderModel implements _OrderModel {
  const _$_OrderModel(
      {this.id,
      this.seller,
      this.buyer,
      this.product,
      this.boughtDate,
      this.receiveExpectDate});

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderModelFromJson(json);

  @override
  final String? id;
  @override
  final SellerModel? seller;
  @override
  final BuyerModel? buyer;
  @override
  final ProductModel? product;
  @override
  final DateTime? boughtDate;
  @override
  final DateTime? receiveExpectDate;

  @override
  String toString() {
    return 'OrderModel(id: $id, seller: $seller, buyer: $buyer, product: $product, boughtDate: $boughtDate, receiveExpectDate: $receiveExpectDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            (identical(other.buyer, buyer) || other.buyer == buyer) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.boughtDate, boughtDate) ||
                other.boughtDate == boughtDate) &&
            (identical(other.receiveExpectDate, receiveExpectDate) ||
                other.receiveExpectDate == receiveExpectDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, seller, buyer, product, boughtDate, receiveExpectDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      __$$_OrderModelCopyWithImpl<_$_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderModelToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {final String? id,
      final SellerModel? seller,
      final BuyerModel? buyer,
      final ProductModel? product,
      final DateTime? boughtDate,
      final DateTime? receiveExpectDate}) = _$_OrderModel;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override
  String? get id;
  @override
  SellerModel? get seller;
  @override
  BuyerModel? get buyer;
  @override
  ProductModel? get product;
  @override
  DateTime? get boughtDate;
  @override
  DateTime? get receiveExpectDate;
  @override
  @JsonKey(ignore: true)
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
