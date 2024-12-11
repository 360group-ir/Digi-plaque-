import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/app_text.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/component/responsive.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:srbiau_digital_plaque/view/company_list.dart';
import 'package:srbiau_digital_plaque/view/eplak.dart';
import 'package:srbiau_digital_plaque/widgets/Expan_Gruope.dart';
import 'package:srbiau_digital_plaque/widgets/Icon_widget.dart';
import 'package:srbiau_digital_plaque/widgets/action_button.dart';
import 'package:srbiau_digital_plaque/widgets/costum_drawer.dart';
import 'package:srbiau_digital_plaque/widgets/costum_textbutton.dart';
import 'package:srbiau_digital_plaque/widgets/main_bottomshit.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  MainScreen({
    super.key,
    this.visiblity = false,
  });

  final Color mainColor = const Color.fromARGB(255, 28, 198, 201);
  bool visiblity;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.neutralLight,
      drawer: const CustomDrawer(),
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.08),
          child: Container(
            height: size.height * 0.08,
            color: widget.mainColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      // showFullScreenDrawer(context);
                      showCenteredDialog(context);
                    },
                    icon: SvgPicture.asset(Assets.svg.group)),
                AppDimens.padding.width,
              ],
            ),
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: ClampingScrollPhysics()),
        child: Column(
          children: [
            //Qr code groupe
            Container(
              color: widget.mainColor,
              width: size.width,
              // height: size.height*.48,
              padding: const EdgeInsets.all(AppDimens.padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    Assets.svg.baam,
                    height: size.height * 0.16,
                    colorFilter: const ColorFilter.mode(
                        AppColors.neutralLight, BlendMode.srcIn),
                  ),
                  (size.height * 0.025).height,
                  Text(
                    AppText.uni,
                    style:
                        AppTextStyles.titleStyleB.copyWith(color: Colors.white),
                  ),
                  (size.height * 0.025).height,
                  QrImageView(
                    data: Uri.base.toString(),
                    version: QrVersions.auto,
                    size: size.height * 0.13,
                    dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.square,
                        color: Colors.white),
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: Colors.white,
                    ),
                  ),
                ].animate(effects: [
                  const ScaleEffect(duration: Duration(milliseconds: 500)),
                  const FadeEffect(duration: Durations.long2)
                ]),
              ),
            ),
            //List tiles
            AppDimens.padding.height,

            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: Responsive.isDesktop(context) ? 1080 : size.width),
              child: Column(
                children: [
                  // about us
                  Animate(
                    effects: const [
                      MoveEffect(duration: Duration(milliseconds: 750)),
                    ],
                    child: ExpanGroup(
                      mainColor: widget.mainColor,
                      title: "درباره مرکز رشد",
                      expantileOpen: false,
                      children: [
                        Text(
                          AppText.roshdAboutUs,
                          style: AppTextStyles.descriptionStyle.copyWith(
                            height: 2,
                          ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.justify,
                          locale: const Locale("fa"),
                        )
                      ],
                    ),
                  ),
                  // contact us
                  Animate(
                    effects: const [
                      MoveEffect(duration: Duration(milliseconds: 750)),
                    ],
                    child: ExpanGroup(
                        title: 'راه‌های ارتباطی',
                        mainColor: widget.mainColor,
                        expantileOpen: true,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconWidget(
                                ontap: () {
                                  makePhoneCall('tel:${02128428507}');
                                },
                                assetsName: Assets.svg.vector,
                                text: AppText.phone,
                              ),
                              IconWidget(
                                ontap: () {
                                  launchURL(
                                      "https://innovationroof.srbiau.ac.ir/");
                                },
                                assetsName: Assets.svg.icon,
                                text: AppText.website,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (Responsive.isDesktop(context)) {
                                    launchURL(
                                        'https://maps.app.goo.gl/AWRzbnFLYJu42dq1A?g_st=com.google.maps.preview.copy');
                                  } else {
                                    setState(() {
                                      Get.bottomSheet(
                                          enterBottomSheetDuration:
                                              const Duration(milliseconds: 400),
                                          exitBottomSheetDuration:
                                              const Duration(milliseconds: 300),
                                          MainBottomShit());
                                    });
                                  }
                                },
                                child: IconWidget(
                                  assetsName: Assets.svg.icon1,
                                  text: AppText.address,
                                ),
                              ),
                              IconWidget(
                                assetsName: Assets.svg.icon2,
                                text: AppText.email,
                                ontap: () {
                                  sendEmail('rkbs_kh@yahoo.com');
                                },
                              ),
                            ],
                          )
                        ]),
                  ),

                  // JOb offers
                  //TODO: job offers

                  const Padding(
                    padding: EdgeInsets.fromLTRB(AppDimens.padding,
                        (AppDimens.xlarge), AppDimens.padding, AppDimens.padding),
                    child: Text(
                      AppText.roshdCompanies,
                      style: AppTextStyles.titleStyleB,
                    ),
                  ),

                  Animate(
                    effects: const [
                      MoveEffect(duration: Durations.extralong1),
                    ],
                    child: ExpanGroup(
                        expantileOpen: false,
                        title: "ساختمان دکتر حبیبی",
                        mainColor: widget.mainColor,
                        children: [
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppDimens.small,
                                    vertical: AppDimens.small),
                                child: Text(
                                  "طبقه همکف",
                                  style: AppTextStyles.tileTxtStyle,
                                ),
                              )),
                          CostumTextButton(
                            textButtonTitle: 'بلوک E',
                            onPressed: () {
                              // Get.toNamed(RouteName.routeCompaneyList);
                              Get.to(CompanyList(
                                block: "E",
                                building: 'کتابخوانه',
                                floor: '1',
                                mainColor: widget.mainColor,
                              ));
                            },
                          ),
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppDimens.small,
                                    vertical: AppDimens.small),
                                child: Text(
                                  "طبقه اول",
                                  style: AppTextStyles.tileTxtStyle,
                                ),
                              )),
                          CostumTextButton(
                            textButtonTitle: 'بلوک B',
                            onPressed: () {
                              Get.to(CompanyList(
                                block: "B",
                                building: 'کتابخوانه',
                                floor: '1',
                                mainColor: widget.mainColor,
                              ));
                            },
                          ),
                          CostumTextButton(
                            textButtonTitle: 'بلوک C',
                            onPressed: () {
                              Get.to(CompanyList(
                                block: "C",
                                building: 'کتابخوانه',
                                floor: '1',
                                mainColor: widget.mainColor,
                              ));
                            },
                          ),
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppDimens.small,
                                    vertical: AppDimens.small),
                                child: Text(
                                  "طبقه چهارم",
                                  style: AppTextStyles.tileTxtStyle,
                                ),
                              )),
                          CostumTextButton(
                            textButtonTitle: 'بلوک C',
                            onPressed: () {
                              Get.to(CompanyList(
                                block: "C",
                                building: 'کتابخوانه',
                                floor: '4',
                                mainColor: widget.mainColor,
                              ));
                            },
                          ),
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppDimens.small,
                                    vertical: AppDimens.small),
                                child: Text(
                                  "طبقه پنجم",
                                  style: AppTextStyles.tileTxtStyle,
                                ),
                              )),
                          CostumTextButton(
                            textButtonTitle: 'کل طبقه',
                            onPressed: () {
                              Get.to(CompanyList(
                                block: "E",
                                building: 'کتابخوانه',
                                floor: '5',
                                mainColor: widget.mainColor,
                              ));
                            },
                          ),
                        ]),
                  ),

                  Animate(
                    effects: const [
                      MoveEffect(duration: Durations.extralong1),
                    ],
                    child: ExpanGroup(
                        expantileOpen: false,
                        title: "ساختمان شیخ‌بهایی",
                        mainColor: widget.mainColor,
                        children: const [
                          CostumTextButton(
                            textButtonTitle: 'کل طبقه',
                            // onPressed: () {
                            //   Get.to(CompanyList(
                            //     block: "E",
                            //     building: 'کتابخوانه',
                            //     floor: '5',
                            //     mainColor: widget.mainColor,
                            //   ));
                            // },
                          ),
                        ]),
                  ),
                ],
              ),
            ),

            //Share button
            //TODO
            ActionButton(
              size: size,
              companyName: AppText.uni,
              phoneNumber: '02128428507',
              email: 'info@360group.ir',
            ),

            (size.height * 0.015).height,
            Padding(
              padding: const EdgeInsets.all(AppDimens.medium),
              child: SvgPicture.asset(
                Assets.svg.groper360,
                height: size.height * 0.035,
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 178, 178, 178), BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
