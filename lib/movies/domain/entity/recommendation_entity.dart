import 'package:equatable/equatable.dart';

class RecommendationEntity extends Equatable {
  final int id;
  final String? backDropPath;

  const RecommendationEntity({
    required this.id,
     this.backDropPath,
  });

  @override
  List<Object?> get props => [
        id,
        backDropPath,
      ];
}
