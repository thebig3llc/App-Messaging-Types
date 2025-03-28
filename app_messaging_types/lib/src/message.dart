import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'messages/audio_message.dart';
import 'messages/custom_message.dart';
import 'messages/file_message.dart';
import 'messages/image_message.dart';
import 'messages/system_message.dart';
import 'messages/text_message.dart';
import 'messages/unsupported_message.dart';
import 'messages/video_message.dart';
import 'user.dart';

/// All possible message types.
enum MessageType {
  audio,
  custom,
  file,
  image,
  system,
  text,
  unsupported,
  video,
}

/// All possible statuses message can have.
enum Status { delivered, error, seen, sending, sent }

/// An abstract class that contains all variables and methods
/// every message will have.
@immutable
abstract class Message extends Equatable {
  const Message({
    required this.author,
    this.createdAt,
    required this.id,
    this.metadata,
    this.remoteId,
    this.repliedMessage,
    this.roomId,
    this.showStatus,
    this.status,
    required this.type,
    this.updatedAt,
  });

  /// Creates a particular message from a map (decoded JSON).
  /// Type is determined by the `type` field.
  factory Message.fromJson(Map<String, dynamic> json) {
    final type = MessageType.values.firstWhere(
      (e) => e.name == json['type'],
      orElse: () => MessageType.unsupported,
    );

    switch (type) {
      case MessageType.audio:
        return AudioMessageType.fromJson(json);
      case MessageType.custom:
        return CustomMessageType.fromJson(json);
      case MessageType.file:
        return FileMessageType.fromJson(json);
      case MessageType.image:
        return ImageMessageType.fromJson(json);
      case MessageType.system:
        return SystemMessageType.fromJson(json);
      case MessageType.text:
        return TextMessageType.fromJson(json);
      case MessageType.unsupported:
        return UnsupportedMessageType.fromJson(json);
      case MessageType.video:
        return VideoMessageType.fromJson(json);
    }
  }

  /// ChatUser who sent this message.
  final ChatUser author;

  /// Created message timestamp, in ms.
  final int? createdAt;

  /// Unique ID of the message.
  final String id;

  /// Additional custom metadata or attributes related to the message.
  final Map<String, dynamic>? metadata;

  /// Unique ID of the message received from the backend.
  final String? remoteId;

  /// Message that is being replied to with the current message.
  final Message? repliedMessage;

  /// ID of the room where this message is sent.
  final String? roomId;

  /// Show status or not.
  final bool? showStatus;

  /// Message [Status].
  final Status? status;

  /// [MessageType].
  final MessageType type;

  /// Updated message timestamp, in ms.
  final int? updatedAt;

  /// Creates a copy of the message with an updated data.
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

  /// Converts a particular message to the map representation, serializable to JSON.
  Map<String, dynamic> toJson();
}
