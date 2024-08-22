import 'package:flutter_daangn/common/cli_common.dart';
import 'package:flutter_daangn/entity/post/vo_product_post.dart';

import '../../../common/util/async/cli_async.dart';
import '../../../data/network/daangn_api.dart';



Future<ProductPost> requestPost(int id) async {
  await sleepAsync(400.ms);
  return await DaangnApi.getPost(id);
}