import 'package:equatable/equatable.dart';

class NetworksEntity extends Equatable {
  final int id;
  final String name;
  final String logoPath;

  const NetworksEntity({
    required this.id,
    required this.name,
    required this.logoPath,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        logoPath,
      ];
}
