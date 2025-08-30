import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_button.dart';
import 'package:test_project/feature/auth/views/social_login_screen.dart';
import 'package:test_project/feature/onboarding/controller/onboarding_controller.dart';
import 'package:test_project/feature/onboarding/model/onboarding_model.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';


class OnboardingScreenView extends StatefulWidget {
  const OnboardingScreenView({super.key});

  @override
  State<OnboardingScreenView> createState() => _OnboardingScreenViewState();
}

class _OnboardingScreenViewState extends State<OnboardingScreenView> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnboardingController>(
        builder: (onboardingController) {
          return Column(children: [


              Expanded(
                child: PageView.builder(
                  controller: onboardingController.pageController2,
                  itemCount: onboardingController.onboardingData.length,
                  onPageChanged: (index){
                    onboardingController.setCurrentPage(index);
                  },
                  itemBuilder: (context, index) => Column(children: [
                    SizedBox(width: Get.width, height: Get.height / 2, child: CustomPaint(
                        painter: RPSCustomPainter(context: context),
                        child: ClipPath(clipper: RPSCustomClipper(),
                            clipBehavior: Clip.hardEdge,
                            child: Stack(alignment: Alignment.center, children: [
                              Transform.scale(scale: 3, origin: const Offset(-50, 0),
                                  child: Image.asset(Images.p1, color: Theme.of(context).cardColor.withOpacity(0.1),)),
                              Positioned(bottom: -100, left: 0,right: 0,
                                  child: SizedBox(height: Get.height / 2,
                                    child: Image.asset(onboardingModelList[index].image)))
                            ])))),

                    const SizedBox(height: 30),
                    Text(onboardingModelList[index].title,
                      textAlign: TextAlign.center,
                      style: textBold.copyWith(fontSize:Dimensions.fontSizeOverLarge,color: Theme.of(context).colorScheme.secondary ),),
                    const SizedBox(height: Dimensions.paddingSizeSmall,),
                    Text(onboardingModelList[index].description,
                      textAlign: TextAlign.center,
                      style: textRegular.copyWith(fontSize:Dimensions.fontSizeDefault,
                          color: Theme.of(context).textTheme.bodyLarge?.color ),)
                  ]),),
              ),

              Row(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min,
                children: List.generate(onboardingController.onboardingData.length,
                        (index) => CustomIndicator(currentIndex: index,selIndex: onboardingController.currentPage,)),),

              const SizedBox(height: Dimensions.paddingSizeExtraLarge,),

              Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical:Dimensions.paddingSizeDefault ),
                child: Row(children: [
                    Expanded(child: CustomButton(onTap: ()  => onboardingController.skipAllPage(),
                        buttonColor: Theme.of(context).primaryColor.withOpacity(0.15),
                        textColor: Theme.of(context).primaryColor, height: 45, text: "skip".tr),),

                    const SizedBox(width: Dimensions.paddingSize,),
                    Expanded(child: CustomButton(onTap: () => Get.to(SocialLoginScreenView()),
                        //onboardingController.nextPage(),
                        height: 45,buttonColor: Theme.of(context).primaryColor,
                        text: "continue".tr),
                    ),
                  ],
                ),
              )
            ],
          );
        }
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  final int currentIndex;
  final int selIndex;
  const CustomIndicator({
    super.key, required this.currentIndex, required this.selIndex,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: const Duration(milliseconds: 600,),
      margin: const EdgeInsets.only(right: 4),
      height: 10,width: currentIndex  == selIndex? 30: 10, decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
          color: currentIndex  == selIndex?  Theme.of(context).primaryColor: Theme.of(context).hintColor ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  final BuildContext context;
  RPSCustomPainter({required this.context});
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.8783704);
    path_0.arcToPoint(Offset(size.width * 0.5344388, size.height * 0.9993580),
        radius:
            Radius.elliptical(size.width * 1.050077, size.height * 1.016370),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.quadraticBezierTo(size.width * 0.5172959, size.height * 0.9999259,
        size.width * 0.5000000, size.height * 0.9999012);
    path_0.quadraticBezierTo(size.width * 0.4827041, size.height * 0.9998765,
        size.width * 0.4655612, size.height * 0.9993580);
    path_0.arcToPoint(Offset(0, size.height * 0.8783704),
        radius:
            Radius.elliptical(size.width * 1.050077, size.height * 1.016370),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(0, 0);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color =  Theme.of(context).primaryColor;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;

    return Path()
      ..moveTo(width, 0)
      ..lineTo(width, height * 0.8783704)
      ..arcToPoint(
        Offset(width * 0.5344388, height * 0.9993580),
        radius: Radius.elliptical(width * 1.050077, height * 1.016370),
        rotation: 0,
        largeArc: false,
        clockwise: true,
      )
      ..quadraticBezierTo(width * 0.5172959, height * 0.9999259, width * 0.5000000, height * 0.9999012)
      ..quadraticBezierTo(width * 0.4827041, height * 0.9998765, width * 0.4655612, height * 0.9993580)
      ..arcToPoint(
        Offset(0, height * 0.8783704),
        radius: Radius.elliptical(width * 1.050077, height * 1.016370),
        rotation: 0,
        largeArc: false,
        clockwise: true,
      )
      ..lineTo(0, 0)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
