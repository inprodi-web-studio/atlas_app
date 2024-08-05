// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FileStruct extends BaseStruct {
  FileStruct({
    String? url,
    int? id,
    String? name,
    double? size,
  })  : _url = url,
        _id = id,
        _name = name,
        _size = size;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "size" field.
  double? _size;
  double get size => _size ?? 0.0;
  set size(double? val) => _size = val;

  void incrementSize(double amount) => size = size + amount;

  bool hasSize() => _size != null;

  static FileStruct fromMap(Map<String, dynamic> data) => FileStruct(
        url: data['url'] as String?,
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        size: castToType<double>(data['size']),
      );

  static FileStruct? maybeFromMap(dynamic data) =>
      data is Map ? FileStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
        'id': _id,
        'name': _name,
        'size': _size,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.double,
        ),
      }.withoutNulls;

  static FileStruct fromSerializableMap(Map<String, dynamic> data) =>
      FileStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'FileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FileStruct &&
        url == other.url &&
        id == other.id &&
        name == other.name &&
        size == other.size;
  }

  @override
  int get hashCode => const ListEquality().hash([url, id, name, size]);
}

FileStruct createFileStruct({
  String? url,
  int? id,
  String? name,
  double? size,
}) =>
    FileStruct(
      url: url,
      id: id,
      name: name,
      size: size,
    );
