import 'package:flutter_ttoss/common/common.dart';
import 'package:flutter_ttoss/screen/main/s_main.dart';
import 'package:flutter_ttoss/screen/main/tab/benefit/benefits_dummy.dart';
import 'package:flutter_ttoss/screen/main/tab/benefit/w_benefit_item.dart';
import 'package:flutter_ttoss/screen/main/tab/benefit/w_point_button.dart';
import 'package:flutter/material.dart';

class BenefitFragment extends StatefulWidget {
  const BenefitFragment({super.key});

  @override
  State<BenefitFragment> createState() => _BenefitFragmentState();
}

class _BenefitFragmentState extends State<BenefitFragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: MainScreenState.bottomNavigatorHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height30,
          "혜택".text.white.bold.size(18).make(),
          height30,
          const PointButton(
            point: 123,
          ),
          height30,
          "혜택 더 받기".text.white.bold.size(16).make(),
          ...benefitList.map((element) => BenefitItem(benefit: element)).toList(),
        ],
      ).pSymmetric(h: 20),
    );
  }
}
