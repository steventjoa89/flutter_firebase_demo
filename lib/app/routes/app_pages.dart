import 'package:get/get.dart';
import 'package:my_app/app/modules/add-product/bindings/add_product_bindings.dart';
import 'package:my_app/app/modules/add-product/views/add_product_view.dart';
import 'package:my_app/app/modules/edit-product/bindings/edit_product_bindings.dart';
import 'package:my_app/app/modules/edit-product/views/edit_product_view.dart';
import 'package:my_app/app/modules/file-upload/bindings/file_upload_bindings.dart';
import 'package:my_app/app/modules/file-upload/views/file_upload_view.dart';
import 'package:my_app/app/modules/home/bindings/home_bindings.dart';
import 'package:my_app/app/modules/home/views/home_view.dart';
import 'package:my_app/app/modules/login/bindings/login_bindings.dart';
import 'package:my_app/app/modules/login/views/login_view.dart';
import 'package:my_app/app/modules/query/bindings/query_bindings.dart';
import 'package:my_app/app/modules/query/views/query_view.dart';
import 'package:my_app/app/modules/reset_password/bindings/reset_password_bindings.dart';
import 'package:my_app/app/modules/reset_password/views/reset_password_view.dart';
import 'package:my_app/app/modules/signup/bindings/signup_bindings.dart';
import 'package:my_app/app/modules/signup/views/signup_view.dart';
import 'package:my_app/app/modules/store/bindings/query_bindings.dart';
import 'package:my_app/app/modules/store/views/store_view.dart';
import 'package:my_app/app/routes/routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignupView(),
      binding: SignupBindings(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBindings(),
    ),
    GetPage(
      name: Routes.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBindings(),
    ),
    GetPage(
      name: Routes.EDIT_PRODUCT,
      page: () => EditProductView(),
      binding: EditProductBindings(),
    ),
    GetPage(
      name: Routes.QUERY,
      page: () => QueryView(),
      binding: QueryBindings(),
    ),
    GetPage(
      name: Routes.STORE,
      page: () => StoreView(),
      binding: StoreBindings(),
    ),
    GetPage(
      name: Routes.FILE_UPLOAD,
      page: () => FileUploadView(),
      binding: FileUploadBindings(),
    ),
  ];
}
