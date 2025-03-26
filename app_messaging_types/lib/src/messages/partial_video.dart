import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../message.dart';

part 'partial_video.g.dart';

/// A class that represents partial video message.
@JsonSerializable()
@immutable
class PartialVideoMessageType {
  /// Creates a partial video message with all variables video can have.
  /// Use [VideoMessage] to create a full message.
  /// You can use [VideoMessage.fromPartial] constructor to create a full
  /// message from a partial one.
  const PartialVideoMessageType({
    this.height,
    this.metadata,
    required this.name,
    this.repliedMessage,
    required this.size,
    required this.uri,
    this.width,
  });

  /// Creates a partial video message from a map (decoded JSON).
  factory PartialVideoMessageType.fromJson(Map<String, dynamic> json) =>
      _$PartialVideoMessageTypeFromJson(json);

  /// Video height in pixels.
  final double? height;

  /// Additional custom metadata or attributes related to the message.
  final Map<String, dynamic>? metadata;

  /// The name of the video.
  final String name;

  /// Message that is being replied to with the current message.
  final Message? repliedMessage;

  /// Size of the video in bytes.
  final num size;

  /// The video source (either a remote URL or a local resource).
  final String uri;

  /// Video width in pixels.
  final double? width;

  /// Converts a partial video message to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$PartialVideoMessageTypeToJson(this);
}
