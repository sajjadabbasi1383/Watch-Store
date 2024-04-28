import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/data/repo/product_repo.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/screens/product_list/bloc/product_list_bloc.dart';

import '../../component/text_style.dart';
import '../../res/colors.dart';
import '../../res/dimens.dart';
import '../../widget/app_bar.dart';
import '../../widget/cart_badge.dart';
import '../../widget/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, this.param});

  final param;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final productListBloc = ProductListBloc(productRepository);
        productListBloc.add(ProductListInit(param));
        return productListBloc;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CartBadge(count: 2),
                Row(
                  children: [
                    const Text(
                      "پرفروش ترین ها",
                      style: AppTextStyles.avatarText,
                    ),
                    AppDimens.small.width,
                    SvgPicture.asset(
                      Assets.svg.sort.path,
                      height: 27,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Assets.svg.close.path),
                  splashRadius: 0.1,
                )
              ],
            ),
          ),
          body: BlocBuilder<ProductListBloc, ProductListState>(
            builder: (context, state) {
              if (state is ProductListLoading) {
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
              } else if (state is ProductListLoaded) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppDimens.medium,
                          horizontal: AppDimens.small),
                      child: SizedBox(
                        height: 60,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.brandList.length,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 100,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.small * .6),
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.small+2,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppDimens.medium),
                                gradient: const LinearGradient(
                                    colors: AppColors.catColors,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,),
                              ),
                              child:
                                  Image.network(state.brandList[index].image),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: state.productList.length,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                                childAspectRatio: 0.63),
                        itemBuilder: (context, index) => ProductItem(
                            image: state.productList[index].image,
                            productName: state.productList[index].title,
                            price:
                                "${state.productList[index].price.separateWithComma} تومان",
                            discount: state.productList[index].discount,
                            oldPrice: state.productList[index].discountPrice
                                .separateWithComma,
                            specialExpiration:
                                state.productList[index].specialExpiration),
                      ),
                    ),
                  ],
                );
              } else if (state is ProductListError) {
                return const Text("error");
              } else {
                throw Exception("Invalid Home State");
              }
            },
          ),
        ),
      ),
    );
  }
}
