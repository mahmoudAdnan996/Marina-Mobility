import 'package:json_annotation/json_annotation.dart';
part 'failure.g.dart';


@JsonSerializable()
class Failure{
  final int statusCode;
  final String statusMessage;
  final bool success;

  Failure({required this.statusCode, required this.statusMessage, required this.success});

  factory Failure.fromJson(Map<String, dynamic> json) => _$FailureFromJson(json);

  Map<String, dynamic> toJson() => _$FailureToJson(this);
}