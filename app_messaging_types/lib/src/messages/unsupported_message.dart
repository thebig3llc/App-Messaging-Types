import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../message.dart';
import '../user.dart';

part 'unsupported_message.g.dart';

/// A class that represents unsupported message. Used for backwards
/// compatibility. If chat's end user doesn't update to a new version
/// where new message types are being sent, some of them will result
/// to unsupported.
@JsonSerializable()
@immutable
abstract class UnsupportedMessageType extends Message {
  /// Creates an unsupported message.
  const UnsupportedMessageType._({
    required super.author,
    super.createdAt,
    required super.id,
    super.metadata,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    super.status,
    MessageType? type,
    super.updatedAt,
  }) : super(type: type ?? MessageType.unsupported);

  const factory UnsupportedMessageType({
    required ChatUser author,
    int? createdAt,
    required String id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    MessageType? type,
    int? updatedAt,
  }) = _UnsupportedMessageType;

  /// Creates an unsupported message from a map (decoded JSON).
  factory UnsupportedMessageType.fromJson(Map<String, dynamic> json) =>
      _$UnsupportedMessageTypeFromJson(json);

  /// Equatable props.
  @override
  List<Object?> get props => [
    author,
    createdAt,
    id,
    metadata,
    remoteId,
    repliedMessage,
    roomId,
    showStatus,
    status,
    updatedAt,
  ];

  @override
  Message copyWith({
    ChatUser? author,
    int? createdAt,
    String? id,
    Map<String, dynamic>? metadata,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    Status? status,
    int? updatedAt,
  });

  /// Converts an unsupported message to the map representation,
  /// encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$UnsupportedMessageTypeToJson(this);
}

/// A utility class to enable better copyWith.
class _UnsupportedMessageType extends UnsupportedMessageType {
  const _UnsupportedMessageType({
    required super.author,
    super.createdAt,
    required super.id,
    super.metadata,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    super.status,
    super.type,
    super.updatedAt,
  }) : super._();

  @override
  Message copyWith({
    ChatUser? author,
    dynamic createdAt = _Unset,
    String? id,
    dynamic metadata = _Unset,
    dynamic remoteId = _Unset,
    dynamic repliedMessage = _Unset,
    dynamic roomId,
    dynamic showStatus = _Unset,
    dynamic status = _Unset,
    dynamic updatedAt = _Unset,
  }) => _UnsupportedMessageType(
    author: author ?? this.author,
    createdAt: createdAt == _Unset ? this.createdAt : createdAt as int?,
    id: id ?? this.id,
    metadata:
        metadata == _Unset ? this.metadata : metadata as Map<String, dynamic>?,
    remoteId: remoteId == _Unset ? this.remoteId : remoteId as String?,
    repliedMessage:
        repliedMessage == _Unset
            ? this.repliedMessage
            : repliedMessage as Message?,
    roomId: roomId == _Unset ? this.roomId : roomId as String?,
    showStatus: showStatus == _Unset ? this.showStatus : showStatus as bool?,
    status: status == _Unset ? this.status : status as Status?,
    updatedAt: updatedAt == _Unset ? this.updatedAt : updatedAt as int?,
  );
}

class _Unset {}
