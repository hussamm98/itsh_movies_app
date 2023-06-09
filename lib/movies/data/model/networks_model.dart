import 'package:movies_app/movies/domain/entity/networks_entity.dart';


class NetworksModel extends NetworksEntity {
  const NetworksModel({
    required super.id,
    required super.name,
    required super.logoPath,
  });

  factory NetworksModel.fromJson(Map<String, dynamic> json)=>
      NetworksModel(
        id: json['id'], name: json['name'], logoPath: json["logo_path"],);

}
