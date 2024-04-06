import 'package:flutter/material.dart';
import 'package:starbuck_animation_redesign/utils/app_constants.dart';
import 'package:starbuck_animation_redesign/utils/font_constants.dart';

class HomeProductPageViewWidget extends StatelessWidget {
  final Function onAddItemClick;

  const HomeProductPageViewWidget({Key? key, required this.onAddItemClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.seaGreen,
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getProductImage(),
          _getSpacing(24),
          _getProductName(),
          _getSpacing(16),
          _getPrice(),
          _getSpacing(16),
          _getDescription(),
          _getSpacing(64),
          _getAddButton(),
        ],
      ),
    );
  }

  Widget _getSpacing(double _height) {
    return SizedBox(
      height: _height,
    );
  }

  Widget _getProductImage() {
    return SizedBox(
      height: 250,
      child: Hero(
        tag: AppConstants.productImageHeroTag,
        transitionOnUserGestures: true,
        child: Image.asset(
          AppConstants.imageStarbucksCoffee,
        ),
      ),
    );
  }

  Widget _getProductName() {
    return Text(
      "Cappuchino",
      style: FontConstants.fontMediumStyle(
        fontColor: AppColors.white,
        fontSize: 28,
      ),
      // style: TextStyle(color: AppColors.white, fontSize: 24),
    );
  }

  Widget _getPrice() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: AppColors.white,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Text(
        "\$3.95",
        style: FontConstants.fontMediumStyle(
          fontColor: AppColors.white,
          fontSize: 16,
        ),
        // style: TextStyle(color: AppColors.white, fontSize: 18),
      ),
    );
  }

  Widget _getDescription() {
    return Text(
      "Dark, rich espresso lies in wait under a smoothed and stretched layer of thick milk foam. An alchemy of barista artistry and craft.",
      style: FontConstants.fontRegularStyle(
        fontColor: AppColors.white,
        fontSize: 14,
        height: 1.2,
      ),
      softWrap: true,
      textAlign: TextAlign.center,
    );
  }

  Widget _getAddButton() {
    return InkWell(
      onTap: () => onAddItemClick(),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Image.asset(
          AppConstants.imagePlusIcon,
          color: AppColors.white,
        ),
      ),
    );
  }
}
