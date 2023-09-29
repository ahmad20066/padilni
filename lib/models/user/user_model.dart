class UserModel 
{
  final String? email ;
  final String? name ;
  final String? password ;
  UserModel({
    this.email,
    this.name,
    this.password
   }); 

   Map<String,dynamic> userRegisterToJson()
   { 
    return {
      "email":email ,
      "password":password ,
      "name":name
    };
   }
}