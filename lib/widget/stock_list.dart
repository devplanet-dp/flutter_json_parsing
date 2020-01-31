import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_parsing/view_models/home_page_view_model.dart';

class StockListWidget extends StatelessWidget{


  final List<StockViewModel> stocks;


  StockListWidget({this.stocks});



  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context,index){
        return Divider(color: Colors.grey[400],);
      },
      itemCount: stocks.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index){
        final stock = stocks[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${stock.symbol}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${stock.description}',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
              )
            ],
          ),
            trailing: Container(
              width: 72,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                child: Text(
                  '\$${stock.price}',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              )
            ),
        );
      },

    );
  }

}