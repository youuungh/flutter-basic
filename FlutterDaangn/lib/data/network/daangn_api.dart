import 'package:flutter_daangn/common/cli_common.dart';
import 'package:flutter_daangn/data/network/result/api_error.dart';
import 'package:flutter_daangn/data/simple_result.dart';
import 'package:flutter_daangn/entity/dummies.dart';
import 'package:flutter_daangn/entity/post/vo_product_post.dart';
import 'package:flutter_daangn/screen/notification/vo/notification_dummies.dart';
import 'package:flutter_daangn/screen/notification/vo/vo_notification.dart';

class DaangnApi {
  static Future<SimpleResult<List<DaangnNotification>, ApiError>>
      getNotification() async {
    await sleepAsync(500.ms);
    return SimpleResult.success(notificationList);
  }

  static Future<ProductPost> getPost(int id) async {
    await sleepAsync(500.ms);
    return ProductPost(
      simpleProductPost: post1,
      content: '안녕하세요, 미개봉 새제품이구요.'
          '직거래 희망합니다, 감사합니다. '
          '010-1234-5678',
    );
  }
}
