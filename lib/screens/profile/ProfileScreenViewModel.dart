import 'package:video_book/constants/ConstantValues.dart';
import 'package:video_book/helpers/CacheHelper.dart';

import '../../helpers/AuthHelper.dart';
import '../../models/AuthModels.dart';

class ProfileScreenViewModel {
  final CacheHelper cacheHelper = CacheHelper();
  SignedInUser? signedInUser;

  Future<SignedInUser?> getSignedInUser() async {
    signedInUser = await cacheHelper.getSignedInUser();
    print("SignedInUser : ${signedInUser}");
    return signedInUser;
  }

  Future<OperationResult> signOut() async {
    var result = await AuthHelper.signOut();
    if (result) {
      await cacheHelper.clearSignedInUser();
      await cacheHelper.clearIsSignedIn();
      return OperationResult.success;
    } else {
      return OperationResult.failed;
    }
  }
}
