// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ErrorStruct extends BaseStruct {
  ErrorStruct({
    int? statusCode,
    String? key,
  })  : _statusCode = statusCode,
        _key = key;

  // "statusCode" field.
  int? _statusCode;
  int get statusCode => _statusCode ?? 0;
  set statusCode(int? val) => _statusCode = val;

  void incrementStatusCode(int amount) => statusCode = statusCode + amount;

  bool hasStatusCode() => _statusCode != null;

  // "key" field.
  String? _key;
  String get key => _key ?? '';
  set key(String? val) => _key = val;

  bool hasKey() => _key != null;

  static ErrorStruct fromMap(Map<String, dynamic> data) => ErrorStruct(
        statusCode: castToType<int>(data['statusCode']),
        key: data['key'] as String?,
      );

  static ErrorStruct? maybeFromMap(dynamic data) =>
      data is Map ? ErrorStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'statusCode': _statusCode,
        'key': _key,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'statusCode': serializeParam(
          _statusCode,
          ParamType.int,
        ),
        'key': serializeParam(
          _key,
          ParamType.String,
        ),
      }.withoutNulls;

  static ErrorStruct fromSerializableMap(Map<String, dynamic> data) =>
      ErrorStruct(
        statusCode: deserializeParam(
          data['statusCode'],
          ParamType.int,
          false,
        ),
        key: deserializeParam(
          data['key'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ErrorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ErrorStruct &&
        statusCode == other.statusCode &&
        key == other.key;
  }

  @override
  int get hashCode => const ListEquality().hash([statusCode, key]);
}

ErrorStruct createErrorStruct({
  int? statusCode,
  String? key,
}) =>
    ErrorStruct(
      statusCode: statusCode,
      key: key,
    );
