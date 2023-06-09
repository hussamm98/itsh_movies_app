import '../../domain/entity/gener_entity.dart';

class GenreModel extends GenresEntity {
  const GenreModel({
    required super.id,
    required super.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
    id: json['id'],
    name: json['name'],
  );
}
