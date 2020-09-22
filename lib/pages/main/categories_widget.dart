import 'package:flutter/cupertino.dart';
import 'package:flutter_news/common/entitys/entitys.dart';
import 'package:flutter_news/common/utils/screen.dart';
import 'package:flutter_news/common/values/colors.dart';

Widget newsCategoriesWidget(
    {List<CategoryResponseEntity> categories,
    String selCategoryCode,
    Function(CategoryResponseEntity) onTap}) {
  return categories == null
      ? Container()
      : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map<Widget>((item) {
              return Container(
                alignment: Alignment.center,
                height: duSetHeight(52),
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  child: Text(
                    item.title,
                    style: TextStyle(
                        color: selCategoryCode == item.code
                            ? AppColors.secondaryElementText
                            : AppColors.primaryText,
                        fontSize: duSetFontSize(18),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600),
                  ),
                  onTap: () => onTap(item),
                ),
              );
            }).toList(),
          ),
        );
}
