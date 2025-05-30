import 'package:flutter_ttoss/common/common.dart';
import 'package:flutter_ttoss/screen/main/tab/stock/search/stock_search_data.dart';
import 'package:flutter_ttoss/screen/main/tab/stock/search/w_popular_search_list.dart';
import 'package:flutter_ttoss/screen/main/tab/stock/search/w_search_bar.dart';
import 'package:flutter_ttoss/screen/main/tab/stock/search/w_search_history_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 's_stock_detail.dart';

class StockSearchScreen extends StatefulWidget {
  const StockSearchScreen({super.key});

  @override
  State<StockSearchScreen> createState() => _StockSearchScreenState();
}

class _StockSearchScreenState extends State<StockSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  late final searchData = Get.find<StockSearchData>();

  @override
  void initState() {
    if (!Get.isRegistered<StockSearchData>()) {
      Get.put(StockSearchData());
    }
    _controller.addListener(() {
      searchData.search(_controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    searchData.searchResult.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(controller: _controller),
      body: Obx(
        () => searchData.searchResult.isEmpty
            ? ListView(
                children: const [
                  SearchHistoryList(),
                  PopularSearchList(),
                ],
              )
            : ListView.builder(
                itemCount: searchData.searchResult.length,
                itemBuilder: (BuildContext context, int index) {
                  final element = searchData.searchResult[index];
                  return Tap(
                    onTap: () {
                      Nav.push(StockDetail(stockName: element.name));
                      searchData.addSearchHistory(element.name);
                      _controller.clear();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: element.name.text.make(),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
