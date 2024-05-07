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
import '../../data/model/product_details_model.dart';

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
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
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
                          imageUrl: state.productDetailsModel.image ?? '',
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
                              Text(
                                state.productDetailsModel.brand!,
                                style: AppTextStyles.productTitle,
                                textDirection: TextDirection.rtl,
                              ),
                              Text(
                                state.productDetailsModel.title!,
                                style: AppTextStyles.appBarText,
                                textDirection: TextDirection.rtl,
                              ),
                              AppDimens.medium.height,
                              SizedBox(
                                height: 60,
                                child: ListView.builder(
                                  itemCount: state
                                      .productDetailsModel.properties!.length,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0,
                                          horizontal: AppDimens.small + 2),
                                      margin: const EdgeInsets.only(
                                          left: AppDimens.small),
                                      decoration: BoxDecoration(
                                          color: AppColors.surfaceColor,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            state.productDetailsModel
                                                .properties![index].property!,
                                            style: AppTextStyles.productCaption,
                                          ),
                                          2.height,
                                          Text(
                                            state.productDetailsModel
                                                .properties![index].value!,
                                            style: AppTextStyles.appBarText,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const Divider(),
                              AppDimens.small.height,
                              SizedBox(
                                height: 50,
                                child: ListView.builder(
                                  itemCount:
                                      state.productDetailsModel.colors!.length,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: AppDimens.medium),
                                      margin: const EdgeInsets.only(
                                          left: AppDimens.small),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                color: AppColors.shadow,
                                                blurRadius: 2)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(70)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            state.productDetailsModel
                                                .colors![index].title!,
                                            style: AppTextStyles.productCaption,
                                          ),
                                          AppDimens.small.width,
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                border: Border.all(
                                                    color: AppColors.shadow),
                                                color: Color(state
                                                    .productDetailsModel
                                                    .colors![index]
                                                    .code!
                                                    .toColor())),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              AppDimens.large.height,
                              Text(
                                state.productDetailsModel.guaranty!,
                                style: AppTextStyles.mainButton
                                    .apply(color: Colors.green.shade900),
                              ),
                              AppDimens.small.height,
                              const Divider(),
                              ProductTabView(
                                  productDetails: state.productDetailsModel),
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
                                    "${state.productDetailsModel.price!.separateWithComma} تومان",
                                    textDirection: TextDirection.rtl,
                                    style: AppTextStyles.productPrice,
                                  ),
                                  AppDimens.small.width,
                                  Visibility(
                                    visible:
                                        state.productDetailsModel.discount! > 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(
                                          AppDimens.small * .31),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          color: Colors.red),
                                      child: Text(
                                        " ${state.productDetailsModel.discount!} % ",
                                        style: AppTextStyles.discount,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                  visible:
                                      state.productDetailsModel.discount! > 0,
                                  child: Text(
                                    state.productDetailsModel.discountPrice!
                                        .separateWithComma,
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
  const ProductTabView({super.key, required this.productDetails});

  final ProductDetailsModel productDetails;

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
          children: [
            Comments(
              comments: widget.productDetails.comments!,
            ),
            Review(
              content: widget.productDetails.discussion!,
            ),
            Description(
              content: widget.productDetails.description!,
            )
          ],
        )
      ],
    );
  }

  List<String> tabs = [
    "نظرات",
    "نقد وبررسی",
    "توضیحات",
  ];
}

class Description extends StatelessWidget {
  const Description({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.justify,
      style: AppTextStyles.productDetail,
    );
  }
}

class Review extends StatelessWidget {
  const Review({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      content,
      textDirection: TextDirection.rtl,
      style: AppTextStyles.appBarText,
    ));
  }
}

class Comments extends StatelessWidget {
  const Comments({super.key, required this.comments});

  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Expanded(
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: comments.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimens.medium, horizontal: AppDimens.medium),
            margin: const EdgeInsets.only(bottom: AppDimens.small),
            decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(12)),
            child: Text(
              "${comments[index].user}: ${comments[index].body}",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.left,
              style: AppTextStyles.appBarText,
            ),
          );
        },
      ),
    ));
  }
}
