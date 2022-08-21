import 'package:json_annotation/json_annotation.dart';

import 'drink.dart';

part 'mainmodel.g.dart';

@JsonSerializable()
class Mainmodel {
  List<Drink>? drinks;

  Mainmodel({this.drinks});

  factory Mainmodel.fromJson(Map<String, dynamic> json) {
    return _$MainmodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MainmodelToJson(this);
}
