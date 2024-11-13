import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/dimens.dart';
import 'package:srbiau_digital_plaque/component/extentions.dart';
import 'package:srbiau_digital_plaque/component/res/app_colors.dart';
import 'package:srbiau_digital_plaque/component/res/app_text.dart';
import 'package:srbiau_digital_plaque/component/res/text_styles.dart';
import 'package:srbiau_digital_plaque/gen/assets.gen.dart';
import 'package:srbiau_digital_plaque/view/company_list.dart';
import 'package:srbiau_digital_plaque/widgets/Expan_Gruope.dart';
import 'package:srbiau_digital_plaque/widgets/Icon_widget.dart';
import 'package:srbiau_digital_plaque/widgets/costum_drawer.dart';
import 'package:srbiau_digital_plaque/widgets/costum_bottomshit.dart';
import 'package:srbiau_digital_plaque/widgets/costum_textbutton.dart';
import 'package:srbiau_digital_plaque/widgets/share_button.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  MainScreen({
    super.key,
    this.visiblity = false,
    
    // required this.imgUrl,
    // required this.qrcode,
    // required this.abouteUS,
    // required this.workinghourse,
    // required this.address,
    // required this.locationUrl,
    // required this.contactUs
  });

  final Color mainColor = const Color.fromARGB(255, 63, 105, 225) ;
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
          preferredSize: Size(size.width, size.height * 0.0866),
          child: Container(
            height: size.height * 0.085,
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
        physics: const ClampingScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          children: [
            //Qr code groupe
            Container(
              color: widget.mainColor,
              // height: size.height * 0.4,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (size.height*0.03).height,
                  SvgPicture.asset(
                    Assets.svg.groper360,
                    height: size.height * 0.065,
                  ),
                  (size.height * 0.032).height,
                  Text(
                    AppText.uni,
                    style:
                        AppTextStyles.titleStyleB.copyWith(color: Colors.white),
                  ),
                  (size.height * 0.032).height,
                  Image.asset(
                    Assets.png.qrcode.path,
                    height: size.height * 0.13,
                  ),
                  (size.height * 0.032).height
                ].animate(effects: [ ScaleEffect(duration: Duration(milliseconds: 500)),FadeEffect(duration: Durations.long2)]),
              ),
            ),
            //List tiles
            AppDimens.padding.height,
            // about us
            Animate(
              effects: const [
                MoveEffect(duration: Duration(milliseconds: 750)),
              ],
              child: ExpanGroup(
                mainColor: widget.mainColor,
                title: "درباره مرکز رشد ",
                children:  [
                  Text(
                    AppText.lorem,
                    style: AppTextStyles.descriptionStyle.copyWith(height: 2 ,),
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        
                        IconWidget(
                          assetsName: Assets.svg.vector,
                          text: AppText.phone,
                        ),
                        IconWidget(
                          assetsName: Assets.svg.icon,
                          text: AppText.website,
                        ),
                        
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Get.bottomSheet(
                                  enterBottomSheetDuration:
                                      const Duration(milliseconds: 400),
                                  exitBottomSheetDuration:
                                      const Duration(milliseconds: 300),
                                   CostumBottomShit());
                            });
                          },
                          child: IconWidget(
                            assetsName: Assets.svg.icon1,
                            text: AppText.address,
                          ),
                        ),
                        IconWidget(
                          assetsName: Assets.svg.icon2,
                          text: AppText.email,
                        ),
                      ],
                    )
                  ]),
            ),

            // JOb offers
            //TODO: job offers

            const Padding(
              padding: EdgeInsets.fromLTRB(AppDimens.padding, (AppDimens.xlarge),
                  AppDimens.padding, AppDimens.small),
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
                  title: "طبقه همکف",
                  mainColor: widget.mainColor,
                  children:  [
                    CostumTextButton(
                      textButtonTitle: 'بلوک E',
                      onPressed: (){
                        Get.to(CompanyList(mainColor: widget.mainColor));
                      },
                    )
                  ]),
            ),
            Animate(
              effects: const [
                MoveEffect(duration: Durations.extralong1),
              ],
              child: ExpanGroup(
                  title: "طبقه اول",
                  mainColor: widget.mainColor,
                  children: const [
                    CostumTextButton(
                      textButtonTitle: 'بلوک B',
                    ),
                    CostumTextButton(
                      textButtonTitle: 'بلوک C',
                    ),
                  ]),
            ),
            Animate(
              effects: const [
                MoveEffect(duration: Durations.extralong1),
              ],
              child: ExpanGroup(
                  title: "طبقه چهارم",
                  mainColor: widget.mainColor,
                  children: const [
                    CostumTextButton(
                      textButtonTitle: 'بلوک C',
                    ),
                  ]),
            ),
            Animate(
              effects: const [
                MoveEffect(duration: Durations.extralong1),
              ],
              child: ExpanGroup(
                  title: "طبقه پنجم",
                  mainColor: widget.mainColor,
                  children: const [
                    CostumTextButton(
                      textButtonTitle: 'کل طبقه',
                    ),
                  ]),
            ),
            Animate(
              effects: const [
                MoveEffect(duration: Durations.extralong1),
              ],
              child: ExpanGroup(
                  title: "ساختمان شیخ‌بهایی",
                  mainColor: widget.mainColor,
                  children: const [
                    CostumTextButton(
                      textButtonTitle: 'ساختمان شیخ‌بهایی',
                    ),
                  ]),
            ),

            //Share button
            Animate(
              effects: const [
                ScaleEffect(duration: Durations.extralong1),
              ],
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.padding , vertical: AppDimens.xlarge),
                child: ShareButton(),
              ),
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
