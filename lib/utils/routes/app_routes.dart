import 'package:get/get.dart';
import 'package:padilni/presentation/add_item/screens/add_item_screen.dart';
import 'package:padilni/presentation/auth/login/controller/login_binding.dart';
import 'package:padilni/presentation/auth/login/login_page.dart';
import 'package:padilni/presentation/auth/newpassword/new_password_page.dart';
import 'package:padilni/presentation/auth/signup/logic/sign_up_binding.dart';
import 'package:padilni/presentation/auth/signup/sign_up_page.dart';
import 'package:padilni/presentation/auth/verification/logic/verification_binding.dart';
import 'package:padilni/presentation/auth/verification/verification_page.dart';
import 'package:padilni/presentation/category_items/screen/sub_category_items_screen.dart';
import 'package:padilni/presentation/category_items/screen/sub_categories_screen.dart';
import 'package:padilni/presentation/change_password/screens/change_password_screen.dart';
import 'package:padilni/presentation/chat/screens/chat_screen.dart';
import 'package:padilni/presentation/details_screen/details_screen.dart';
import 'package:padilni/presentation/exchange/screens/exchange_screen.dart';
import 'package:padilni/presentation/exchange/screens/exhange_via_item_screen.dart';
import 'package:padilni/presentation/exchange/screens/price_screen.dart';
import 'package:padilni/presentation/main_screen/screen/main_screen.dart';
import 'package:padilni/presentation/my_items/screens/my_items_screen.dart';
import 'package:padilni/presentation/my_orders/screens/my_order_details_screen.dart';
import 'package:padilni/presentation/notifications/screens/noitifications_screen.dart';
import 'package:padilni/presentation/onboarding/onboarding_page.dart';
import 'package:padilni/presentation/profile/pages/edit_profile_screen.dart';
import 'package:padilni/presentation/splashscreen/splash_screen.dart';
import 'package:padilni/presentation/wishlist/screens/wishlist_screen.dart';

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
  static const myOrderDetailsRoute = '/my-order-details';
  static const exchangeViaItemRoute = '/exchange-item';
  static const changePasswordRoute = '/change-password';
  static const notificationsRoute = '/notifications';
  static const categoryItemsRoute = "/category-items";
  static const editProfileRoute = '/edit-profile';
  static const wishlistRoute = '/wishlist';
  static const chatRoute = '/chat';
  static const subCategories = '/subCat';

  static List<GetPage> appRoutes = [
    GetPage(name: base, page: () => SplashScreen()),
    GetPage(name: chatRoute, page: () => ChatScreen()),
    GetPage(name: subCategories, page: () => SubCategoriesScreen()),
    GetPage(name: myOrderDetailsRoute, page: () => MyOrderDetailsScreen()),
    GetPage(name: editProfileRoute, page: () => EditProfileScreen()),
    GetPage(name: categoryItemsRoute, page: () => CategoryItemsScreen()),
    GetPage(name: notificationsRoute, page: () => NotificationsScreen()),
    GetPage(name: changePasswordRoute, page: () => ChangePasswordScreen()),
    GetPage(name: myItemsScreen, page: () => MyItemsScreen()),
    GetPage(name: addItem, page: () => AddItemScreen()),
    GetPage(name: main, page: () => MainScreen()),
    GetPage(name: newPassword, page: () => NewPasswordPage()),
    GetPage(name: onboarding, page: () => OnBoardingPage()),
    GetPage(name: wishlistRoute, page: () => WishlistScreen()),
    GetPage(name: login, page: () => LoginPage(), binding: LoginBindings()),
    GetPage(name: signUp, page: () => SignUpPage(), binding: SignUpBinding()),
    GetPage(
        name: verificationCode,
        page: () => VerificationPage(),
        binding: VerificationBinding()),
    GetPage(name: detailsScreen, page: () => DetailsScreen()),
    GetPage(name: cashExchangeRoute, page: () => PriceScreen()),
    GetPage(name: exchangeViaItemRoute, page: () => ExchangeViaItemScreen()),
    GetPage(
      name: exchangeScreenRoute,
      page: () => ExchangeScreen(),
    ),
  ];
}
