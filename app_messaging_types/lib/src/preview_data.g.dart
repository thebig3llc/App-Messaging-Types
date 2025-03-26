// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkPreviewData _$LinkPreviewDataFromJson(Map<String, dynamic> json) =>
    LinkPreviewData(
      description: json['description'] as String?,
      image:
          json['image'] == null
              ? null
              : LinkPreviewDataImage.fromJson(
                json['image'] as Map<String, dynamic>,
              ),
      link: json['link'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$LinkPreviewDataToJson(LinkPreviewData instance) =>
    <String, dynamic>{
      'description': instance.description,
      'image': instance.image,
      'link': instance.link,
      'title': instance.title,
    };

LinkPreviewDataImage _$LinkPreviewDataImageFromJson(
  Map<String, dynamic> json,
) => LinkPreviewDataImage(
  height: (json['height'] as num).toDouble(),
  url: json['url'] as String,
  width: (json['width'] as num).toDouble(),
);

Map<String, dynamic> _$LinkPreviewDataImageToJson(
  LinkPreviewDataImage instance,
) => <String, dynamic>{
  'height': instance.height,
  'url': instance.url,
  'width': instance.width,
};
