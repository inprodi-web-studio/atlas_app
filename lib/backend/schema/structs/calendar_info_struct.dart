// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CalendarInfoStruct extends BaseStruct {
  CalendarInfoStruct({
    List<String>? dates,
    List<int>? availableSlots,
  })  : _dates = dates,
        _availableSlots = availableSlots;

  // "dates" field.
  List<String>? _dates;
  List<String> get dates => _dates ?? const [];
  set dates(List<String>? val) => _dates = val;

  void updateDates(Function(List<String>) updateFn) {
    updateFn(_dates ??= []);
  }

  bool hasDates() => _dates != null;

  // "availableSlots" field.
  List<int>? _availableSlots;
  List<int> get availableSlots => _availableSlots ?? const [];
  set availableSlots(List<int>? val) => _availableSlots = val;

  void updateAvailableSlots(Function(List<int>) updateFn) {
    updateFn(_availableSlots ??= []);
  }

  bool hasAvailableSlots() => _availableSlots != null;

  static CalendarInfoStruct fromMap(Map<String, dynamic> data) =>
      CalendarInfoStruct(
        dates: getDataList(data['dates']),
        availableSlots: getDataList(data['availableSlots']),
      );

  static CalendarInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? CalendarInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dates': _dates,
        'availableSlots': _availableSlots,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dates': serializeParam(
          _dates,
          ParamType.String,
          isList: true,
        ),
        'availableSlots': serializeParam(
          _availableSlots,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static CalendarInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      CalendarInfoStruct(
        dates: deserializeParam<String>(
          data['dates'],
          ParamType.String,
          true,
        ),
        availableSlots: deserializeParam<int>(
          data['availableSlots'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'CalendarInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CalendarInfoStruct &&
        listEquality.equals(dates, other.dates) &&
        listEquality.equals(availableSlots, other.availableSlots);
  }

  @override
  int get hashCode => const ListEquality().hash([dates, availableSlots]);
}

CalendarInfoStruct createCalendarInfoStruct() => CalendarInfoStruct();
