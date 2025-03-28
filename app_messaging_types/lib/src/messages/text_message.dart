import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../message.dart';
import '../preview_data.dart' show LinkPreviewData;
import '../user.dart';
import 'partial_text.dart';

part 'text_message.g.dart';

/// A class that represents text message.
@JsonSerializable()
@immutable
abstract class TextMessageType extends Message {
  /// Creates a text message.
  const TextMessageType._({
    required super.author,
    super.createdAt,
    required super.id,
    super.metadata,
    this.previewData,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    super.status,
    required this.text,
    MessageType? type,
    super.updatedAt,
  }) : super(type: type ?? MessageType.text);

  const factory TextMessageType({
    required ChatUser author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    LinkPreviewData? previewData,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    required String text,
    MessageType? type,
    int? updatedAt,
  }) = _TextMessageType;

  /// Creates a text message from a map (decoded JSON).
  factory TextMessageType.fromJson(Map<String, dynamic> json) =>
      _$TextMessageTypeFromJson(json);

  /// Creates a full text message from a partial one.
  factory TextMessageType.fromPartial({
    required ChatUser author,
    int? createdAt,
    required String id,
    required PartialTextMessageType partialText,
    String? remoteId,
    String? roomId,
    bool? showStatus,
    Status? status,
    int? updatedAt,
  }) => _TextMessageType(
    author: author,
    createdAt: createdAt,
    id: id,
    metadata: partialText.metadata,
    previewData: partialText.previewData,
    remoteId: remoteId,
    repliedMessage: partialText.repliedMessage,
    roomId: roomId,
    showStatus: showStatus,
    status: status,
    text: partialText.text,
    type: MessageType.text,
    updatedAt: updatedAt,
  );

  /// See [LinkPreviewData].
  final LinkPreviewData? previewData;

  /// ChatUser's message.
  final String text;

  /// Equatable props.
  @override
  List<Object?> get props => [
    author,
    createdAt,
    id,
    metadata,
    previewData,
    remoteId,
    repliedMessage,
    roomId,
    showStatus,
    status,
    text,
    updatedAt,
  ];

  @override
  Message copyWith({
    ChatUser? author,
    int? createdAt,
    String? id,
    Map<String, dynamic>? metadata,
    LinkPreviewData? previewData,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    String? text,
    int? updatedAt,
  });

  /// Converts a text message to the map representation, encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$TextMessageTypeToJson(this);
}

/// A utility class to enable better copyWith.
class _TextMessageType extends TextMessageType {
  const _TextMessageType({
    required super.author,
    super.createdAt,
    required super.id,
    super.metadata,
    super.previewData,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    super.status,
    required super.text,
    super.type,
    super.updatedAt,
  }) : super._();

  @override
  Message copyWith({
    ChatUser? author,
    dynamic createdAt = _Unset,
    String? id,
    dynamic metadata = _Unset,
    dynamic previewData = _Unset,
    dynamic remoteId = _Unset,
    dynamic repliedMessage = _Unset,
    dynamic roomId,
    dynamic showStatus = _Unset,
    dynamic status = _Unset,
    String? text,
    dynamic updatedAt = _Unset,
  }) => _TextMessageType(
    author: author ?? this.author,
    createdAt: createdAt == _Unset ? this.createdAt : createdAt as int?,
    id: id ?? this.id,
    metadata:
        metadata == _Unset ? this.metadata : metadata as Map<String, dynamic>?,
    previewData:
        previewData == _Unset
            ? this.previewData
            : previewData as LinkPreviewData?,
    remoteId: remoteId == _Unset ? this.remoteId : remoteId as String?,
    repliedMessage:
        repliedMessage == _Unset
            ? this.repliedMessage
            : repliedMessage as Message?,
    roomId: roomId == _Unset ? this.roomId : roomId as String?,
    showStatus: showStatus == _Unset ? this.showStatus : showStatus as bool?,
    status: status == _Unset ? this.status : status as Status?,
    text: text ?? this.text,
    updatedAt: updatedAt == _Unset ? this.updatedAt : updatedAt as int?,
  );
}

class _Unset {}
