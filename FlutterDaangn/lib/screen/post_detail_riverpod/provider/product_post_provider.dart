import 'package:flutter_daangn/app.dart';
import 'package:flutter_daangn/common/common.dart';
import 'package:daangn_ui/common/dart/extension/ref_extension.dart';
import 'package:flutter_daangn/data/network/daangn_api.dart';
import 'package:flutter_daangn/entity/post/vo_product_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productPostProvider =
    AutoDisposeFutureProviderFamily<ProductPost, int>((ref, id) async {
  ref.cacheFor(10.minutes);
  return await DaangnApi.getPost(id);
});
