// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_referral_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserReferralStruct> _$userReferralStructSerializer =
    new _$UserReferralStructSerializer();

class _$UserReferralStructSerializer
    implements StructuredSerializer<UserReferralStruct> {
  @override
  final Iterable<Type> types = const [UserReferralStruct, _$UserReferralStruct];
  @override
  final String wireName = 'UserReferralStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserReferralStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.userCode;
    if (value != null) {
      result
        ..add('user-code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserReferralStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserReferralStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user-code':
          result.userCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$UserReferralStruct extends UserReferralStruct {
  @override
  final String? userCode;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$UserReferralStruct(
          [void Function(UserReferralStructBuilder)? updates]) =>
      (new UserReferralStructBuilder()..update(updates))._build();

  _$UserReferralStruct._({this.userCode, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'UserReferralStruct', 'firestoreUtilData');
  }

  @override
  UserReferralStruct rebuild(
          void Function(UserReferralStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserReferralStructBuilder toBuilder() =>
      new UserReferralStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserReferralStruct &&
        userCode == other.userCode &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, userCode.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserReferralStruct')
          ..add('userCode', userCode)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class UserReferralStructBuilder
    implements Builder<UserReferralStruct, UserReferralStructBuilder> {
  _$UserReferralStruct? _$v;

  String? _userCode;
  String? get userCode => _$this._userCode;
  set userCode(String? userCode) => _$this._userCode = userCode;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  UserReferralStructBuilder() {
    UserReferralStruct._initializeBuilder(this);
  }

  UserReferralStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userCode = $v.userCode;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserReferralStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserReferralStruct;
  }

  @override
  void update(void Function(UserReferralStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserReferralStruct build() => _build();

  _$UserReferralStruct _build() {
    final _$result = _$v ??
        new _$UserReferralStruct._(
            userCode: userCode,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'UserReferralStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
