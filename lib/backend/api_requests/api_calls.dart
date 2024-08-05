import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Auth Group Code

class AuthGroup {
  static String getBaseUrl() =>
      'https://atlas-api.clubconnect.mx/api/members/auth';
  static Map<String, String> headers = {};
  static MemberLoginCall memberLoginCall = MemberLoginCall();
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
  static ValidateCodeCall validateCodeCall = ValidateCodeCall();
  static ResendCodeCall resendCodeCall = ResendCodeCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static LogoutCall logoutCall = LogoutCall();
}

class MemberLoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    bool? force,
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}",
  "force": ${force}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Member Login',
      apiUrl: '${baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? uuid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uuid''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lastName''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  bool? completedProfile(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.completedProfile''',
      ));
  dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.image''',
      );
  String? errorKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.key''',
      ));
  String? birthdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.birthdate''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.phone''',
      ));
  String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gender''',
      ));
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Forgot Password',
      apiUrl: '${baseUrl}/request-password',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uuid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uuid''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  String? errorKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.key''',
      ));
}

class ValidateCodeCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? code = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "code": "${code}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Validate Code',
      apiUrl: '${baseUrl}/validate-code/${uuid}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? errorKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.key''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
}

class ResendCodeCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Resend Code',
      apiUrl: '${baseUrl}/validate-code/resend/${uuid}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? password = '',
    String? passwordConfirm = '',
    String? token = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "password": "${password}",
  "passwordConfirm": "${passwordConfirm}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reset Password',
      apiUrl: '${baseUrl}/password-reset',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic uuid(dynamic response) => getJsonField(
        response,
        r'''$.uuid''',
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
  String? errorKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.key''',
      ));
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Logout',
      apiUrl: '${baseUrl}/logout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Auth Group Code

/// Start Member Group Code

class MemberGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://atlas-api.clubconnect.mx/api/members';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static GetMemberProfileCall getMemberProfileCall = GetMemberProfileCall();
  static MemberMetasCall memberMetasCall = MemberMetasCall();
  static CompleteProfileCall completeProfileCall = CompleteProfileCall();
  static GetMemberClubsCall getMemberClubsCall = GetMemberClubsCall();
  static UpdateLastClubCall updateLastClubCall = UpdateLastClubCall();
  static UpdateProfileCall updateProfileCall = UpdateProfileCall();
  static UploadProfileImageCall uploadProfileImageCall =
      UploadProfileImageCall();
  static RemoveProfileImageCall removeProfileImageCall =
      RemoveProfileImageCall();
  static ChangePasswordCall changePasswordCall = ChangePasswordCall();
  static UpdateMetasCall updateMetasCall = UpdateMetasCall();
  static UpdateMetasPROFESSIONCall updateMetasPROFESSIONCall =
      UpdateMetasPROFESSIONCall();
}

class GetMemberProfileCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = MemberGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Member Profile',
      apiUrl: '${baseUrl}/profile',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? gender(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.gender''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.phone''',
      ));
  String? birthdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.birthdate''',
      ));
  List? sports(dynamic response) => getJsonField(
        response,
        r'''$.sports''',
        true,
      ) as List?;
  List? hobbies(dynamic response) => getJsonField(
        response,
        r'''$.hobbies''',
        true,
      ) as List?;
  dynamic? profession(dynamic response) => getJsonField(
        response,
        r'''$.profession''',
      );
  List? hobbyUuid(dynamic response) => getJsonField(
        response,
        r'''$.hobbies[:].uuid''',
        true,
      ) as List?;
  List? sportUuid(dynamic response) => getJsonField(
        response,
        r'''$.sports[:].uuid''',
        true,
      ) as List?;
}

