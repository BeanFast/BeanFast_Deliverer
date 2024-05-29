import 'package:get/get.dart';

import '/services/api_service.dart';
import '/enums/auth_state_enum.dart';
import '/enums/menu_index_enum.dart';
import '/models/user.dart';

Rx<User?> currentUser = Rx<User?>(null);
final ApiService apiService = Get.find();
RxInt selectedMenuIndex = MenuIndexState.home.index.obs;
Rx<AuthState> authState = AuthState.unauthenticated.obs;

void changePage(int index) {
  selectedMenuIndex.value = index;
}

String defaultAvatarImagePath = "https://firebasestorage.googleapis.com/v0/b/bean-fast.appspot.com/o/assets%2Fkidsavatar.jpg?alt=media&token=906243e1-323b-4e0e-b328-71dde27c62e4";
