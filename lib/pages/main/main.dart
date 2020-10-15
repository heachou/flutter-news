import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_news/common/apis/news.dart';
import 'package:flutter_news/common/entitys/entitys.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/pages/main/categories_widget.dart';
import 'package:flutter_news/pages/main/channels_widget.dart';
import 'package:flutter_news/pages/main/news_item_widget.dart';
import 'package:flutter_news/pages/main/newsletter_widget.dart';
import 'package:flutter_news/pages/main/recommend_widget.dart';
import 'package:pk_skeleton/pk_skeleton.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller; // EasyRefresh控制器
  NewsPageListResponseEntity _newsPageList; // 新闻翻页
  NewsRecommendResponseEntity _newsRecommend; // 新闻推荐
  List<CategoryResponseEntity> _categories; // 分类
  List<ChannelResponseEntity> _channels; // 频道

  String _selCategoryCode;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _loadAllData();
    _loadLatestWithDiskCache();
  }

  @override
  bool get wantKeepAlive => true;
  // 如果有磁盘缓存，延迟3秒拉取更新档案
  _loadLatestWithDiskCache() {
    if (CACHE_ENABLE == true) {
      var cacheData = StorageUtil().getJSON(STORAGE_INDEX_NEWS_CACHE_KEY);
      if (cacheData != null) {
        Timer(Duration(seconds: 3), () {
          _controller.callRefresh();
        });
      }
    }
  }

  // 读取所有数据
  _loadAllData() async {
    _categories = await NewsAPI.categories(
      context: context,
      cacheDisk: true,
    );
    _channels = await NewsAPI.channels(
      context: context,
      cacheDisk: true,
    );
    _newsRecommend = await NewsAPI.newsRecommend(
      context: context,
      cacheDisk: true,
    );
    _newsPageList = await NewsAPI.newsPageList(
      context: context,
      cacheDisk: true,
    );

    _selCategoryCode = _categories.first.code;

    if (mounted) {
      setState(() {});
    }
  }

  // 拉取推荐、新闻
  _loadNewsData(
    categoryCode, {
    bool refresh = false,
  }) async {
    _selCategoryCode = categoryCode;
    _newsRecommend = await NewsAPI.newsRecommend(
      context: context,
      params: NewsRecommendRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );
    _newsPageList = await NewsAPI.newsPageList(
      context: context,
      params: NewsPageListRequestEntity(categoryCode: categoryCode),
      refresh: refresh,
      cacheDisk: true,
    );

    if (mounted) {
      setState(() {});
    }
  }

  // 分类菜单
  Widget _buildCategories() {
    return _categories == null
        ? Container()
        : newsCategoriesWidget(
            categories: _categories,
            selCategoryCode: _selCategoryCode,
            onTap: (CategoryResponseEntity item) {
              setState(() {
                _selCategoryCode = item.code;
              });
            },
          );
  }

  // 推荐阅读
  Widget _buildRecommend() {
    return _newsRecommend == null
        ? Container()
        : recommendWidget(_newsRecommend);
  }

  // 频道
  Widget _buildChannels() {
    return _channels == null
        ? Container()
        : newsChannelsWidget(
            channels: _channels,
            onTap: (ChannelResponseEntity item) {},
          );
  }

  // 新闻列表
  Widget _buildNewsList() {
    return _newsPageList == null
        ? Container(
            height: duSetHeight(161 * 5 + 100.0),
          )
        : Column(
            children: _newsPageList.items.map((item) {
              return Column(
                children: <Widget>[
                  newsItem(item),
                  Divider(
                    height: 1,
                  )
                ],
              );
            }).toList(),
          );
  }

  // ad 广告条
  // 邮件订阅
  Widget _buildEmailSubscribe() {
    return newsletterWidget();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _newsPageList == null
        ? PKCardListSkeleton()
        : EasyRefresh(
            enableControlFinishRefresh: true,
            controller: _controller,
            header: DeliveryHeader(),
            onRefresh: () async {
              await _loadNewsData(
                _selCategoryCode,
                refresh: true,
              );
              _controller.finishRefresh();
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildCategories(),
                  _buildRecommend(),
                  _buildChannels(),
                  _buildNewsList(),
                  _buildEmailSubscribe(),
                ],
              ),
            ),
          );
  }
}
