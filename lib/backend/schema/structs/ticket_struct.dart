// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketStruct extends BaseStruct {
  TicketStruct({
    String? subject,
    String? description,
    String? priority,
    String? status,
    List<ConversationStruct>? conversation,
    List<FileStruct>? files,
  })  : _subject = subject,
        _description = description,
        _priority = priority,
        _status = status,
        _conversation = conversation,
        _files = files;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "priority" field.
  String? _priority;
  String get priority => _priority ?? '';
  set priority(String? val) => _priority = val;

  bool hasPriority() => _priority != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "conversation" field.
  List<ConversationStruct>? _conversation;
  List<ConversationStruct> get conversation => _conversation ?? const [];
  set conversation(List<ConversationStruct>? val) => _conversation = val;

  void updateConversation(Function(List<ConversationStruct>) updateFn) {
    updateFn(_conversation ??= []);
  }

  bool hasConversation() => _conversation != null;

  // "files" field.
  List<FileStruct>? _files;
  List<FileStruct> get files => _files ?? const [];
  set files(List<FileStruct>? val) => _files = val;

  void updateFiles(Function(List<FileStruct>) updateFn) {
    updateFn(_files ??= []);
  }

  bool hasFiles() => _files != null;

  static TicketStruct fromMap(Map<String, dynamic> data) => TicketStruct(
        subject: data['subject'] as String?,
        description: data['description'] as String?,
        priority: data['priority'] as String?,
        status: data['status'] as String?,
        conversation: getStructList(
          data['conversation'],
          ConversationStruct.fromMap,
        ),
        files: getStructList(
          data['files'],
          FileStruct.fromMap,
        ),
      );

  static TicketStruct? maybeFromMap(dynamic data) =>
      data is Map ? TicketStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'subject': _subject,
        'description': _description,
        'priority': _priority,
        'status': _status,
        'conversation': _conversation?.map((e) => e.toMap()).toList(),
        'files': _files?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'priority': serializeParam(
          _priority,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'conversation': serializeParam(
          _conversation,
          ParamType.DataStruct,
          isList: true,
        ),
        'files': serializeParam(
          _files,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TicketStruct fromSerializableMap(Map<String, dynamic> data) =>
      TicketStruct(
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        priority: deserializeParam(
          data['priority'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        conversation: deserializeStructParam<ConversationStruct>(
          data['conversation'],
          ParamType.DataStruct,
          true,
          structBuilder: ConversationStruct.fromSerializableMap,
        ),
        files: deserializeStructParam<FileStruct>(
          data['files'],
          ParamType.DataStruct,
          true,
          structBuilder: FileStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TicketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TicketStruct &&
        subject == other.subject &&
        description == other.description &&
        priority == other.priority &&
        status == other.status &&
        listEquality.equals(conversation, other.conversation) &&
        listEquality.equals(files, other.files);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([subject, description, priority, status, conversation, files]);
}

TicketStruct createTicketStruct({
  String? subject,
  String? description,
  String? priority,
  String? status,
}) =>
    TicketStruct(
      subject: subject,
      description: description,
      priority: priority,
      status: status,
    );
