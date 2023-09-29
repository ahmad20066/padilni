import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/data/repositories/auth_repository.dart';
import 'package:padilni/models/user/user_model.dart';
import 'package:padilni/utils/request_status.dart';

class SignUpController extends GetxController 
{   

  final AuthRepository _authRepository = AuthRepository() ; 

  var requeststatus = RequestStatus.begin.obs;

  setRequestStatus (RequestStatus status) => requeststatus.value = status;
   
   Future<void> userRegister({required String email,
    required String password ,
    required String name}) async
   {   
    setRequestStatus(RequestStatus.loading);
    UserModel userModel = UserModel(email: email , password:  password , name: name);
    var response = await _authRepository.signUp(userModel); 

      if(response.success!) 
      { 
        setRequestStatus(RequestStatus.success);
        debugPrint("pravo"); 
        
        Get.toNamed("/verification");

      } 
      else 
      { 
        setRequestStatus(RequestStatus.onerror);
        debugPrint("Not pravo");
      }
   }

}