import 'package:flutter/material.dart';
import 'package:flutter_news/common/entitys/entitys.dart';
import 'package:flutter_news/common/utils/http.dart';
import 'package:flutter_news/common/values/values.dart';

class NewsAPI {
  // 翻页
  static Future<NewsPageListResponseEntity> newsPageList({
    @required BuildContext context,
    NewsPageListRequestEntity params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/news',
      context: context,
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: STORAGE_INDEX_NEWS_CACHE_KEY,
      params: params?.toJson(),
    );
    return NewsPageListResponseEntity.fromJson(response);
  }

  /// 推荐
  static Future<NewsRecommendResponseEntity> newsRecommend({
    @required BuildContext context,
    NewsRecommendRequestEntity params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/news/recommend',
      context: context,
      params: params?.toJson(),
      refresh: refresh,
      cacheDisk: cacheDisk,
    );
    return NewsRecommendResponseEntity.fromJson(response);
  }

  /// 分类
  static Future<List<CategoryResponseEntity>> categories({
    @required BuildContext context,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/categories',
      context: context,
      cacheDisk: cacheDisk,
    );
    return response
        .map<CategoryResponseEntity>(
            (item) => CategoryResponseEntity.fromJson(item))
        .toList();
  }

  /// 频道
  static Future<List<ChannelResponseEntity>> channels({
    @required BuildContext context,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/channels',
      context: context,
      cacheDisk: cacheDisk,
    );
    return response
        .map<ChannelResponseEntity>(
            (item) => ChannelResponseEntity.fromJson(item))
        .toList();
  }

  /// 标签列表
  static Future<List<TagResponseEntity>> tags({
    @required BuildContext context,
    TagRequestEntity params,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/tags',
      context: context,
      params: params?.toJson(),
      cacheDisk: cacheDisk,
    );
    return response
        .map<TagResponseEntity>((item) => TagResponseEntity.fromJson(item))
        .toList();
  }
}
