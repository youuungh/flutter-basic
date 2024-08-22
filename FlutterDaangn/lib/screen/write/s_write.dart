import 'dart:io';
import 'dart:math';

import 'package:daangn_ui/common/constant/app_colors.dart';
import 'package:daangn_ui/widget/round_button_theme.dart';
import 'package:daangn_ui/widget/w_round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daangn/common/common.dart';
import 'package:flutter_daangn/common/util/app_keyboard_util.dart';
import 'package:flutter_daangn/entity/post/vo_simple_product_post.dart';
import 'package:flutter_daangn/entity/product/product_status.dart';
import 'package:flutter_daangn/entity/product/vo_product.dart';
import 'package:flutter_daangn/screen/main/tab/home/provider/post_provider.dart';
import 'package:flutter_daangn/screen/post_detail_riverpod/s_post_detail.dart';
import 'package:flutter_daangn/screen/write/d_select_image_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../entity/dummies.dart';
import '../../entity/user/vo_address.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen>
    with KeyboardDetector {
  final List<String> imageList = [];

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    titleController.addListener(() {
      setState(() {});
    });
    priceController.addListener(() {
      setState(() {});
    });
    descriptionController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.go('/');
          },
        ),
        title: 'sell_my_thing'.tr().text.bold.make(),
        actions: [
          Tap(
            onTap: () {},
            child: 'temp_save'.tr().text.make().p(16),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ImageSelectWidget(
              imageList,
              onTapDeleteImage: (imagePath) {
                setState(() {
                  imageList.remove(imagePath);
                });
              },
              onTap: () async {
                final selectedSource = await SelectImageSourceDialog().show();
                if (selectedSource == null) return;
                final file =
                    await ImagePicker().pickImage(source: selectedSource);
                if (file == null) return;
                setState(() {
                  imageList.add(file.path);
                });
              },
            ),
            height16,
            _TitleEditor(titleController),
            height30,
            _PriceEditor(priceController),
            height30,
            _DescEditor(descriptionController),
          ],
        ).pSymmetric(h: 16),
      ),
      bottomSheet: isKeyboardOn
          ? null
          : RoundButton(
              text: isLoading ? '저장중' : '작성 완료',
              isFullWidth: true,
              bgColor: AppColors.darkOrange,
              borderRadius: 6,
              isEnabled: isValid,
              rightWidget: isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(),
                    ).pOnly(right: 16)
                  : null,
              onTap: () {
                final title = titleController.text;
                final price = int.parse(priceController.text);
                final desc = descriptionController.text;
                setState(() {
                  isLoading = true;
                });
                final list = ref.read(postProvider);
                final simpleProductPost = SimpleProductPost(
                    6,
                    user3,
                    Product(
                        user3, title, price, ProductStatus.normal, imageList),
                    title,
                    const Address('서울시 강동구 천호동', '나의동'),
                    0,
                    0,
                    DateTime.now());
                ref.read(postProvider.notifier).state = List.of(list)
                  ..add(simpleProductPost);
                Nav.pop(context);
                Nav.push(
                  PostDetailScreen(
                    simpleProductPost.id,
                    simpleProductPost: simpleProductPost,
                  ),
                );
              },
            ).pOnly(bottom: 10),
    );
  }

  bool get isValid =>
      isNotBlank(titleController.text) &&
      isNotBlank(priceController.text) &&
      isNotBlank(descriptionController.text);
}

class _ImageSelectWidget extends StatelessWidget {
  final List<String> imageList;
  final VoidCallback onTap;
  final void Function(String path) onTapDeleteImage;

  const _ImageSelectWidget(this.imageList,
      {required this.onTap, required this.onTapDeleteImage, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SelectImageButton(onTap: onTap, imageList: imageList)
                .pOnly(right: 16, top: 8),
            ...imageList.map(
              (imagePath) => Stack(
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(
                        File(imagePath),
                        fit: BoxFit.fill,
                      ).box.rounded.border(color: Colors.white60).make(),
                    ),
                  ).pOnly(left: 4, right: 8, top: 8),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Tap(
                        onTap: () {
                          onTapDeleteImage(imagePath);
                        },
                        child: Transform.rotate(
                          angle: pi / 4,
                          child: Icon(Icons.add_circle),
                        ).pOnly(left: 30, bottom: 30),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectImageButton extends StatelessWidget {
  const SelectImageButton({
    super.key,
    required this.onTap,
    required this.imageList,
  });

  final VoidCallback onTap;
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: onTap,
      child: SizedBox(
        width: 70,
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.camera_alt_rounded,
              color: Colors.white60,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: imageList.length.toString(),
                      style: const TextStyle(color: Colors.white60)),
                  const TextSpan(
                      text: '/10', style: TextStyle(color: Colors.white60))
                ],
              ),
            )
          ],
        ).box.rounded.border(color: Colors.white60).make(),
      ),
    );
  }
}

class _TitleEditor extends StatelessWidget {
  final TextEditingController controller;

  const _TitleEditor(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '제목'.text.bold.make(),
        height10,
        TextField(
          controller: controller,
          decoration: const InputDecoration(
              hintText: '제목',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkOrange),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkOrange),
              )),
        )
      ],
    );
  }
}

class _PriceEditor extends StatefulWidget {
  final TextEditingController controller;

  const _PriceEditor(this.controller);

  @override
  State<_PriceEditor> createState() => _PriceEditorState();
}

class _PriceEditorState extends State<_PriceEditor> {
  bool isDonateMode = false;
  final priceNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '거래 방식'.text.bold.make(),
        height10,
        Row(
          children: [
            RoundButton(
              text: '판매하기',
              theme: isDonateMode
                  ? RoundButtonTheme.border
                  : RoundButtonTheme.orange,
              onTap: () {
                widget.controller.clear();
                setState(() {
                  isDonateMode = false;
                });
                delay(() {
                  AppKeyboardUtil.show(context, priceNode);
                });
              },
            ),
            width8,
            RoundButton(
              text: '나눔하기',
              theme: !isDonateMode
                  ? RoundButtonTheme.border
                  : RoundButtonTheme.orange,
              onTap: () {
                widget.controller.text = "0";
                setState(() {
                  isDonateMode = true;
                });
              },
            )
          ],
        ),
        height10,
        TextField(
          focusNode: priceNode,
          controller: widget.controller,
          keyboardType: TextInputType.number,
          enabled: !isDonateMode,
          decoration: InputDecoration(
              hintText: 'input_price'.tr(namedArgs: {'test': '홍길동'}),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              )),
        )
      ],
    );
  }
}

class _DescEditor extends StatelessWidget {
  final TextEditingController controller;

  const _DescEditor(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '자세한 설명'.text.bold.make(),
        height10,
        TextField(
          controller: controller,
          maxLines: 7,
          decoration: const InputDecoration(
              hintText: '에 올릴 게시글 내용을 작성해주세요',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkOrange),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkOrange),
              )),
        )
      ],
    );
  }
}
