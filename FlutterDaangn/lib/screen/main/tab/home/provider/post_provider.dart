import 'package:flutter_daangn/entity/dummies.dart';
import 'package:flutter_daangn/entity/post/vo_simple_product_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProvider = StateProvider<List<SimpleProductPost>>((ref) =>
  postList
);