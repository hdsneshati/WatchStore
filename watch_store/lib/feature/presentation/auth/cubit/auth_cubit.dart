import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:watch_store/feature/data/source/contanst.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  Dio _dio = Dio();
  sendSms(String mobile) async {
    emit(AuthLoadingState());
    try {
      await _dio.post(Endpoint.sendSms, data: {"mobile": mobile}).then((value) {
        debugPrint(value.toString());
        if (value.statusCode == 201) {
          print('code date:');
          print(value.data["data"]["code"]);

          emit(AuthSendState());
        } else {
          emit(AuthErrorState());
        }
      });
    } catch (e) {
      emit(AuthErrorState());
    }
  }

  verifyCode(String mobile, String code) async {
    emit(AuthLoadingState());
    try {
      await _dio.post(Endpoint.checkSmsCode,
          data: {"mobile": mobile, "code": code}).then((value) {
        debugPrint(value.toString());
        if (value.statusCode == 201) {
          if (value.data["data"]["is_registered"]) {
            emit(AuthVerifyIsRegisterState());
          } else {
            emit(AuthVerifyState());
          }
          
        } else {
          emit(AuthErrorState());
        }
      });
    } catch (e) {
      emit(AuthErrorState());
    }
  }

  registration() async {}

  loggedOut() async {}
}
