import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseAuthService {
  // FirebaseAuth instance
  final FirebaseAuth _fbAuth = FirebaseAuth.instance;

  Future<User> signIn({String email, String password}) async {
    try {
      UserCredential ucred = await _fbAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = ucred.user;
      print("Signed In successful! userid: $ucred.user.uid, user: $user.");
      return user;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  } //signIn

  Future<User> signUp(
      {String email, String password, String name, String phone}) async {
    try {
      UserCredential ucred = await _fbAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        FirebaseAuth.instance.currentUser.updateProfile(displayName: name);
      });
      User user = ucred.user;

      //await FirebaseAuth.instance.currentUser.updateProfile(displayName: name);

      print('Signed Up successful! user: $user');
      return user;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  } //signUp

  Future<void> signOut() async {
    await _fbAuth.signOut();
  } //signOut

  Future<void> changeEmail({String email}) async {
    try {} on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message, gravity: ToastGravity.TOP);
      return null;
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  String id() {
    final User user = _fbAuth.currentUser;
    final uid = user.uid;
    return uid;
  }

  String email() {
    final User user = _fbAuth.currentUser;
    final email = user.email;
    return email;
  }

  String name() {
    final User user = _fbAuth.currentUser;
    final name = user.displayName;
    return name;
  }
}
