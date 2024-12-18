import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/app_text.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/component/responsive.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:srbiau_digital_plaque/widgets/costum_drawer.dart';
import 'package:srbiau_digital_plaque/widgets/send_req_form.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({
    super.key,
  });

  final Color maincolor = const Color.fromARGB(255, 28, 198, 201);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.neutralLight,
            drawer: const CustomDrawer(),
            // appBar
            appBar: PreferredSize(
                preferredSize: Size(size.width, size.height * 0.0866),
                child: Container(
                  height: size.height * 0.086,
                  color: maincolor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.padding),
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
            body: Flexible(
              child: Center(
                child: SizedBox(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth:
                            Responsive.isDesktop(context) ? 1080 : size.width),
                    child: Column(
                      children: [
                        const Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppDimens.xlarge,
                                  vertical: AppDimens.padding),
                              child: Text(
                                AppText.contactUs,
                                style: AppTextStyles.titleStyleB,
                              ),
                            )),
                        // send req 2
                        SendReqForm(
                          color: maincolor,
                        ),
                        // (size.height * 0.11).height,
                        const Expanded(child: SizedBox()),
                        Padding(
                          padding: const EdgeInsets.all(AppDimens.padding),
                          child: SvgPicture.asset(
                            Assets.svg.footer,
                            height: size.height * 0.02,
                            colorFilter: const ColorFilter.mode(
                                Color.fromARGB(255, 178, 178, 178),
                                BlendMode.srcIn),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
