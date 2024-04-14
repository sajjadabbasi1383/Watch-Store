import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/data/src/api_constant.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Dio _dio = Dio();

  sendSms(String mobile) async {
    emit(LoadingState());
    try {
      await _dio
          .post(ApiConstant.sendSms, data: {"mobile": mobile}).then((value) {
        debugPrint(value.toString());
        if (value.statusCode == 201) {
          emit(SentState());
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }
}
