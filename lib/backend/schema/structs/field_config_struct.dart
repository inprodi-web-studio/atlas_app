// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FieldConfigStruct extends BaseStruct {
  FieldConfigStruct({
    int? id,
    String? fieldAssociation,
  })  : _id = id,
        _fieldAssociation = fieldAssociation;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "fieldAssociation" field.
  String? _fieldAssociation;
  String get fieldAssociation => _fieldAssociation ?? '';
  set fieldAssociation(String? val) => _fieldAssociation = val;

  bool hasFieldAssociation() => _fieldAssociation != null;

  static FieldConfigStruct fromMap(Map<String, dynamic> data) =>
      FieldConfigStruct(
        id: castToType<int>(data['id']),
        fieldAssociation: data['fieldAssociation'] as String?,
      );

  static FieldConfigStruct? maybeFromMap(dynamic data) => data is Map
      ? FieldConfigStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'fieldAssociation': _fieldAssociation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'fieldAssociation': serializeParam(
          _fieldAssociation,
          ParamType.String,
        ),
      }.withoutNulls;

  static FieldConfigStruct fromSerializableMap(Map<String, dynamic> data) =>
      FieldConfigStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        fieldAssociation: deserializeParam(
          data['fieldAssociation'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FieldConfigStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FieldConfigStruct &&
        id == other.id &&
        fieldAssociation == other.fieldAssociation;
  }

  @override
  int get hashCode => const ListEquality().hash([id, fieldAssociation]);
}

FieldConfigStruct createFieldConfigStruct({
  int? id,
  String? fieldAssociation,
}) =>
    FieldConfigStruct(
      id: id,
      fieldAssociation: fieldAssociation,
    );
