import 'package:json_annotation/json_annotation.dart';
part 'cast.g.dart';

@JsonSerializable()
class CastMember {
  final String imageUrl;
  final String name;

  const CastMember({
    required this.imageUrl,
    required this.name,
  });

  factory CastMember.fromJson(Map<String, dynamic> json) => _$CastMemberFromJson(json);

  Map<String, dynamic> toJson() => _$CastMemberToJson(this);
}
