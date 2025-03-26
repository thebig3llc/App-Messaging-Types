import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../message.dart';
import '../user.dart';
import 'partial_custom.dart';

part 'custom_message.g.dart';

/// A class that represents custom message. Use [metadata] to store anything
/// you want.
@JsonSerializable()
@immutable
abstract class CustomMessageType extends Message {
  /// Creates a custom message.
  const CustomMessageType._({
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
  }) : super(type: type ?? MessageType.custom);

  const factory CustomMessageType({
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
  }) = _CustomMessageType;

  /// Creates a custom message from a map (decoded JSON).
  factory CustomMessageType.fromJson(Map<String, dynamic> json) =>
      _$CustomMessageTypeFromJson(json);

  /// Creates a full custom message from a partial one.
  factory CustomMessageType.fromPartial({
    required ChatUser author,
    int? createdAt,
    required String id,
    required PartialCustomMessageType partialCustom,
    String? remoteId,
    String? roomId,
    bool? showStatus,
    Status? status,
    int? updatedAt,
  }) => _CustomMessageType(
    author: author,
    createdAt: createdAt,
    id: id,
    metadata: partialCustom.metadata,
    remoteId: remoteId,
    repliedMessage: partialCustom.repliedMessage,
    roomId: roomId,
    showStatus: showStatus,
    status: status,
    type: MessageType.custom,
    updatedAt: updatedAt,
  );

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

  /// Converts a custom message to the map representation,
  /// encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$CustomMessageTypeToJson(this);
}

/// A utility class to enable better copyWith.
class _CustomMessageType extends CustomMessageType {
  const _CustomMessageType({
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
  }) => _CustomMessageType(
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
