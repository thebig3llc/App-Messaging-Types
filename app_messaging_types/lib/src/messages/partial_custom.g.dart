// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partial_custom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartialCustomMessageType _$PartialCustomMessageTypeFromJson(
  Map<String, dynamic> json,
) => PartialCustomMessageType(
  metadata: json['metadata'] as Map<String, dynamic>?,
  repliedMessage:
      json['repliedMessage'] == null
          ? null
          : Message.fromJson(json['repliedMessage'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PartialCustomMessageTypeToJson(
  PartialCustomMessageType instance,
) => <String, dynamic>{
  'metadata': instance.metadata,
  'repliedMessage': instance.repliedMessage,
};
