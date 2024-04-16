import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/data/model/user_model.dart';
import 'package:watch_store/data/src/api_constant.dart';
import 'package:watch_store/utils/shared_preferences_manager.dart';

import '../../component/text_style.dart';
import '../../utils/shared_preferences_constant.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final Dio _dio = Dio();

  pickLocation({required context}) async {
    await showSimplePickerLocation(
            isDismissible: true,
            title: "انتخاب موقعیت مکانی",
            textCancelPicker: "لغو",
            textConfirmPicker: "انتخاب",
            zoomOption: const ZoomOption(initZoom: 8.0),
            initCurrentUserPosition:
                const UserTrackingOption.withoutUserPosition(),
            radius: 8,
            titleStyle: AppTextStyles.avatarText,
            context: context)
        .then((value) => emit(LocationPickedState(location: value)));
  }


}
