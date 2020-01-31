// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) {
  return Stock(
      symbol: json['symbol'] as String,
      description: json['description'] as String,
      price: (json['price'] as num)?.toDouble(),
      change: json['change'] as String);
}

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'description': instance.description,
      'price': instance.price,
      'change': instance.change
    };

StockList _$StockListFromJson(Map<String, dynamic> json) {
  return StockList(
      stocks: (json['stocks'] as List)
          ?.map((e) =>
              e == null ? null : Stock.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$StockListToJson(StockList instance) =>
    <String, dynamic>{'stocks': instance.stocks};
