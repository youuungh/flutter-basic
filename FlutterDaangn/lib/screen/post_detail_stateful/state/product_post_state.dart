import 'package:flutter/widgets.dart';
import 'package:flutter_daangn/common/cli_common.dart';
import 'package:flutter_daangn/common/util/async/cli_async.dart';
import 'package:flutter_daangn/entity/post/vo_product_post.dart';
import 'package:flutter_daangn/screen/post_detail_stateful/s_post_detail_with_stateful_widget.dart';
import 'package:flutter_daangn/screen/post_detail_stateful/state/product_post_state.logic.dart';

mixin ProductPostState<T extends PostIdProvidedScreen> on State<T> {
  ProductPost? productPost;

  @override
  void initState() {
    initPost();
    super.initState();
  }

  void initPost() async {
    final response = await requestPost(widget.id);
    setState(() {
      productPost = response;
    });
  }
}