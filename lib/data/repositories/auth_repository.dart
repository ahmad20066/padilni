import 'package:dio/dio.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/data/remote/diohelper.dart';

import '../../models/user/user_model.dart';

class AuthRepository { 

Future<AppResponse> signUp(UserModel model) async
{   
  try{
var appResponse = DioHelper.post(url: SignUpApi , body: model.userRegisterToJson());
  } on DioException catch(e)
  {
    
  } 


}



}