///
/// Created with Android Studio.
/// User: 三帆
/// Date: 18/02/2019
/// Time: 14:19
/// email: sanfan.hx@alibaba-inc.com
/// target: 搜索WidgetDemo中的历史记录model
///

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dev_app/utils/app.dart';

class SearchHistory {
  final String name;
  final String targetRouter;

  SearchHistory({@required this.name, @required this.targetRouter});
}

class SearchHistoryList {
  static List<SearchHistory> _searchHistoryList = [];

  // 存放的最大数量
  int _count = 10;

  SearchHistoryList.fromJSON(String jsonData) {
    _searchHistoryList = [];
    if (jsonData == null) {
      return;
    }
    List jsonList = json.decode(jsonData);
    jsonList.forEach((value) {
      _searchHistoryList.add(SearchHistory(
          name: value['name'], targetRouter: value['targetRouter']));
    });
  }

  List<SearchHistory> getList() {
    return _searchHistoryList;
  }

  clear() {
    App.storage.removeData('searchHistory');
    _searchHistoryList = [];
  }

  save() {
    App.storage.saveData('searchHistory', this.toJson());
  }

  add(SearchHistory item) {
    print("add item to serach history ${item.targetRouter}");
    for (SearchHistory value in _searchHistoryList) {
      if (value.name == item.name) {
        return;
      }
    }
    if (_searchHistoryList.length > _count) {
      _searchHistoryList.removeAt(0);
    }
    _searchHistoryList.add(item);
    save();
  }

  toJson() {
    List<Map<String, String>> jsonList = [];
    _searchHistoryList.forEach((SearchHistory value) {
      jsonList.add({'name': value.name, 'targetRouter': value.targetRouter});
    });
    return json.encode(jsonList);
  }

  @override
  String toString() {
    return this.toJson();
  }
}
