import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_json_parsing/api/stock_api.dart';
import 'package:flutter_json_parsing/model/stock.dart';

class HomePageViewModel extends ChangeNotifier {
  List<StockViewModel> stocks = List<StockViewModel>();
  List<StockViewModel> allStocks = List<StockViewModel>();

  void fetchStocks() async {
    final result = await StockAPI().getStocks();
    var stockMap = json.decode(result);
    StockList stockList = StockList.fromJson(stockMap);
    stocks = stockList.stocks.map((stock) => StockViewModel(stock: stock)).toList();
    allStocks = stocks;
    notifyListeners();
  }

  void search(String searchTerm){
    if(searchTerm.isEmpty){
      stocks = allStocks;
    }else{
      stocks = allStocks.where((stock) => stock.symbol.toLowerCase().contains(searchTerm.toLowerCase())).toList();
    }
    notifyListeners();
  }
}

class StockViewModel {
  final Stock stock;

  StockViewModel({this.stock});

  String get symbol {
    return stock.symbol.toUpperCase();
  }

  String get description {
    return stock.description;
  }

  double get price {
    return stock.price;
  }

  String get change {
    return stock.change;
  }
}
