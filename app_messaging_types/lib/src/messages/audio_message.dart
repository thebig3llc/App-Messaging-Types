import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../message.dart';
import '../user.dart';
import 'partial_audio.dart';

part 'audio_message.g.dart';

/// A class that represents audio message.
@JsonSerializable()
@immutable
abstract class AudioMessageType extends Message {
  /// Creates an audio message.
  const AudioMessageType._({
    required super.author,
    super.createdAt,
    required this.duration,
    required super.id,
    super.metadata,
    this.mimeType,
    required this.name,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    required this.size,
    super.status,
    MessageType? type,
    super.updatedAt,
    required this.uri,
    this.waveForm,
  }) : super(type: type ?? MessageType.audio);

  const factory AudioMessageType({
    required ChatUser author,
    int? createdAt,
    required Duration duration,
    required String id,
    Map<String, dynamic>? metadata,
    String? mimeType,
    required String name,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    required num size,
    Status? status,
    MessageType? type,
    int? updatedAt,
    required String uri,
    List<double>? waveForm,
  }) = _AudioMessageType;

  /// Creates an audio message from a map (decoded JSON).
  factory AudioMessageType.fromJson(Map<String, dynamic> json) =>
      _$AudioMessageTypeFromJson(json);

  /// Creates a full audio message from a partial one.
  factory AudioMessageType.fromPartial({
    required ChatUser author,
    int? createdAt,
    required String id,
    required PartialAudioMessageType partialAudio,
    String? remoteId,
    String? roomId,
    bool? showStatus,
    Status? status,
    int? updatedAt,
  }) => _AudioMessageType(
    author: author,
    createdAt: createdAt,
    duration: partialAudio.duration,
    id: id,
    metadata: partialAudio.metadata,
    mimeType: partialAudio.mimeType,
    name: partialAudio.name,
    remoteId: remoteId,
    repliedMessage: partialAudio.repliedMessage,
    roomId: roomId,
    showStatus: showStatus,
    size: partialAudio.size,
    status: status,
    type: MessageType.audio,
    updatedAt: updatedAt,
    uri: partialAudio.uri,
    waveForm: partialAudio.waveForm,
  );

  /// The length of the audio.
  final Duration duration;

  /// Media type of the audio file.
  final String? mimeType;

  /// The name of the audio.
  final String name;

  /// Size of the audio in bytes.
  final num size;

  /// The audio file source (either a remote URL or a local resource).
  final String uri;

  /// Wave form represented as a list of decibel levels.
  final List<double>? waveForm;

  /// Equatable props.
  @override
  List<Object?> get props => [
    author,
    createdAt,
    duration,
    id,
    metadata,
    mimeType,
    name,
    remoteId,
    repliedMessage,
    roomId,
    showStatus,
    size,
    status,
    updatedAt,
    uri,
    waveForm,
  ];

  @override
  Message copyWith({
    ChatUser? author,
    int? createdAt,
    Duration? duration,
    String? id,
    Map<String, dynamic>? metadata,
    String? mimeType,
    String? name,
    String? remoteId,
    Message? repliedMessage,
    String? roomId,
    bool? showStatus,
    num? size,
    Status? status,
    int? updatedAt,
    String? uri,
    List<double>? waveForm,
  });

  /// Converts an audio message to the map representation, encodable to JSON.
  @override
  Map<String, dynamic> toJson() => _$AudioMessageTypeToJson(this);
}

/// A utility class to enable better copyWith.
class _AudioMessageType extends AudioMessageType {
  const _AudioMessageType({
    required super.author,
    super.createdAt,
    required super.duration,
    required super.id,
    super.metadata,
    super.mimeType,
    required super.name,
    super.remoteId,
    super.repliedMessage,
    super.roomId,
    super.showStatus,
    required super.size,
    super.status,
    super.type,
    super.updatedAt,
    required super.uri,
    super.waveForm,
  }) : super._();

  @override
  Message copyWith({
    ChatUser? author,
    dynamic createdAt = _Unset,
    Duration? duration,
    String? id,
    dynamic metadata = _Unset,
    dynamic mimeType = _Unset,
    String? name,
    dynamic remoteId = _Unset,
    dynamic repliedMessage = _Unset,
    dynamic roomId,
    dynamic showStatus = _Unset,
    num? size,
    dynamic status = _Unset,
    dynamic updatedAt = _Unset,
    String? uri,
    dynamic waveForm = _Unset,
  }) => _AudioMessageType(
    author: author ?? this.author,
    createdAt: createdAt == _Unset ? this.createdAt : createdAt as int?,
    duration: duration ?? this.duration,
    id: id ?? this.id,
    metadata:
        metadata == _Unset ? this.metadata : metadata as Map<String, dynamic>?,
    mimeType: mimeType == _Unset ? this.mimeType : mimeType as String?,
    name: name ?? this.name,
    remoteId: remoteId == _Unset ? this.remoteId : remoteId as String?,
    repliedMessage:
        repliedMessage == _Unset
            ? this.repliedMessage
            : repliedMessage as Message?,
    roomId: roomId == _Unset ? this.roomId : roomId as String?,
    showStatus: showStatus == _Unset ? this.showStatus : showStatus as bool?,
    size: size ?? this.size,
    status: status == _Unset ? this.status : status as Status?,
    updatedAt: updatedAt == _Unset ? this.updatedAt : updatedAt as int?,
    uri: uri ?? this.uri,
    waveForm: waveForm == _Unset ? this.waveForm : waveForm as List<double>?,
  );
}

class _Unset {}
