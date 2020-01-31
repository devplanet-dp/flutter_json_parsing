import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

@JsonSerializable()
class Stock {
  String symbol;
  String description;
  double price;
  String change;

  Stock({this.symbol, this.description, this.price, this.change});

  factory Stock.fromJson(Map<String,dynamic> json) => _$StockFromJson(json);

  Map<String,dynamic> toJson() => _$StockToJson(this);



}

@JsonSerializable()
class StockList{
  List<Stock> stocks;

  StockList({this.stocks});

  factory StockList.fromJson(List<dynamic> json){
    return StockList(
      stocks: json
          .map((e) => Stock.fromJson(e as Map<String,dynamic>))
          .toList()
    );
  }


}
