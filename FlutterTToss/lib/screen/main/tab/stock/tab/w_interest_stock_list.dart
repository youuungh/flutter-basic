import 'package:flutter_ttoss/common/common.dart';
import 'package:flutter/material.dart';

import 'dummy_interest_stocks.dart';
import 'w_stock_item.dart';

class InterestStockList extends StatefulWidget {
  const InterestStockList({super.key});

  @override
  State<InterestStockList> createState() => _InterestStockListState();
}

class _InterestStockListState extends State<InterestStockList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height20,
          ...myInterestStocks.map((e) => StockItem(e)).toList(),
        ],
      ),
    );
  }
}
