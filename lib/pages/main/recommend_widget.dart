import 'package:flutter/material.dart';
import 'package:flutter_news/common/entitys/entitys.dart';
import 'package:flutter_news/common/utils/screen.dart';
import 'package:flutter_news/common/values/colors.dart';
import 'package:flutter_news/common/widgets/widgets.dart';

// 推荐阅读
Widget recommendWidget(NewsRecommendResponseEntity newsRecommend) {
  return Container(
    margin: EdgeInsets.all(duSetWidth(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 图
        imageCached(newsRecommend.thumbnail,
            width: duSetWidth(335), height: duSetHeight(299)),
        // 作者
        Container(
          margin: EdgeInsets.only(top: duSetHeight(14)),
          child: Text(
            newsRecommend.author,
            style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.normal,
                color: AppColors.thirdElementText,
                fontSize: duSetFontSize(14)),
          ),
        )
      ],
    ),
  );
}
