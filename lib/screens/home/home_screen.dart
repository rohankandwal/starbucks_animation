import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:starbuck_animation_redesign/screens/home/widgets/home_product_pageview_widget.dart';
import 'package:starbuck_animation_redesign/screens/order_now/order_now.dart';
import 'package:starbuck_animation_redesign/utils/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Container(
      child: Stack(
        children: [
          _getBackgroundAnimation(),
          _getViewPager(),
        ],
      ),
    );
  }

  Widget _getBackgroundAnimation() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Lottie.asset(AppConstants.fileDrinkingCoffeeAnimation));
  }

  Widget _getViewPager() {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      controller: _pageController,
      itemBuilder: (context, index) {
        return _getViewPagerBuilder(index);
      },
      itemCount: 5,
    );
  }

  Widget _getViewPagerBuilder(final int index) {
    if (index == _currPageValue.floor()) {
      // For current page
      final double angle = _currPageValue - index;
      // debugPrint("Current angle rotation = $angle");
      return Transform(
        transform: Matrix4.identity()
          ..rotateY(angle)
          ..rotateZ(angle),
        child: _getProductPageViewWidget(),
      );
    } else if (index == _currPageValue.floor() + 1) {
      // For next page
      // For current page
      final double angle = _currPageValue - index;
      // debugPrint("Current angle rotation = $angle");
      return Transform(
        transform: Matrix4.identity()
          ..rotateY(angle)
          ..rotateZ(angle),
        child: _getProductPageViewWidget(),
      );
    } else {
      // For previous page
      return _getProductPageViewWidget();
    }
  }

  Widget _getProductPageViewWidget() {
    return HomeProductPageViewWidget(onAddItemClick: () {
      Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 900),
        pageBuilder: (_, __, ___) => const OrderNowScreen(),
        settings: const RouteSettings(),
      ) /*MaterialPageRoute<void>(
        builder: (context) => OrderNowScreen(),
      )*/
          );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
