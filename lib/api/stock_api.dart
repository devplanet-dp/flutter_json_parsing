import 'network.dart';

const String stockAPIURL = "https://api.jsonbin.io/b/5e326355593fd7418572f40e/1";

class StockAPI{
  Future<dynamic> getStocks() async{

    Network network = Network(url: stockAPIURL);
    var stockData = await network.getData();
    print(stockData);
    return stockData;
  }


}