import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:starbuck_animation_redesign/utils/app_constants.dart';
import 'package:starbuck_animation_redesign/utils/font_constants.dart';

class OrderCompleteScreen extends StatefulWidget {
  const OrderCompleteScreen({Key? key}) : super(key: key);

  @override
  State<OrderCompleteScreen> createState() => _OrderCompleteScreenState();
}

class _OrderCompleteScreenState extends State<OrderCompleteScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _bikeDeliveryOffsetAnimation;
  final Offset _beginOffset = const Offset(-2, 0);
  final Animatable<Color?> _background = TweenSequence<Color?>(
    [
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: AppColors.seaGreen,
          end: AppColors.starbucksGreen,
        ),
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _bikeDeliveryOffsetAnimation =
        Tween<Offset>(begin: _beginOffset, end: const Offset(0, 0))
            .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return AnimatedBuilder(
      builder: (_, __) => Container(
        color: _background.evaluate(
          AlwaysStoppedAnimation(_controller.value),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getSpacing(MediaQuery.of(context).size.height / 6),
            _getStarbucksLogo(),
            _getSpacing(16),
            _getYourOrderDescription(),
            _getBikeDelivery(),
          ],
        ),
      ),
      animation: _controller,
    );
  }

  Widget _getSpacing(double _height) {
    return SizedBox(
      height: _height,
    );
  }

  Widget _getStarbucksLogo() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 6,
      color: AppColors.yellow,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.2, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(_controller),
            child: Image.asset(
              AppConstants.imageStarBucksLogoIcon,
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-0.2, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(_controller),
            child: Image.asset(
              AppConstants.imageStarbucksCoffee,
              fit: BoxFit.fitHeight,
            ),
          )
        ],
      ),
    );
  }

  Widget _getYourOrderDescription() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        "Your order is on its way!",
        style: FontConstants.fontRegularStyle(
          fontSize: 40,
          fontColor: AppColors.white,
        ),
      ),
    );
  }

  Widget _getBikeDelivery() {
    return Expanded(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _bikeDeliveryOffsetAnimation,
              child: Lottie.asset(
                AppConstants.fileBikeDeliveryAnimation,
                height: 120,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
