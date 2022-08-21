// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mainmodel _$MainmodelFromJson(Map<String, dynamic> json) => Mainmodel(
      drinks: (json['drinks'] as List<dynamic>?)
          ?.map((e) => Drink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MainmodelToJson(Mainmodel instance) => <String, dynamic>{
      'drinks': instance.drinks,
    };
