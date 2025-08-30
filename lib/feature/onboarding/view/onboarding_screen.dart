
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_project/common/widget/botton.dart';
import 'package:test_project/feature/auth/views/social_login_screen.dart';
import 'package:test_project/feature/onboarding/model/onboarding_model.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';


class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final pageController = PageController();

  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( children: [
        PageView.builder(clipBehavior: Clip.none,
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: onboardingModelList.length,
            onPageChanged: (value) {  setState(() {  index = value;
              //  log("===> val== $value");
              });
            },
            itemBuilder: (_,index){
              return Expanded(child: Column(
                  children: [
                    SizedBox(width: Get.width, height: Get.height / 2, child: CustomPaint(
                        painter: RPSCustomPainter(context: context),
                        child: ClipPath(clipper: RPSCustomClipper(),
                            clipBehavior: Clip.hardEdge,
                            child: Positioned( left: 0,right: 0,
                                child: SizedBox(
                                    child: Image.asset(onboardingModelList[index].image),))))),
                       // ClipPath(
                       //   clipper:RPSCustomPainter(context: context),
                       //
                       //  // clipper: CurveClipper(),
                       //
                       //  child:Image(image: AssetImage(onboardingModelList[index].image),),),
                     const SizedBox(height: Dimensions.defaultSize,),
                    Text(onboardingModelList[index].title,style: textMedium,),
                    const SizedBox(height: Dimensions.defaultSize),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(onboardingModelList[index].description,style: textRegular,),
                    ),
                  ],
                ),
              );
            }),
          

        Positioned(left: 0,right: 0,bottom: 200,
          child: Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              axisDirection: Axis.horizontal,
              effect: ExpandingDotsEffect(
                  spacing: 8,
                  radius: 10,
                  dotWidth: 10,
                  dotHeight: 10,
                  paintStyle: PaintingStyle.fill,
                  dotColor:const Color(0xff80C8F4),
                  activeDotColor:Theme.of(context).primaryColor),
            ),
          ),
        ),

         Padding(
           padding: const EdgeInsets.symmetric(vertical: Dimensions.thirty,horizontal: Dimensions.defaultSize),
           child: Align(alignment: Alignment.bottomCenter,
             child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CustomSmallBottom(widget:  Text("skip".tr), color: Theme.of(context).hoverColor),
                 CustomSmallBottom(onTap: (){ Get.to(const SocialLoginScreenView());                  // Get.toNamed(RouteHelper.dashboardScreen);
                   },
                     widget:  Text("continue".tr,style: textMedium.copyWith(color: Theme.of(context).cardColor),),
                     color: Theme.of(context).primaryColor),
               ],
             ),
           ),
         ),


      ],)
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



class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height - 70);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 70);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
