import 'package:dio/dio.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/data/remote/diohelper.dart';
import '../../models/app_response.dart';
import '../../models/user/user_model.dart';

class AuthRepository { 

Future<AppResponse> signUp(UserModel model) async
{   
  try{
    var appResponse = await DioHelper.post(url: SignUpApi , body: model.userRegisterToJson());
       return AppResponse(
        data: appResponse.data ,
        success: true, 
        errorMessage: null
       ); 
  } on DioException catch(e)
  {   
     return AppResponse(
        data: null ,
        success: false, 
        errorMessage: e.message ?? e.toString()
       ); 
  }   

}  

Future<AppResponse> verifyEmailAddress(UserModel model) async
{    
  try{   

     var appResponse = await DioHelper.post(url: verifyemail , body: model.userVerifyToJson()); 
     return AppResponse(
      success: true , 
      errorMessage: null ,
      data: appResponse.data
     );
  } on DioException catch (e)
  {
      return AppResponse(
        success: false ,
        errorMessage: e.message ?? e.toString(),
        data: null
           );
  }
  
}

}