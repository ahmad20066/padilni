import 'package:get/get.dart';
import 'package:padilni/presentation/add_item/screens/add_item_screen.dart';
import 'package:padilni/presentation/auth/login/controller/login_binding.dart';
import 'package:padilni/presentation/auth/login/login_page.dart';
import 'package:padilni/presentation/auth/newpassword/new_password_page.dart';
import 'package:padilni/presentation/auth/signup/logic/sign_up_binding.dart';
import 'package:padilni/presentation/auth/signup/sign_up_page.dart';
import 'package:padilni/presentation/auth/verification/logic/verification_binding.dart';
import 'package:padilni/presentation/auth/verification/verification_page.dart';
import 'package:padilni/presentation/details_screen/details_screen.dart';
import 'package:padilni/presentation/exchange/controller/exchange_binding.dart';
import 'package:padilni/presentation/exchange/screen/cash_exchange.dart';
import 'package:padilni/presentation/exchange/screen/exchange_screen.dart';
import 'package:padilni/presentation/favourites/favourites_screen.dart';
import 'package:padilni/presentation/main_screen/screen/main_screen.dart';
import 'package:padilni/presentation/notifications/notification_screen.dart';
import 'package:padilni/presentation/my_items/screens/my_items_screen.dart';
import 'package:padilni/presentation/onboarding/onboarding_page.dart';
import 'package:padilni/presentation/splashscreen/splash_screen.dart';

class AppRoutes {
  static const String base = "/";

  static const String main = "/main";

  static const String onboarding = "/onboarding";

  static const String login = '/login';

  static const String newPassword = '/new-password';
  static const String addItem = '/add_item';

  static const signUp = '/signup';

  static const verificationCode = "/verification";

  static const detailsScreen = '/details';
  static const myItemsScreen = '/my-items';
  static const myOrdersScreen = '/my-orders';

  static const exchangeScreenRoute = '/exchange_screen';

  static const cashExchangeRoute = '/cash'; 

  static const favouritesScreenRoute = '/favourites';

  static const notificationScreenRoute ='/notifications';

  static List<GetPage> appRoutes = [

    GetPage(name: base, page: () => SplashScreen()),
    GetPage(name: myItemsScreen, page: () => MyItemsScreen()),
    GetPage(name: addItem, page: () => AddItemScreen()),
    GetPage(name: main, page: () => MainScreen()),
    GetPage(name: newPassword, page: () => NewPasswordPage()),
    GetPage(name: onboarding, page: () => OnBoardingPage()),
    GetPage(name: login, page: () => LoginPage(), binding: LoginBindings()),

    GetPage(name: signUp, page: ()=>SignUpPage(),binding: SignUpBinding()) ,

    GetPage(name: verificationCode, page: ()=>VerificationPage() , binding: VerificationBinding()) ,
    
    GetPage(name:detailsScreen , page: ()=> DetailsScreen()) , 

    GetPage(name: exchangeScreenRoute, page: ()=>ExchangeScreen() , binding: ExchangeBinding()),

    GetPage(name: cashExchangeRoute, page: ()=>CashExchangeScreen())  ,

    GetPage(name: favouritesScreenRoute, page: ()=>FavouritesScreen()) ,

    GetPage(name: notificationScreenRoute, page: ()=>NotificationScreen()) ,

    GetPage(name: signUp,
     page: () => SignUpPage(),
     binding: SignUpBinding()),

    GetPage(
        name: verificationCode,
        page: () => VerificationPage(),
        binding: VerificationBinding()),

    GetPage(name: detailsScreen,
     page: () => DetailsScreen()),

    GetPage(
        name: exchangeScreenRoute,
        page: () => ExchangeScreen(),
        binding: ExchangeBinding()),

    GetPage(
      name: cashExchangeRoute,
     page: () => CashExchangeScreen())
  ];
}
