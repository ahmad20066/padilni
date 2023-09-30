class UserModel 
{
  final String? email ;
  final String? name ;
  final String? password ;
  final String? deviceToken ; 
  final String? uuid ; 
  final String? code ; 
  final String? deviceType;

  UserModel({
    this.email,
    this.name,
    this.password ,
    this.deviceType ,
    this.code ,
    this.deviceToken ,
    this.uuid
   }); 

   Map<String,dynamic> userRegisterToJson()
   { 
    return {
      "email":email ,
      "password":password ,
      "name":name
    };
   } 

   Map<String,dynamic> userVerifyToJson()
   {
     return { 
      "email": email ,
      "code":code ,
      "device_type":deviceType ,
      "device_uuid":uuid ,
      "notification_token":deviceToken
      
     };

   }
}