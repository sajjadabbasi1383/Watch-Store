import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/data/repo/home_repo.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/screens/product_list/product_list_screen.dart';
import 'package:watch_store/widget/cat_widget.dart';

import '../../component/text_style.dart';
import '../../widget/app_slider.dart';
import '../../widget/product_item.dart';
import '../../widget/search_btn.dart';
import '../../widget/vertical_text.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(homeRepository);
        homeBloc.add(HomeInit());
        return homeBloc;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
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
                } else if (state is HomeLoaded) {
                  return Column(
                    children: [
                      SearchBtn(
                        onTap: () {},
                      ),
                      AppSlider(
                        imgList: state.home.sliders,
                      ),

                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .14,
                        child: ListView.builder(
                          padding:
                              const EdgeInsets.only(right: AppDimens.large),
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.home.categories.length,
                          itemBuilder: (context, index) {
                            return CatWidget(
                              colors: AppColors.catColors,
                              iconPath: state.home.categories[index].image,
                              title: state.home.categories[index].title,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductListScreen(
                                        param: state.home.categories[index].id,
                                      ),
                                    ));
                              },
                            );
                          },
                        ),
                      ),

                      AppDimens.small.height,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        reverse: true,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 310,
                              child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: state.home.amazingProducts.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ProductItem(
                                    image:
                                        state.home.amazingProducts[index].image,
                                    productName:
                                        state.home.amazingProducts[index].title,
                                    price:
                                        "${state.home.amazingProducts[index].price.separateWithComma} تومان",
                                    discount: state
                                        .home.amazingProducts[index].discount,
                                    oldPrice: state.home.amazingProducts[index]
                                        .discountPrice.separateWithComma,
                                    specialExpiration: state
                                        .home
                                        .amazingProducts[index]
                                        .specialExpiration),
                              ),
                            ),
                            const VerticalText(
                              title: "شگفت انگیز",
                              textStyle: AppTextStyles.amazingProducts,
                            )
                          ],
                        ),
                      ),
                      AppDimens.small.height,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        reverse: true,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 320,
                              child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: state.home.mostSellerProducts.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ProductItem(
                                    image: state
                                        .home.mostSellerProducts[index].image,
                                    productName: state
                                        .home.mostSellerProducts[index].title,
                                    price:
                                        "${state.home.mostSellerProducts[index].price.separateWithComma} تومان",
                                    discount: state.home
                                        .mostSellerProducts[index].discount,
                                    oldPrice: state
                                        .home
                                        .mostSellerProducts[index]
                                        .discountPrice
                                        .separateWithComma,
                                    specialExpiration: state
                                        .home
                                        .mostSellerProducts[index]
                                        .specialExpiration),
                              ),
                            ),
                            const VerticalText(
                              title: "پرفروش ها",
                              textStyle: AppTextStyles.bestSellersProducts,
                            )
                          ],
                        ),
                      ),
                      AppDimens.small.height,
                      Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(Assets.png.banner.path),
                      ),

                      AppDimens.small.height,
                      //AppDimens.small.height,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        reverse: true,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 320,
                              child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: state.home.newestProducts.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ProductItem(
                                    image:
                                        state.home.newestProducts[index].image,
                                    productName:
                                        state.home.newestProducts[index].title,
                                    price:
                                        "${state.home.newestProducts[index].price.separateWithComma} تومان",
                                    discount: state
                                        .home.newestProducts[index].discount,
                                    oldPrice: state.home.newestProducts[index]
                                        .discountPrice.separateWithComma,
                                    specialExpiration: state
                                        .home
                                        .newestProducts[index]
                                        .specialExpiration),
                              ),
                            ),
                            const VerticalText(
                              title: "جدیدترین ها",
                              textStyle: AppTextStyles.newestProducts,
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is HomeError) {
                  return const Text("error");
                } else {
                  throw Exception("Invalid Home State");
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
