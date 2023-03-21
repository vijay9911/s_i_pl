import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_referral_struct.g.dart';

abstract class UserReferralStruct
    implements Built<UserReferralStruct, UserReferralStructBuilder> {
  static Serializer<UserReferralStruct> get serializer =>
      _$userReferralStructSerializer;

  @BuiltValueField(wireName: 'user-code')
  String? get userCode;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(UserReferralStructBuilder builder) => builder
    ..userCode = ''
    ..firestoreUtilData = FirestoreUtilData();

  UserReferralStruct._();
  factory UserReferralStruct(
          [void Function(UserReferralStructBuilder) updates]) =
      _$UserReferralStruct;
}

UserReferralStruct createUserReferralStruct({
  String? userCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserReferralStruct(
      (u) => u
        ..userCode = userCode
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

UserReferralStruct? updateUserReferralStruct(
  UserReferralStruct? userReferral, {
  bool clearUnsetFields = true,
}) =>
    userReferral != null
        ? (userReferral.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addUserReferralStructData(
  Map<String, dynamic> firestoreData,
  UserReferralStruct? userReferral,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userReferral == null) {
    return;
  }
  if (userReferral.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && userReferral.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userReferralData =
      getUserReferralFirestoreData(userReferral, forFieldValue);
  final nestedData =
      userReferralData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = userReferral.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getUserReferralFirestoreData(
  UserReferralStruct? userReferral, [
  bool forFieldValue = false,
]) {
  if (userReferral == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(UserReferralStruct.serializer, userReferral);

  // Add any Firestore field values
  userReferral.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserReferralListFirestoreData(
  List<UserReferralStruct>? userReferrals,
) =>
    userReferrals?.map((u) => getUserReferralFirestoreData(u, true)).toList() ??
    [];
