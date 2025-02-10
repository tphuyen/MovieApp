// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String? ?? 'Unknown Title',
      originalTitle: json['originalTitle'] as String? ?? 'Unknown',
      overview: json['overview'] as String? ?? 'No overview available',
      posterPath: json['posterPath'] as String? ?? '',
      backdropPath: json['backdropPath'] as String?,
      mediaType: json['mediaType'] as String? ?? 'movie',
      adult: json['adult'] as bool? ?? false,
      originalLanguage: json['originalLanguage'] as String? ?? 'en',
      genreIds: (json['genreIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      releaseDate: json['releaseDate'] as String? ?? 'Unknown',
      video: json['video'] as bool? ?? false,
      voteAverage: (json['voteAverage'] as num?)?.toDouble() ?? 0.0,
      voteCount: (json['voteCount'] as num?)?.toInt() ?? 0,
      runtime: (json['runtime'] as num?)?.toInt() ?? 0,
      cast: (json['cast'] as List<dynamic>?)
              ?.map((e) => CastMember.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'posterPath': instance.posterPath,
      'backdropPath': instance.backdropPath,
      'mediaType': instance.mediaType,
      'adult': instance.adult,
      'originalLanguage': instance.originalLanguage,
      'genreIds': instance.genreIds,
      'popularity': instance.popularity,
      'releaseDate': instance.releaseDate,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'runtime': instance.runtime,
      'cast': instance.cast,
    };
