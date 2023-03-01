// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get token => throw _privateConstructorUsedError;
  bool? get isRegisterMerchant => throw _privateConstructorUsedError;
  MerchantUserModel? get merchantUser => throw _privateConstructorUsedError;
  RegularUserModel? get regularUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? token,
      bool? isRegisterMerchant,
      MerchantUserModel? merchantUser,
      RegularUserModel? regularUser});

  $MerchantUserModelCopyWith<$Res>? get merchantUser;
  $RegularUserModelCopyWith<$Res>? get regularUser;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? isRegisterMerchant = freezed,
    Object? merchantUser = freezed,
    Object? regularUser = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      isRegisterMerchant: freezed == isRegisterMerchant
          ? _value.isRegisterMerchant
          : isRegisterMerchant // ignore: cast_nullable_to_non_nullable
              as bool?,
      merchantUser: freezed == merchantUser
          ? _value.merchantUser
          : merchantUser // ignore: cast_nullable_to_non_nullable
              as MerchantUserModel?,
      regularUser: freezed == regularUser
          ? _value.regularUser
          : regularUser // ignore: cast_nullable_to_non_nullable
              as RegularUserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MerchantUserModelCopyWith<$Res>? get merchantUser {
    if (_value.merchantUser == null) {
      return null;
    }

    return $MerchantUserModelCopyWith<$Res>(_value.merchantUser!, (value) {
      return _then(_value.copyWith(merchantUser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RegularUserModelCopyWith<$Res>? get regularUser {
    if (_value.regularUser == null) {
      return null;
    }

    return $RegularUserModelCopyWith<$Res>(_value.regularUser!, (value) {
      return _then(_value.copyWith(regularUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? token,
      bool? isRegisterMerchant,
      MerchantUserModel? merchantUser,
      RegularUserModel? regularUser});

  @override
  $MerchantUserModelCopyWith<$Res>? get merchantUser;
  @override
  $RegularUserModelCopyWith<$Res>? get regularUser;
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? isRegisterMerchant = freezed,
    Object? merchantUser = freezed,
    Object? regularUser = freezed,
  }) {
    return _then(_$_UserModel(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      isRegisterMerchant: freezed == isRegisterMerchant
          ? _value.isRegisterMerchant
          : isRegisterMerchant // ignore: cast_nullable_to_non_nullable
              as bool?,
      merchantUser: freezed == merchantUser
          ? _value.merchantUser
          : merchantUser // ignore: cast_nullable_to_non_nullable
              as MerchantUserModel?,
      regularUser: freezed == regularUser
          ? _value.regularUser
          : regularUser // ignore: cast_nullable_to_non_nullable
              as RegularUserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {this.token,
      this.isRegisterMerchant,
      this.merchantUser,
      this.regularUser});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String? token;
  @override
  final bool? isRegisterMerchant;
  @override
  final MerchantUserModel? merchantUser;
  @override
  final RegularUserModel? regularUser;

  @override
  String toString() {
    return 'UserModel(token: $token, isRegisterMerchant: $isRegisterMerchant, merchantUser: $merchantUser, regularUser: $regularUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.isRegisterMerchant, isRegisterMerchant) ||
                other.isRegisterMerchant == isRegisterMerchant) &&
            (identical(other.merchantUser, merchantUser) ||
                other.merchantUser == merchantUser) &&
            (identical(other.regularUser, regularUser) ||
                other.regularUser == regularUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, token, isRegisterMerchant, merchantUser, regularUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String? token,
      final bool? isRegisterMerchant,
      final MerchantUserModel? merchantUser,
      final RegularUserModel? regularUser}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String? get token;
  @override
  bool? get isRegisterMerchant;
  @override
  MerchantUserModel? get merchantUser;
  @override
  RegularUserModel? get regularUser;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
