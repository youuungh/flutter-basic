import 'package:flutter_daangn/app.dart';
import 'package:flutter_daangn/common/cli_common.dart';
import 'package:flutter_daangn/entity/post/vo_simple_product_post.dart';
import 'package:flutter_daangn/entity/product/product_status.dart';
import 'package:flutter_daangn/entity/product/vo_product.dart';
import 'package:flutter_daangn/entity/user/vo_address.dart';
import 'package:flutter_daangn/entity/user/vo_user.dart';

String picSum(int id) {
  return 'https://picsum.photos/id/$id/200/200';
}

final user1 = User(id: 1, nickname: "호날두", profileUrl: picSum(600), temp: 36.5);

final user2 = User(id: 2, nickname: "메시", profileUrl: picSum(700), temp: 36.5);

final user3 = User(id: 3, nickname: "음바페", profileUrl: picSum(800), temp: 36.5);

final product1 = Product(
    user1,
    '갤럭시s24+',
    800000,
    ProductStatus.normal,
    [picSum(100), picSum(101), picSum(102)]);

final product2 = Product(
    user2,
    '아이폰15',
    500000,
    ProductStatus.normal,
    [picSum(200), picSum(201), picSum(202)]);

final product3 = Product(
    user3,
    '지포스GTX 1080ti',
    200000,
    ProductStatus.normal,
    [picSum(300), picSum(301), picSum(302)]);

final post1 =
    SimpleProductPost(1, product1.user, product1, '내용입니다.', const Address('서울시 강남구', '도곡동'), 1234, 323, DateTime.now().subtract(50.minutes));

final post2 =
    SimpleProductPost(2, product2.user, product2, '내용입니다.', const Address('서울시 서초구', '방배동'), 567, 245, DateTime.now().subtract(40.minutes));

final post3 =
    SimpleProductPost(3, product3.user, product3, '내용입니다.', const Address('서울시 송파구', '문정동'), 4, 9, DateTime.now().subtract(10.seconds));

final postList = [post1, post2, post3];

//'제품 상태 A급입니다'
//         '택배거래 희망합니다, 감사합니다.'
//         '010-1234-5678',

// '오래썼지만 아직 쓸만합니다'
// '직거래 희망합니다, 감사합니다.'
// '010-1234-5678',