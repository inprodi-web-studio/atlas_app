// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationStruct extends BaseStruct {
  ConversationStruct({
    String? message,
    String? date,
    UserStruct? user,
  })  : _message = message,
        _date = date,
        _user = user;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "user" field.
  UserStruct? _user;
  UserStruct get user => _user ?? UserStruct();
  set user(UserStruct? val) => _user = val;

  void updateUser(Function(UserStruct) updateFn) {
    updateFn(_user ??= UserStruct());
  }

  bool hasUser() => _user != null;

  static ConversationStruct fromMap(Map<String, dynamic> data) =>
      ConversationStruct(
        message: data['message'] as String?,
        date: data['date'] as String?,
        user: UserStruct.maybeFromMap(data['user']),
      );

  static ConversationStruct? maybeFromMap(dynamic data) => data is Map
      ? ConversationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'message': _message,
        'date': _date,
        'user': _user?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'user': serializeParam(
          _user,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ConversationStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConversationStruct(
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        user: deserializeStructParam(
          data['user'],
          ParamType.DataStruct,
          false,
          structBuilder: UserStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ConversationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConversationStruct &&
        message == other.message &&
        date == other.date &&
        user == other.user;
  }

  @override
  int get hashCode => const ListEquality().hash([message, date, user]);
}

ConversationStruct createConversationStruct({
  String? message,
  String? date,
  UserStruct? user,
}) =>
    ConversationStruct(
      message: message,
      date: date,
      user: user ?? UserStruct(),
    );
