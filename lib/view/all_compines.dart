import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/component/responsive.dart';
import 'package:srbiau_digital_plaque/controller/all_companies_controller.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:srbiau_digital_plaque/widgets/company_item.dart';
import 'package:srbiau_digital_plaque/widgets/costum_drawer.dart';

class AllBusinessListPage extends StatelessWidget {
  final AllBusinessController controller = Get.put(AllBusinessController());
  final TextEditingController searchController = TextEditingController();

  AllBusinessListPage({super.key});

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
              color: AppColors.primaryPelak,
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
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppDimens.padding),
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      label: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'جستوجو',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                          )),
                      labelStyle: AppTextStyles.descriptionStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      suffixIcon: Icon(CupertinoIcons.search),
                      focusColor: AppColors.primaryPelak,
                    ),
                    onChanged: (value) {
                      controller.searchBusinesses(value);
                    },
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: SpinKitFoldingCube(
                              color: AppColors.primaryPelak,
                            ),
                          ),
                        ],
                      );
                    }

                    if (controller.businesses.isEmpty) {
                      return const Center(
                          child: Text(
                        'هیچ شرکتی یافت نشد',
                        style: AppTextStyles.landingPageTools,
                      ));
                    }

                    return ListView.builder(
                      itemCount: controller.businesses.length,
                      itemBuilder: (context, index) {
                        final company = controller.businesses[index];
                        if (kDebugMode) {
                          print(controller.businesses[index]);
                        }
                        return CompanyItem(
                          field: company.businessField,
                          imgurl: company.logo,
                          pelak: company.slug,
                          title: company.name,
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
