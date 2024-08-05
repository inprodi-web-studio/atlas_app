import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _uuid = prefs.getString('ff_uuid') ?? _uuid;
    });
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
    _safeInit(() {
      _name = prefs.getString('ff_name') ?? _name;
    });
    _safeInit(() {
      _lastName = prefs.getString('ff_lastName') ?? _lastName;
    });
    _safeInit(() {
      _email = prefs.getString('ff_email') ?? _email;
    });
    _safeInit(() {
      _completedProfile =
          prefs.getBool('ff_completedProfile') ?? _completedProfile;
    });
    _safeInit(() {
      _birthdate = prefs.getString('ff_birthdate') ?? _birthdate;
    });
    _safeInit(() {
      _gender = prefs.getString('ff_gender') ?? _gender;
    });
    _safeInit(() {
      _phone = prefs.getString('ff_phone') ?? _phone;
    });
    _safeInit(() {
      _image = prefs.getString('ff_image') ?? _image;
    });
    _safeInit(() {
      _cart = prefs.getStringList('ff_cart')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _cart;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _uuid = '';
  String get uuid => _uuid;
  set uuid(String value) {
    _uuid = value;
    prefs.setString('ff_uuid', value);
  }

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    prefs.setString('ff_token', value);
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
    prefs.setString('ff_name', value);
  }

  String _lastName = '';
  String get lastName => _lastName;
  set lastName(String value) {
    _lastName = value;
    prefs.setString('ff_lastName', value);
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    prefs.setString('ff_email', value);
  }

  bool _completedProfile = false;
  bool get completedProfile => _completedProfile;
  set completedProfile(bool value) {
    _completedProfile = value;
    prefs.setBool('ff_completedProfile', value);
  }

  String _birthdate = '';
  String get birthdate => _birthdate;
  set birthdate(String value) {
    _birthdate = value;
    prefs.setString('ff_birthdate', value);
  }

  String _gender = '';
  String get gender => _gender;
  set gender(String value) {
    _gender = value;
    prefs.setString('ff_gender', value);
  }

  String _phone = '';
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
    prefs.setString('ff_phone', value);
  }

  String _image = '';
  String get image => _image;
  set image(String value) {
    _image = value;
    prefs.setString('ff_image', value);
  }

  List<dynamic> _cart = [];
  List<dynamic> get cart => _cart;
  set cart(List<dynamic> value) {
    _cart = value;
    prefs.setStringList('ff_cart', value.map((x) => jsonEncode(x)).toList());
  }

  void addToCart(dynamic value) {
    cart.add(value);
    prefs.setStringList('ff_cart', _cart.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCart(dynamic value) {
    cart.remove(value);
    prefs.setStringList('ff_cart', _cart.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromCart(int index) {
    cart.removeAt(index);
    prefs.setStringList('ff_cart', _cart.map((x) => jsonEncode(x)).toList());
  }

  void updateCartAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    cart[index] = updateFn(_cart[index]);
    prefs.setStringList('ff_cart', _cart.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInCart(int index, dynamic value) {
    cart.insert(index, value);
    prefs.setStringList('ff_cart', _cart.map((x) => jsonEncode(x)).toList());
  }

  final _memberClubsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> memberClubs({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _memberClubsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMemberClubsCache() => _memberClubsManager.clear();
  void clearMemberClubsCacheKey(String? uniqueKey) =>
      _memberClubsManager.clearRequest(uniqueKey);

  final _noticesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> notices({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _noticesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNoticesCache() => _noticesManager.clear();
  void clearNoticesCacheKey(String? uniqueKey) =>
      _noticesManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
