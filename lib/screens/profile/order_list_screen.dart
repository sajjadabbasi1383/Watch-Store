import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/screens/profile/bloc/profile_bloc.dart';

import '../../component/text_style.dart';
import '../../gen/assets.gen.dart';
import '../../res/colors.dart';
import '../../res/dimens.dart';
import '../../res/strings.dart';
import '../../widget/app_bar.dart';
import '../../widget/surface_container.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(UserProcessingOrders());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'لیست سفارشات',
              style: AppTextStyles.appBarText,
            ),
          ),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          buildWhen: (previous, current) {
            if (current is UserOrderSuccess ||
                current is UserOrderLoading ||
                current is UserOrderError) {
              return true;
            } else {
              return false;
            }
          },
          builder: (context, state) {
            if (state is UserOrderSuccess) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.small),
                child: ListView.builder(
                  itemCount: state.orderList.length,
                  padding: const EdgeInsets.only(bottom: 50),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    var order=state.orderList[index].orderDetails!;
                    return SurfaceContainer(
                      child: Column(
                        children: [
                          Text("کد سفارش: ${state.orderList[index].code}",style: AppTextStyles.appBarText,),
                          AppDimens.medium.height,
                          ListView.builder(
                            itemCount: order.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                    const EdgeInsets.only(bottom: AppDimens.small),
                                width: double.infinity,
                                padding: const EdgeInsets.all(AppDimens.medium),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppDimens.medium),
                                  color: AppColors.surfaceColor,
                                  border:
                                      Border.all(color: Colors.white,),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${order[index].count} عدد',
                                          style: AppTextStyles.productTitle,
                                          textDirection: TextDirection.rtl,
                                        ),
                                        AppDimens.medium.width,
                                        Expanded(
                                          child: Text(order[index].product!,
                                            style: AppTextStyles.productTitle,
                                            textDirection: TextDirection.rtl,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    AppDimens.medium.height,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "با تخفیف: ${order[index].discountPrice!.separateWithComma} تومان",
                                          textDirection: TextDirection.rtl,
                                          style: AppTextStyles.productPrice,
                                        ),
                                        Text(
                                          'قیمت: ${order[index].price!.separateWithComma}',
                                          style: AppTextStyles.oldPrice,
                                        ),
                                      ],
                                    ),
                                    AppDimens.medium.height,
                                    Text('در حال پردازش',
                                      style: AppTextStyles.productTitle.copyWith(color: Colors.orange,fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (state is UserOrderLoading) {
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
            } else if (state is UserOrderError) {
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
              throw Exception("Invalid $state State");
            }
          },
        ),
      ),
    );
  }
}
