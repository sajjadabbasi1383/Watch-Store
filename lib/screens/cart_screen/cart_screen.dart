import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/screens/cart_screen/bloc/cart_bloc.dart';
import 'package:watch_store/widget/app_bar.dart';

import '../../component/button_style.dart';
import '../../data/model/cart_model.dart';
import '../../widget/shopping_cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context).add(CartInitEvent());
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
            child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppStrings.basket,
            style: AppTextStyles.appBarText,
          ),
        )),
        body: Column(
          children: [
            Container(
              height: size.height * .105,
              width: double.infinity,
              margin: const EdgeInsets.only(
                  top: AppDimens.medium, bottom: AppDimens.small),
              padding: const EdgeInsets.all(AppDimens.medium),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: AppColors.shadow,
                    offset: Offset(0, 2),
                    blurRadius: 4)
              ]),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.svg.leftArrow.path)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.sendToAddress,
                          style: AppTextStyles.productCaption,
                        ),
                        const Text(
                          AppStrings.fakeAddress,
                          style: AppTextStyles.avatarText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartSuccessState) {
                  return CartList(
                    cartList: state.cartList,
                  );
                } else if (state is CartItemAddedState) {
                  return CartList(
                    cartList: state.cartList,
                  );
                } else if (state is CartItemRemoveState) {
                  return CartList(
                    cartList: state.cartList,
                  );
                } else if (state is CartItemDeleteState) {
                  return CartList(
                    cartList: state.cartList,
                  );
                } else if (state is CartErrorState) {
                  return const Center(
                    child: Text(
                      'خطا در بارگذاری اطلاعات...',
                      style: AppTextStyles.error,
                    ),
                  );
                } else if (state is CartLoadingState) {
                  return SizedBox(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LoadingAnimationWidget.staggeredDotsWave(
                          color: AppColors.loadingColor,
                          size: 40,
                        ),
                        AppDimens.small.height,
                        const Text(
                          "در حال تکمیل اطلاعات...",
                          style: AppTextStyles.loadingText,
                          textDirection: TextDirection.rtl,
                        )
                      ],
                    ),
                  );
                } else {
                  return ElevatedButton(
                    style: AppButtonStyle.mainButtonStyle,
                    onPressed: () {},
                    child: const Text(
                      'تلاش مجدد',
                      style: AppTextStyles.mainButton,
                    ),
                  );
                }
              },
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(color: AppColors.shadow, blurRadius: 10)
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "مجموع  63,500 تومان",
                    style: AppTextStyles.productPrice,
                  ),
                  SizedBox(
                    height: size.height * .052,
                    width: size.width * .38,
                    child: ElevatedButton(
                      style: AppButtonStyle.continueShoppingButtonStyle,
                      onPressed: () {},
                      child: const Text(
                        "ادامه فرآیند خرید",
                        style: AppTextStyles.mainButton,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  CartList({super.key, required this.cartList});

  List<CartModel> cartList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: AppDimens.large),
      itemCount: cartList.length,
      itemBuilder: (context, index) {
        return ShoppingCartItem(
          productTitle: cartList[index].product!,
          price: cartList[index].price!,
          oldPrice: cartList[index].discountPrice!,
          count: cartList[index].count!,
          image: cartList[index].image!,
          add: () =>BlocProvider.of<CartBloc>(context).add(AddToCartEvent(cartList[index].productId!)),
          remove: () =>BlocProvider.of<CartBloc>(context).add(RemoveFromCartEvent(cartList[index].productId!)),
          delete: () =>BlocProvider.of<CartBloc>(context).add(DeleteFromCartEvent(cartList[index].productId!)),
        );
      },
    ));
  }
}