class MemberMetasCall {
  Future<ApiCallResponse> call({
    String? filterType = '',
    String? search = '',
    String? token = '',
  }) async {
    final baseUrl = MemberGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Member Metas',
      apiUrl: '${baseUrl}/profile/user-metas',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'filters[type]': filterType,
        'search': search,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
      );
  dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
      );
  dynamic uuid(dynamic response) => getJsonField(
        response,
        r'''$.data[:].uuid''',
      );
  dynamic iconUrl(dynamic response) => getJsonField(
        response,
        r'''$.data[:].iconURL''',
      );
  dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.data[:].type''',
      );
}

class CompleteProfileCall {
  Future<ApiCallResponse> call({
    String? gender = '',
    String? phone = '',
    String? birthdate = '',
    List<String>? sportsList,
    List<String>? hobbiesList,
    String? profession = '',
    String? token = '',
  }) async {
    final baseUrl = MemberGroup.getBaseUrl(
      token: token,
    );
    final sports = _serializeList(sportsList);
    final hobbies = _serializeList(hobbiesList);

    final ffApiRequestBody = '''
{
  "gender": "${gender}",
  "phone": "${phone}",
  "birthdate": "${birthdate}",
  "sports": ${sports},
  "hobbies": ${hobbies},
  "profession": "${profession}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Complete Profile',
      apiUrl: '${baseUrl}/complete-profile',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMemberClubsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = MemberGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Member Clubs',
      apiUrl: '${baseUrl}/clubs',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? uuid(dynamic response) => (getJsonField(
        response,
        r'''$[:].uuid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? isLast(dynamic response) => (getJsonField(
        response,
        r'''$[:].isLast''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List? data(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class UpdateLastClubCall {
  Future<ApiCallResponse> call({
    String? clubUuid = '',
    String? token = '',
  }) async {
    final baseUrl = MemberGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "club": "${clubUuid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Last Club',
      apiUrl: '${baseUrl}/clubs',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateProfileCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? lastName = '',
    String? email = '',
    String? phone = '',
    String? gender = '',
    String? birthdate = '',
    String? token = '',
  }) async {
    final baseUrl = MemberGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "name": "${name}",
  "lastName": "${lastName}",
  "phone": "${phone}",
  "email": "${email}",
  "gender": "${gender}",
  "birthdate": "${birthdate}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Profile',
      apiUrl: '${baseUrl}/profile',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadProfileImageCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? image,
    String? token = '',
  }) async {
    final baseUrl = MemberGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Upload Profile Image',
      apiUrl: '${baseUrl}/profile/image',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoveProfileImageCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = MemberGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Remove Profile Image',
      apiUrl: '${baseUrl}/profile/image',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangePasswordCall {
  Future<ApiCallResponse> call({
    String? password = '',
    String? passwordConfirm = '',
    String? token = '',
  }) async {
    final baseUrl = MemberGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "password": "${password}",
  "passwordConfirm": "${passwordConfirm}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Change Password',
      apiUrl: '${baseUrl}/profile/password',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateMetasCall {
  Future<ApiCallResponse> call({
    String? type = '',
    List<String>? dataList,
    String? token = '',
  }) async {
    final baseUrl = MemberGroup.getBaseUrl(
      token: token,
    );
    final data = _serializeList(dataList);

    final ffApiRequestBody = '''
{
  "type": "${type}",
  "data": ${data}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Metas ',
      apiUrl: '${baseUrl}/profile/metas',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateMetasPROFESSIONCall {
  Future<ApiCallResponse> call({
    String? type = '',
    String? data = '',
    String? token = '',
  }) async {
    final baseUrl = MemberGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "type": "${type}",
  "data": "${data}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Metas PROFESSION',
      apiUrl: '${baseUrl}/profile/metas',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Member Group Code

/// Start Disciplines Group Code

class DisciplinesGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://atlas-api.clubconnect.mx/api/members';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static FindManyDisciplinesCall findManyDisciplinesCall =
      FindManyDisciplinesCall();
}

class FindManyDisciplinesCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? token = '',
  }) async {
    final baseUrl = DisciplinesGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Many Disciplines',
      apiUrl: '${baseUrl}/disciplines',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'search': search,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?;
  List? uuid(dynamic response) => getJsonField(
        response,
        r'''$.data[:].uuid''',
        true,
      ) as List?;
  List? name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?;
  List? iconUrl(dynamic response) => getJsonField(
        response,
        r'''$.data[:].iconURL''',
        true,
      ) as List?;
}

/// End Disciplines Group Code

/// Start Bookings Group Code

class BookingsGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://atlas-api.clubconnect.mx/api/members';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static FindManyPendingBookingsCall findManyPendingBookingsCall =
      FindManyPendingBookingsCall();
  static FindManyHistoryBookingsCall findManyHistoryBookingsCall =
      FindManyHistoryBookingsCall();
  static GetCalendarNOFIELDCall getCalendarNOFIELDCall =
      GetCalendarNOFIELDCall();
  static GetDaySlotsNOFIELDCall getDaySlotsNOFIELDCall =
      GetDaySlotsNOFIELDCall();
  static GetDaySlotsFIELDCall getDaySlotsFIELDCall = GetDaySlotsFIELDCall();
  static CreateNoFieldBookingCall createNoFieldBookingCall =
      CreateNoFieldBookingCall();
  static CreateRandomFieldBookingCall createRandomFieldBookingCall =
      CreateRandomFieldBookingCall();
  static FindOneBookingCall findOneBookingCall = FindOneBookingCall();
  static GetCalendarFIELDSCall getCalendarFIELDSCall = GetCalendarFIELDSCall();
  static CreateFieldBookingCall createFieldBookingCall =
      CreateFieldBookingCall();
  static CancelBookingCall cancelBookingCall = CancelBookingCall();
  static InviteAttendantsCall inviteAttendantsCall = InviteAttendantsCall();
}

class FindManyPendingBookingsCall {
  Future<ApiCallResponse> call({
    String? sort1 = '',
    String? sort2 = '',
    int? limit = 30,
    String? token = '',
  }) async {
    final baseUrl = BookingsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Many Pending Bookings',
      apiUrl: '${baseUrl}/bookings',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'sort[1]': sort1,
        'sort[2]': sort2,
        'filters[status]': "pending",
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? uuid(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? startHour(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].startHour''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? finishHour(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].finishHour''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? fieldName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].field.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? disciplineIcon(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].discipline.iconURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? attendants(dynamic response) => getJsonField(
        response,
        r'''$.data[:].attendants''',
        true,
      ) as List?;
  List<String>? disciplineName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].discipline.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FindManyHistoryBookingsCall {
  Future<ApiCallResponse> call({
    String? sort1 = '',
    String? sort2 = '',
    int? limit = 30,
    String? token = '',
  }) async {
    final baseUrl = BookingsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Many History Bookings',
      apiUrl: '${baseUrl}/bookings',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'sort[1]': sort1,
        'sort[2]': sort2,
        'filters[status][\$ne]': "pending",
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? uuid(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? startHour(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].startHour''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? finishHour(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].finishHour''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? fieldName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].field.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? disciplineIcon(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].discipline.iconURL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? attendants(dynamic response) => getJsonField(
        response,
        r'''$.data[:].attendants''',
        true,
      ) as List?;
}

class GetCalendarNOFIELDCall {
  Future<ApiCallResponse> call({
    String? disciplineUuid = '',
    String? token = '',
  }) async {
    final baseUrl = BookingsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Calendar NO FIELD',
      apiUrl: '${baseUrl}/bookings/calendar/${disciplineUuid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? totalSlots(dynamic response) => (getJsonField(
        response,
        r'''$[:].totalSlots''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? availableSlots(dynamic response) => (getJsonField(
        response,
        r'''$[:].availableSlots''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? data(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class GetDaySlotsNOFIELDCall {
  Future<ApiCallResponse> call({
    String? day = '',
    String? discipline = '',
    String? token = '',
  }) async {
    final baseUrl = BookingsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Day Slots NO FIELD',
      apiUrl: '${baseUrl}/bookings/slots',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'day': day,
        'discipline': discipline,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? startHour(dynamic response) => getJsonField(
        response,
        r'''$[:].startHour''',
        true,
      ) as List?;
  List? finishHour(dynamic response) => getJsonField(
        response,
        r'''$[:].finishHour''',
        true,
      ) as List?;
  List? isAvailable(dynamic response) => getJsonField(
        response,
        r'''$[:].isAvailable''',
        true,
      ) as List?;
}

class GetDaySlotsFIELDCall {
  Future<ApiCallResponse> call({
    String? day = '',
    String? field = '',
    String? token = '',
  }) async {
    final baseUrl = BookingsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Day Slots FIELD',
      apiUrl: '${baseUrl}/bookings/slots',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'day': day,
        'field': field,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? startHour(dynamic response) => (getJsonField(
        response,
        r'''$[:].startHour''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? finishHour(dynamic response) => (getJsonField(
        response,
        r'''$[:].finishHour''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? isAvailable(dynamic response) => (getJsonField(
        response,
        r'''$[:].isAvailable''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class CreateNoFieldBookingCall {
  Future<ApiCallResponse> call({
    String? date = '',
    String? discipline = '',
    String? slot = '',
    String? token = '',
  }) async {
    final baseUrl = BookingsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "date": "${date}",
  "discipline": "${discipline}",
  "slot": "${slot}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create No Field Booking',
      apiUrl: '${baseUrl}/bookings',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateRandomFieldBookingCall {
  Future<ApiCallResponse> call({
    String? date = '',
    String? discipline = '',
    String? startHour = '',
    String? finishHour = '',
    String? token = '',
  }) async {
    final baseUrl = BookingsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "date": "${date}",
  "discipline": "${discipline}",
  "startHour": "${startHour}",
  "finishHour": "${finishHour}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Random Field Booking',
      apiUrl: '${baseUrl}/bookings',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FindOneBookingCall {
  Future<ApiCallResponse> call({
    String? bookingUuid = '',
    String? token = '',
  }) async {
    final baseUrl = BookingsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find One Booking',
      apiUrl: '${baseUrl}/bookings/${bookingUuid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.date''',
      ));
  String? startHour(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.startHour''',
      ));
  String? finishHour(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.finishHour''',
      ));
  dynamic? fieldName(dynamic response) => getJsonField(
        response,
        r'''$.field.name''',
      );
  String? disciplineName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.discipline.name''',
      ));
  String? uuid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uuid''',
      ));
}

class GetCalendarFIELDSCall {
  Future<ApiCallResponse> call({
    String? disciplineUuid = '',
    String? field = '',
    String? token = '',
  }) async {
    final baseUrl = BookingsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Calendar FIELDS',
      apiUrl: '${baseUrl}/bookings/calendar/${disciplineUuid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'field': field,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? date(dynamic response) => getJsonField(
        response,
        r'''$[:].date''',
        true,
      ) as List?;
  List? totalSlots(dynamic response) => getJsonField(
        response,
        r'''$[:].totalSlots''',
        true,
      ) as List?;
  List? availableSlots(dynamic response) => getJsonField(
        response,
        r'''$[:].availableSlots''',
        true,
      ) as List?;
}

class CreateFieldBookingCall {
  Future<ApiCallResponse> call({
    String? date = '',
    String? field = '',
    String? slot = '',
    String? token = '',
  }) async {
    final baseUrl = BookingsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "date": "${date}",
  "field": "${field}",
  "slot": "${slot}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Field Booking',
      apiUrl: '${baseUrl}/bookings',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelBookingCall {
  Future<ApiCallResponse> call({
    String? bookingUuid = '',
    String? token = '',
  }) async {
    final baseUrl = BookingsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Cancel Booking',
      apiUrl: '${baseUrl}/bookings/cancel/${bookingUuid}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InviteAttendantsCall {
  Future<ApiCallResponse> call({
    List<String>? emailsList,
    String? bookingUuid = '',
    String? token = '',
  }) async {
    final baseUrl = BookingsGroup.getBaseUrl(
      token: token,
    );
    final emails = _serializeList(emailsList);

    final ffApiRequestBody = '''
{
  "emails": ${emails}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Invite Attendants',
      apiUrl: '${baseUrl}/bookings/${bookingUuid}/invite',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Bookings Group Code

/// Start Fields Group Code

class FieldsGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://atlas-api.clubconnect.mx/api/members';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static FindManyFieldsCall findManyFieldsCall = FindManyFieldsCall();
}

class FindManyFieldsCall {
  Future<ApiCallResponse> call({
    String? discipline = '',
    String? token = '',
  }) async {
    final baseUrl = FieldsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Many Fields',
      apiUrl: '${baseUrl}/fields',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'filters[isActive]': true,
        'filters[discipline][uuid]': discipline,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? uuid(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].uuid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? isActive(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].isActive''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List? image(dynamic response) => getJsonField(
        response,
        r'''$.data[:].image''',
        true,
      ) as List?;
}

/// End Fields Group Code

/// Start Events Group Code

class EventsGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://atlas-api.clubconnect.mx/api/members';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static FindManyEventsCall findManyEventsCall = FindManyEventsCall();
  static FindOneEventCall findOneEventCall = FindOneEventCall();
  static EventsByMonthCall eventsByMonthCall = EventsByMonthCall();
  static BookEventCall bookEventCall = BookEventCall();
}

class FindManyEventsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EventsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Many Events',
      apiUrl: '${baseUrl}/events',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FindOneEventCall {
  Future<ApiCallResponse> call({
    String? eventUuid = '',
    String? token = '',
  }) async {
    final baseUrl = EventsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find One Event',
      apiUrl: '${baseUrl}/events/${eventUuid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? uuid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uuid''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.description''',
      ));
  String? startDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.startDate''',
      ));
  String? finishDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.finishDate''',
      ));
  String? startHour(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.startHour''',
      ));
  String? finishHour(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.finishHour''',
      ));
  String? place(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.place''',
      ));
  int? capacity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.capacity''',
      ));
  List? assistants(dynamic response) => getJsonField(
        response,
        r'''$.assistants''',
        true,
      ) as List?;
  int? cost(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.cost''',
      ));
}

class EventsByMonthCall {
  Future<ApiCallResponse> call({
    String? firstDayOfMonth = '',
    String? lastDayOfMonth = '',
    String? token = '',
  }) async {
    final baseUrl = EventsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Events By Month',
      apiUrl: '${baseUrl}/events',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'filters[startDate][\$gte]': firstDayOfMonth,
        'filters[startDate][\$lte]': lastDayOfMonth,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BookEventCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? token = '',
  }) async {
    final baseUrl = EventsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Book Event',
      apiUrl: '${baseUrl}/events/${uuid}/book',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Events Group Code

/// Start Notices Group Code

class NoticesGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://atlas-api.clubconnect.mx/api/member';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static FindManyNoticesCall findManyNoticesCall = FindManyNoticesCall();
  static FindOneNoticeCall findOneNoticeCall = FindOneNoticeCall();
}

class FindManyNoticesCall {
  Future<ApiCallResponse> call({
    int? page,
    String? token = '',
  }) async {
    final baseUrl = NoticesGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Many Notices',
      apiUrl: '${baseUrl}/notices',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'page': page,
        'sort': "createdAt:desc",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? date(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].createdAt''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FindOneNoticeCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? token = '',
  }) async {
    final baseUrl = NoticesGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find One Notice',
      apiUrl: '${baseUrl}/notices/${uuid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Notices Group Code

/// Start Support Group Code

class SupportGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://atlas-api.clubconnect.mx/api/member';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static FindManyTicketsCall findManyTicketsCall = FindManyTicketsCall();
  static FindOneTicketCall findOneTicketCall = FindOneTicketCall();
  static UploadTicketFileCall uploadTicketFileCall = UploadTicketFileCall();
  static CreateTicketCall createTicketCall = CreateTicketCall();
  static SendMessageCall sendMessageCall = SendMessageCall();
  static CancelTicketCall cancelTicketCall = CancelTicketCall();
  static UploadTicketFileUpdateCall uploadTicketFileUpdateCall =
      UploadTicketFileUpdateCall();
  static FindUnreadTicketsCall findUnreadTicketsCall = FindUnreadTicketsCall();
}

class FindManyTicketsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = SupportGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Many Tickets',
      apiUrl: '${baseUrl}/support-tickets',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<TicketStruct>? data(dynamic response) => (getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => TicketStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  List? conversation(dynamic response) => getJsonField(
        response,
        r'''$.data[:].conversation''',
        true,
      ) as List?;
  List? files(dynamic response) => getJsonField(
        response,
        r'''$.data[:].files''',
        true,
      ) as List?;
}

class FindOneTicketCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? token = '',
  }) async {
    final baseUrl = SupportGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find One Ticket',
      apiUrl: '${baseUrl}/support-tickets/${uuid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadTicketFileCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? token = '',
  }) async {
    final baseUrl = SupportGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Upload Ticket File',
      apiUrl: '${baseUrl}/support-tickets/file',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTicketCall {
  Future<ApiCallResponse> call({
    String? subject = '',
    String? description = '',
    String? priority = '',
    List<int>? filesList,
    String? token = '',
  }) async {
    final baseUrl = SupportGroup.getBaseUrl(
      token: token,
    );
    final files = _serializeList(filesList);

    final ffApiRequestBody = '''
{
  "subject": "${subject}",
  "description": "${description}",
  "priority": "${priority}",
  "files": ${files}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Ticket',
      apiUrl: '${baseUrl}/support-tickets',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendMessageCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? message = '',
    String? token = '',
  }) async {
    final baseUrl = SupportGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "message": "${message}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Message',
      apiUrl: '${baseUrl}/support-tickets/${uuid}/message',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelTicketCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? token = '',
  }) async {
    final baseUrl = SupportGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Cancel Ticket',
      apiUrl: '${baseUrl}/support-tickets/${uuid}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadTicketFileUpdateCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    FFUploadedFile? file,
    String? token = '',
  }) async {
    final baseUrl = SupportGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Upload Ticket File Update',
      apiUrl: '${baseUrl}/support-tickets/${uuid}/file',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FindUnreadTicketsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = SupportGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Unread Tickets',
      apiUrl: '${baseUrl}/support-tickets',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'filters[unread][\$contains]': "\"member\": true",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.meta.totalDocs''',
      ));
}

/// End Support Group Code

/// Start Visits Group Code

class VisitsGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://atlas-api.clubconnect.mx/api/member';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static FindManyNextVisitsCall findManyNextVisitsCall =
      FindManyNextVisitsCall();
  static FindOneVisitCall findOneVisitCall = FindOneVisitCall();
  static CreateVisitCall createVisitCall = CreateVisitCall();
  static CancelVisitCall cancelVisitCall = CancelVisitCall();
  static FindHistoryVisitsCall findHistoryVisitsCall = FindHistoryVisitsCall();
}

class FindManyNextVisitsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = VisitsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Many Next Visits',
      apiUrl: '${baseUrl}/visits',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'filters[status]': "open",
        'sort': "date",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FindOneVisitCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? token = '',
  }) async {
    final baseUrl = VisitsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find One Visit',
      apiUrl: '${baseUrl}/visits/${uuid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'uuid': uuid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateVisitCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? lastName = '',
    String? email = '',
    String? phone = '',
    String? date = '',
    String? motive = '',
    String? birthdate = '',
    String? token = '',
  }) async {
    final baseUrl = VisitsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "name": "${name}",
  "lastName": "${lastName}",
  "email": "${email}",
  "phone": "${phone}",
  "date": "${date}",
  "motive": "${motive}",
  "birthdate": "${birthdate}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Visit',
      apiUrl: '${baseUrl}/visits',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelVisitCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? token = '',
  }) async {
    final baseUrl = VisitsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Cancel Visit',
      apiUrl: '${baseUrl}/visits/${uuid}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FindHistoryVisitsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = VisitsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find History Visits',
      apiUrl: '${baseUrl}/visits',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'filters[status][\$ne]': "open",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Visits Group Code

/// Start Projects Group Code

class ProjectsGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://atlas-api.clubconnect.mx/api/member';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static FindManyProjectsCall findManyProjectsCall = FindManyProjectsCall();
  static FindOneProjectCall findOneProjectCall = FindOneProjectCall();
}

class FindManyProjectsCall {
  Future<ApiCallResponse> call({
    int? page,
    String? token = '',
  }) async {
    final baseUrl = ProjectsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Many Projects',
      apiUrl: '${baseUrl}/projects',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'page': page,
        'sort': "createdAt:desc",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FindOneProjectCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? token = '',
  }) async {
    final baseUrl = ProjectsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find One Project',
      apiUrl: '${baseUrl}/projects/${uuid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Projects Group Code

/// Start Products Group Code

class ProductsGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://atlas-api.clubconnect.mx/api/member';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static FindManyProductsCall findManyProductsCall = FindManyProductsCall();
  static FindOneProductCall findOneProductCall = FindOneProductCall();
}

class FindManyProductsCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? token = '',
  }) async {
    final baseUrl = ProductsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Many Products',
      apiUrl: '${baseUrl}/products',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'search': search,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FindOneProductCall {
  Future<ApiCallResponse> call({
    String? uuid = '',
    String? token = '',
  }) async {
    final baseUrl = ProductsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find One Product',
      apiUrl: '${baseUrl}/products/${uuid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Products Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
