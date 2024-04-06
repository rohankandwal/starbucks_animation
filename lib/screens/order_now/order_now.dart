import 'package:easy_signature_pad/easy_signature_pad.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:starbuck_animation_redesign/screens/order_complete/order_complete_screen.dart';
import 'package:starbuck_animation_redesign/utils/app_constants.dart';
import 'package:starbuck_animation_redesign/utils/font_constants.dart';

class OrderNowScreen extends StatefulWidget {
  const OrderNowScreen({Key? key}) : super(key: key);

  @override
  State<OrderNowScreen> createState() => _OrderNowScreenState();
}

class _OrderNowScreenState extends State<OrderNowScreen>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<bool> _starbucksCup = ValueNotifier(false);
  final ValueNotifier<String> _tagNotifier =
      ValueNotifier(AppConstants.productImageHeroTag);
  final ValueNotifier<String> _orderButtonNotifier = ValueNotifier("Own It!");
  late AnimationController _controller;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _offset = Tween<Offset>(begin: const Offset(0, .93), end: Offset.zero)
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _getBackgroundDoodle(),
          Expanded(child: _getProductInfo()),
        ],
      ),
    );
  }

  Widget _getBackgroundDoodle() {
    return Container(
      color: Colors.yellow,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppConstants.imageOrderNowBackground),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.white.withAlpha(127),
                    Colors.white,
                  ],
                  begin: const Alignment(0, -1),
                  end: const Alignment(0, .8),
                ),
              ),
            ),
          ),
          _getProductionAnimation(),
          _getStarbucksCupImage(),
        ],
      ),
    );
  }

  Widget _getProductInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getProductImageAndTitle(),
          _getDescription(),
          _getSpacing(16),
          _getOrderNowButton(),
        ],
      ),
    );
  }

  Widget _getProductionAnimation() {
    return Transform.scale(
      scale: 1.7,
      child: Lottie.asset(
        AppConstants.fileCappucinoAnimation,
      ),
    );
  }

  Widget _getStarbucksCupImage() {
    return ValueListenableBuilder(
      valueListenable: _starbucksCup,
      builder: (context, bool value, _) {
        return Visibility(
          child: Stack(
            children: [
              SlideTransition(
                position: _offset,
                child: Transform.scale(
                  scale: 1.28,
                  child: Container(
                    child: Image.asset(AppConstants.imageStarbucksCup),
                    margin: EdgeInsets.only(top: 40),
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.center,
                  child: ClipPath(
                    clipper: MyClip(35),
                    clipBehavior: Clip.hardEdge,
                    child: EasySignaturePad(
                      onChanged: (image) {},
                      height: 200,
                      width: 200,
                      penColor: Colors.black,
                      strokeWidth: 2.0,
                      borderRadius: 0.0,
                      borderColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      transparentImage: false,
                      transparentSignaturePad: false,
                      hideClearSignatureIcon: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
          visible: value,
        );
      },
    );
  }

  Widget _getProductImageAndTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _getProductImage(),
        _getProductTitle(),
      ],
    );
  }

  Widget _getSpacing(double _height) {
    return SizedBox(
      height: _height,
    );
  }

  Widget _getProductImage() {
    return SizedBox(
      height: 100,
      child: ValueListenableBuilder(
        builder: (context, String value, child) {
          return Hero(
            tag: value,
            transitionOnUserGestures: true,
            child: Image.asset(
              AppConstants.imageStarbucksCoffee,
            ),
          );
        },
        valueListenable: _tagNotifier,
      ),
    );
  }

  Widget _getProductTitle() {
    return Text(
      "Cappucino",
      style: FontConstants.fontItalicStyle(
        fontSize: 24,
        fontColor: AppColors.seaGreen,
      ),
      // style: TextStyle(color: AppColors.seaGreen, fontSize: 20),
    );
  }

  Widget _getDescription() {
    return Text(
      "Dark, rich espresso lies in wait under a smoothed and stretched layer of thick milk foam. An alchemy of barista artistry and craft.",
      textAlign: TextAlign.center,
      style: FontConstants.fontRegularStyle(
        fontSize: 14,
        fontColor: AppColors.black,
      ),
      // style: TextStyle(color: AppColors.black, fontSize: 14),
    );
  }

  Widget _getOrderNowButton() {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        child: ValueListenableBuilder(
          builder: (context, String value, child) {
            return Container(
              width: 130,
              child: Text(
                value,
                style: FontConstants.fontMediumStyle(
                  fontColor: AppColors.seaGreen,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.seaGreen, width: 1),
                shape: BoxShape.rectangle,
              ),
            );
          },
          valueListenable: _orderButtonNotifier,
        ),
        onTap: () {
          if (!_starbucksCup.value) {
            _starbucksCup.value = true;
            _controller.forward();
            _orderButtonNotifier.value = "Order Now";
          } else {
            _tagNotifier.value = AppConstants.productOrderHeroTag;
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (BuildContext context, Animation<double> animation,
                        Animation<double> secondaryAnimation) =>
                    const OrderCompleteScreen(),
                transitionDuration: const Duration(milliseconds: 2000),
              ),
            );
          }
        },
      ),
    );
  }
}

class MyClip extends CustomClipper<Path> {
  final double cutLength;

  MyClip(this.cutLength);

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - cutLength, size.height);
    path.lineTo(cutLength, size.height);
    path.close();
    return path;
  }
}
