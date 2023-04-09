import 'package:linkedin_login/linkedin_login.dart';
import 'package:video_book/models/AuthModels.dart';

import '../../constants/ConstantValues.dart';

class LoginWithLinkedInViewModel {
  final bool logoutUser = false;
  final String redirectUrl = 'https://www.google.com';
  final String clientId = '868rr77oec6tsp';
  final String clientSecret = 'WCt7PgKd4sJ7U8DP';

  final List<String> projectionArray = const [
    ProjectionParameters.id,
    ProjectionParameters.localizedFirstName,
    ProjectionParameters.localizedLastName,
    ProjectionParameters.firstName,
    ProjectionParameters.lastName,
    ProjectionParameters.profilePicture,
  ];

  SignedInUser getSignedInUser(UserSucceededAction linkedInUser) {
    var userModel = linkedInUser.user;

    SignedInUser signedInUser = SignedInUser(
        userId: userModel.userId ?? "",
        displayName: "${userModel.firstName} ${userModel.lastName}",
        email: userModel.email?.elements?[0].handleDeep?.emailAddress ?? "",
        profileImageUrl: userModel.profilePicture?.displayImageContent
                ?.elements?[0].identifiers?[0].identifier ??
            "",
        userType: SignedInUserType.loginWithLinkedIn);

    return signedInUser;
  }
}
