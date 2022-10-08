// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Failure _$FailureFromJson(Map<String, dynamic> json) => Failure(
      statusCode: json['statusCode'] as int,
      statusMessage: json['statusMessage'] as String,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$FailureToJson(Failure instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'success': instance.success,
    };
