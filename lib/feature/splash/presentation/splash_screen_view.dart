import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/feature/onboarding/view/onboarding_screen.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>  with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    _route();
    _controller = AnimationController(duration: const Duration(milliseconds: 3000), vsync: this, value: 0.1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuint);
    _controller.forward();
    _controller.addStatusListener((status) {

    });
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  late AnimationController _controller;

  late Animation<double> _animation;


  void _route(){
    Future.delayed(const Duration(seconds: 5),() =>
        Get.offAllNamed(RouteHelper.dashboard)

  //  Get.offAllNamed(RouteHelper.getOnboardingRoute()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Stack(alignment: Alignment.center, children: [
            // Transform.scale(scale: 3, child: const RotationTransition(
            //     turns: AlwaysStoppedAnimation(90 / 360), child: SizedBox())),

            Column(mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                const SizedBox(height: Dimensions.paddingSizeSmall,),
                Text("Fashion Shop",style: textBold.copyWith(fontSize: 30))])])));
  }
}
