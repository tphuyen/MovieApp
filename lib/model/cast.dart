import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class CastMember {
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'character')
  final String character;

  @JsonKey(name: 'profile_path')
  final String? profilePath;

  CastMember({
    required this.id,
    required this.name,
    required this.character,
    required this.profilePath,
  });

  factory CastMember.fromJson(Map<String, dynamic> json) {
    if (json['name'] == null) {
      print('Error: cast member name is null');
    }
    if (json['profile_path'] == null) {
      print('Error: cast member profile_path is null');
    }

    return _$CastMemberFromJson(json);
  }


  Map<String, dynamic> toJson() => _$CastMemberToJson(this);
}
