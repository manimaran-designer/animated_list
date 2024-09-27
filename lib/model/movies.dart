import 'package:json_annotation/json_annotation.dart';

part 'movies.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieLists {
  String? movieImageURL;
  String? movieName;

  MovieLists({this.movieImageURL, this.movieName});

  factory MovieLists.fromJson(Map<String, dynamic> json) =>
      _$MovieListsFromJson(json);
  Map<String, dynamic> toJson() => _$MovieListsToJson(this);
}
