import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/data/model/user_model.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/route_manager/screen_names.dart';
import 'package:watch_store/screens/register/register_cubit.dart';
import 'package:watch_store/utils/image_handler.dart';
import 'package:watch_store/widget/app_text_field.dart';
import 'package:watch_store/widget/avatar.dart';
import 'package:watch_store/widget/main_button.dart';
import 'package:watch_store/widget/snack_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postalController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  double lat = 0.0;
  double lng = 0.0;

  ImageHandler imageHandler = ImageHandler();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.height * .06),
        child: Container(
          height: size.height * .06,
          color: AppColors.appbar,
          child: Padding(
            padding: const EdgeInsets.only(
                left: AppDimens.medium, right: AppDimens.large),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 21,
                    )),
                const Text(
                  AppStrings.register,
                  style: AppTextStyles.appBarText,
                )
              ],
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocProvider(
            create: (context) => RegisterCubit(),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppDimens.small.height,
                  Avatar(
                      file: imageHandler.getImage,
                      onTap: () async => await imageHandler
                          .pickAndCropImage(source: ImageSource.gallery)
                          .then((value) => setState(() {}))),
                  AppDimens.medium.height,
                  AppTextField(
                    lable: AppStrings.nameLastName,
                    hint: AppStrings.hintNameLastName,
                    controller: _nameController,
                    align: TextAlign.end,
                    errorText: 'لطفا نام و نام خانوادگی را وارد کنید',
                  ),
                  AppTextField(
                    lable: AppStrings.homeNumber,
                    hint: AppStrings.hintHomeNumber,
                    controller: _phoneController,
                    align: TextAlign.end,
                    errorText: 'لطفا تلفن ثابت را وارد کنید',
                  ),
                  AppTextField(
                    lable: AppStrings.address,
                    hint: AppStrings.hintAddress,
                    controller: _addressController,
                    align: TextAlign.end,
                    errorText: 'لطفا آدرس را وارد کنید',
                  ),
                  AppTextField(
                    lable: AppStrings.postalCode,
                    hint: AppStrings.hintPostalCode,
                    controller: _postalController,
                    align: TextAlign.end,
                    errorText: 'لطفا کد پستی را وارد کنید',
                  ),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is LocationPickedState) {
                        if (state.location != null) {
                          _locationController.text =
                              '${state.location!.latitude} - ${state.location!.longitude}';
                          lat = state.location!.latitude;
                          lng = state.location!.longitude;
                        }
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<RegisterCubit>(context)
                              .pickLocation(context: context);
                        },
                        child: AppTextField(
                          lable: AppStrings.location,
                          hint: AppStrings.hintLocation,
                          icon: const Icon(
                            Icons.add_location_outlined,
                            size: 27,
                          ),
                          controller: _locationController,
                          align: TextAlign.end,
                          errorText: 'لطفا موقعیت مکانی را انتخاب کنید',
                        ),
                      );
                    },
                  ),
                  AppDimens.small.height,
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is OkRegisteredState) {
                        Navigator.pushReplacementNamed(
                            context, ScreenNames.mainScreen);
                      } else if (state is ErrorState) {
                        showCustomSnackBar(
                            context, "ثبت نام با خطا مواجه شد", 4, "error");
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return LoadingAnimationWidget.staggeredDotsWave(
                          color: AppColors.loadingColor,
                          size: 42,
                        );
                      } else {
                        return MainButton(
                            child: const Text(AppStrings.register,style: AppTextStyles.mainButton,),
                            onPressed: () async {
                              if (imageHandler.getImage == null) {
                                showCustomSnackBar(
                                    context,
                                    "لطفا تصویر پروفایل را انتخاب کنید",
                                    5,
                                    "error");
                              } else if (_formKey.currentState!.validate()) {
                                UserModel user = UserModel(
                                    name: _nameController.text,
                                    phone: _phoneController.text,
                                    postalCode: _postalController.text,
                                    address: _addressController.text,
                                    image: await MultipartFile.fromFile(
                                        imageHandler.getImage!.path ?? ''),
                                    lat: lat,
                                    lng: lng);
                                BlocProvider.of<RegisterCubit>(context)
                                    .register(user: user);
                              }
                            });
                      }
                    },
                  ),
                  70.height,
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
