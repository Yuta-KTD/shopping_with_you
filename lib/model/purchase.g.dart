// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Purchase _$$_PurchaseFromJson(Map<String, dynamic> json) => _$_Purchase(
      userId: json['userId'] as String,
      groupId: json['groupId'] as String,
      date: DateTime.parse(json['date'] as String),
      name: json['name'] as String,
      amount: json['amount'] as int,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_PurchaseToJson(_$_Purchase instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'groupId': instance.groupId,
      'date': instance.date.toIso8601String(),
      'name': instance.name,
      'amount': instance.amount,
      'category': instance.category,
    };
