import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/component/responsive.dart';
import 'package:srbiau_digital_plaque/controller/companies_controller.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:srbiau_digital_plaque/widgets/company_item.dart';
import 'package:srbiau_digital_plaque/widgets/costum_drawer.dart';

// ignore: must_be_immutable
class CompanyList extends StatelessWidget {
  CompanyList(
      {super.key,
      required this.mainColor,
      this.building = 'کتابخوانه',
      this.floor = '1',
      this.block = 'E'});

  final Color mainColor;
  final String building;
  final String floor;
  final String block;

  CompanyListController compListController = Get.put(CompanyListController());

  @override
  Widget build(BuildContext context) {
    compListController.fetchCompanyList(
        building: building, floor: floor, block: block);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.neutralLight,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.0866),
          child:  Container(
                height: size.height * 0.086,
                color: mainColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppDimens.padding),
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
                      IconButton(
                          onPressed: () {
                            // showFullScreenDrawer(context);
                            showCenteredDialog(context);
                          },
                          icon: SvgPicture.asset(Assets.svg.group)),
                    ],
                  ),
                ),
              )),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: Responsive.isDesktop(context) ? 1080 : size.width),
          child: Obx(() =>compListController.isLoading.value
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SpinKitFoldingCube(
                        color: mainColor,
                      ),
                    ),
                  ],
                )
              : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.xlarge,
                        vertical: AppDimens.padding),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "طبقه $floor - بلوک $block ",
                          style: AppTextStyles.titleStyleB,
                          textDirection: TextDirection.rtl,
                        )),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: compListController.companyList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final company = compListController.companyList[index];
                        return CompanyItem(
                          field: company.businessField,
                          imgurl: company.logo,
                          pelak: company.slug,
                          title: company.name,
                        );
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    ));
  }
}
