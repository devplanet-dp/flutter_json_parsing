

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_parsing/model/stock.dart';
import 'package:flutter_json_parsing/view_models/home_page_view_model.dart';
import 'package:flutter_json_parsing/widget/stock_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  StockList stockList = StockList();


  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomePageViewModel>(context);

    return Scaffold(
        body: Stack(children: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child:SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: SizedBox(
                          height: 48,
                          child: TextField(
                            onChanged: _filterStocks,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                hintText: 'Search',
                                fillColor: Colors.grey[800],
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0,style: BorderStyle.none
                                    ),
                                    borderRadius:BorderRadius.all(Radius.circular(5))
                                )
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: StockListWidget(stocks: vm.stocks,),
                      )


                    ],
                  )
              ),
              )
        ]));
  }
  @override
  void initState() {
    super.initState();
    Provider.of<HomePageViewModel>(context,listen: false).fetchStocks();

  }
  void _filterStocks(String searchTerm) {
    print('SEARCH TERM:$searchTerm');
    Provider.of<HomePageViewModel>(context).search(searchTerm);
  }

}