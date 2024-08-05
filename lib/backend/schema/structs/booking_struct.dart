// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingStruct extends BaseStruct {
  BookingStruct({
    String? status,
    String? startHour,
    String? finishHour,
  })  : _status = status,
        _startHour = startHour,
        _finishHour = finishHour;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "startHour" field.
  String? _startHour;
  String get startHour => _startHour ?? '';
  set startHour(String? val) => _startHour = val;

  bool hasStartHour() => _startHour != null;

  // "finishHour" field.
  String? _finishHour;
  String get finishHour => _finishHour ?? '';
  set finishHour(String? val) => _finishHour = val;

  bool hasFinishHour() => _finishHour != null;

  static BookingStruct fromMap(Map<String, dynamic> data) => BookingStruct(
        status: data['status'] as String?,
        startHour: data['startHour'] as String?,
        finishHour: data['finishHour'] as String?,
      );

  static BookingStruct? maybeFromMap(dynamic data) =>
      data is Map ? BookingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'startHour': _startHour,
        'finishHour': _finishHour,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'startHour': serializeParam(
          _startHour,
          ParamType.String,
        ),
        'finishHour': serializeParam(
          _finishHour,
          ParamType.String,
        ),
      }.withoutNulls;

  static BookingStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookingStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        startHour: deserializeParam(
          data['startHour'],
          ParamType.String,
          false,
        ),
        finishHour: deserializeParam(
          data['finishHour'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BookingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BookingStruct &&
        status == other.status &&
        startHour == other.startHour &&
        finishHour == other.finishHour;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([status, startHour, finishHour]);
}

BookingStruct createBookingStruct({
  String? status,
  String? startHour,
  String? finishHour,
}) =>
    BookingStruct(
      status: status,
      startHour: startHour,
      finishHour: finishHour,
    );
