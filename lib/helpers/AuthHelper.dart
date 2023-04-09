import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:video_book/constants/AppStrings.dart';
import 'package:video_book/constants/ConstantValues.dart';
import 'package:video_book/helpers/CacheHelper.dart';
import 'package:video_book/models/AuthModels.dart';

class AuthHelper {
  static CacheHelper cacheHelper = CacheHelper();

  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  static Future<SignedInUser?> getSignedInUser(bool signIn) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    GoogleSignInAccount? googleSignInAccount = null;
    if (signIn) {
      googleSignInAccount = await googleSignIn.signIn();
    } else {
      googleSignInAccount = googleSignIn.currentUser;
    }

    if (googleSignInAccount != null) {
      var signedInUser = SignedInUser(
          userId: googleSignInAccount.id,
          displayName:
              googleSignInAccount.displayName ?? AppStrings.loggedInUser,
          email: googleSignInAccount.email,
          profileImageUrl: googleSignInAccount.photoUrl ?? "",
          userType: SignedInUserType.loginWithGoogle);
      return signedInUser;
    }
    return null;
  }

  static Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        final signedInUser = await getSignedInUser(true);

        if (signedInUser != null) {
          cacheHelper.cacheIsSignedIn(true);
          cacheHelper.cacheSignedInUser(signedInUser);
        }
      } on FirebaseAuthException catch (e) {
        cacheHelper.clearIsSignedIn();
        cacheHelper.clearSignedInUser();
        print("Error while signing in : ${e}");
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
        cacheHelper.clearIsSignedIn();
        cacheHelper.clearSignedInUser();
      }
    }

    return user;
  }

  static Future<bool> googleSignOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> facebookSignOut() async {
    try {
      await FacebookAuth.instance.logOut();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<OperationResult> loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      var userData = await FacebookAuth.instance.getUserData();

      String name = userData['name'] as String;
      String email = userData['email'] as String;
      String id = userData['id'] as String;
      String photoUrl = userData['picture']['data']['url'] as String;

      SignedInUser signedInUser = SignedInUser(
          userId: id,
          displayName: name,
          email: email,
          profileImageUrl: photoUrl,
          userType: SignedInUserType.loginWithFacebook);
      cacheHelper.cacheIsSignedIn(true);
      cacheHelper.cacheSignedInUser(signedInUser);
      return OperationResult.success;
    } else {
      print(result.status);
      print(result.message);
      return OperationResult.failed;
    }
  }

  static Future<void> loginWithLinkedIn() async {
    LinkedInUserWidget(
      redirectUrl: "https://www.youtube.com",
      clientId: "868rr77oec6tsp",
      clientSecret: "WCt7PgKd4sJ7U8DP",
      onGetUserProfile: (UserSucceededAction linkedInUser) {
        print('Access token ${linkedInUser.user.token.accessToken}');
        print('First name: ${linkedInUser.user.firstName?.localized?.label}');
        print('Last name: ${linkedInUser.user.lastName?.localized?.label}');
      },
      onError: (UserFailedAction e) {
        print('Error: ${e.toString()}');
      },
    );
  }
}
