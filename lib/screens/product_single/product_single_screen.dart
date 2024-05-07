import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/screens/product_single/bloc/product_single_bloc.dart';
import 'package:watch_store/widget/app_bar.dart';
import 'package:watch_store/widget/cart_badge.dart';
import '../../component/button_style.dart';

class ProductSingleScreen extends StatefulWidget {
  const ProductSingleScreen({super.key, required this.id});

  final int id;

  @override
  State<ProductSingleScreen> createState() => _ProductSingleScreenState();
}

class _ProductSingleScreenState extends State<ProductSingleScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductSingleBloc>(context)
        .add(ProductSingleInit(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: BlocConsumer<ProductSingleBloc, ProductSingleState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is ProductSingleLoading) {
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
          } else if (state is ProductSingleSuccess) {
            return Scaffold(
              appBar: CustomAppBar(
                child: Row(
                  children: [
                    const CartBadge(
                      count: 2,
                    ),
                    Expanded(
                        child: Text(
                      state.productDetailsModel.title ?? "بدون نام",
                      style: AppTextStyles.catTitle,
                      textDirection: TextDirection.rtl,
                    )),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset(Assets.svg.close.path),
                      splashRadius: 0.1,
                    )
                  ],
                ),
              ),
              body: Stack(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: state.productDetailsModel.image??'',
                          fit: BoxFit.cover,
                          height: size.height * .28,
                          placeholder: (context, url) => Center(
                            child: LoadingAnimationWidget.discreteCircle(
                              color: AppColors.loadingColor,
                              secondRingColor: AppColors.amazingColor,
                              thirdRingColor: Colors.grey,
                              size: 20,
                            ),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Image.asset(Assets.png.mainLogo.path),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(AppDimens.medium),
                          padding: const EdgeInsets.all(AppDimens.medium),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(AppDimens.medium)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "بنسر",
                                style: AppTextStyles.productTitle,
                                textDirection: TextDirection.rtl,
                              ),
                              Text(
                                "مسواک بنسر مدل اکسترا با برس متوسط",
                                style: AppTextStyles.productCaption,
                                textDirection: TextDirection.rtl,
                              ),
                              const Divider(),
                              const ProductTabView()
                            ],
                          ),
                        ),
                        65.height
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: double.infinity,
                      height: 72,
                      padding: const EdgeInsets.all(AppDimens.medium),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.shadow,
                                offset: Offset(0, -2),
                                blurRadius: 20)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${69000.separateWithComma} تومان",
                                    textDirection: TextDirection.rtl,
                                    style: AppTextStyles.productPrice,
                                  ),
                                  AppDimens.small.width,
                                  Visibility(
                                    visible: 20 > 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(
                                          AppDimens.small * .31),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          color: Colors.red),
                                      child: const Text(
                                        " 20 % ",
                                        style: AppTextStyles.discount,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                  visible: 20 > 0,
                                  child: Text(
                                    122000.separateWithComma,
                                    style: AppTextStyles.oldPrice,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: size.height * .055,
                            width: size.width * .4,
                            child: ElevatedButton(
                              style: AppButtonStyle.mainButtonStyle,
                              onPressed: () {},
                              child: const Text(
                                "افزودن به سبد خرید",
                                style: AppTextStyles.mainButton,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (state is ProductSingleError) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.error,
                  style: AppTextStyles.error,
                ),
                AppDimens.medium.width,
                Icon(
                  CupertinoIcons.exclamationmark_circle,
                  color: Colors.red.shade400,
                ),
              ],
            );
          } else {
            throw Exception("Invalid Home State");
          }
        },
      ),
    );
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  var selectedTab = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: ListView.builder(
            itemCount: tabs.length,
            scrollDirection: Axis.horizontal,
            itemExtent: MediaQuery.sizeOf(context).width / 3,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => setState(() => selectedTab = index),
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.medium),
                  child: Text(
                    tabs[index],
                    style: index == selectedTab
                        ? AppTextStyles.selectedTab
                        : AppTextStyles.unSelectedTab,
                  ),
                ),
              );
            },
          ),
        ),
        IndexedStack(
          index: selectedTab,
          children: const [Comments(), Review(), Features()],
        )
      ],
    );
  }

  List<String> tabs = [
    "نظرات",
    "نقد وبررسی",
    "خصوصیات",
  ];
}

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.lurem,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.justify,
      style: AppTextStyles.productDetail,
    );
  }
}

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "برای این محصول هیچ نقد و بررسی ثبت نشده است!",
      textDirection: TextDirection.rtl,
      style: AppTextStyles.appBarText,
    ));
  }
}

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "برای این محصول هیچ نظری ثبت شده است!",
      textDirection: TextDirection.rtl,
      style: AppTextStyles.appBarText,
    ));
  }
}
