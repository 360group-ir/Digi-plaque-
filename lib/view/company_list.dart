import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:srbiau_digital_plaque/widgets/company_item.dart';
import 'package:srbiau_digital_plaque/widgets/costum_drawer.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({super.key, required this.mainColor});

  final Color mainColor;

  @override
  State<CompanyList> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.neutralLight,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.0866),
          child: Container(
            height: size.height * 0.086,
            color: widget.mainColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        CupertinoIcons.left_chevron,
                        color: AppColors.neutralLight,
                      )),
                  SvgPicture.asset(
                    Assets.svg.dlogo,
                    height: size.height * 0.08,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  IconButton(
                      onPressed: () {
                        // showFullScreenDrawer(context);
                        showCenteredDialog(context);
                      }, icon: SvgPicture.asset(Assets.svg.group)),
              
                ],
              ),
            ),
          )),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.xlarge, vertical: AppDimens.padding),
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "طبقه همکف - بلوک E",
                  style: AppTextStyles.titleStyleB,
                  textDirection: TextDirection.rtl,
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) =>  CompanyItem(size: size, widget: widget),
            ),
            
          ),
          
        ],
      ),
    ));
  }
}
