import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static CollectionReference userReference =
  FirebaseFirestore.instance.collection("user");
  static CollectionReference commentsReference =
  FirebaseFirestore.instance.collection("comments");
  CollectionReference postReference =
  FirebaseFirestore.instance.collection("Post");

  addUserProfile(Map<String, dynamic> data, uid) async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      DocumentReference currentUserReference = userReference.doc(data["uid"]);
      await currentUserReference.set(data);
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
  // DocumentReference currentUserReference = userReference.doc(uid);

  addNewPost(Map<String, dynamic> data) async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = "";
    if (user != null) {
      uid = user.uid;
    }

    data["uid"] = uid;
    //data={"title":"dasdsa","body":"dasda","uid":"qwrdqwwqwqdeqwfdewfew"};
    postReference.add(data);
  }
  addNewCommentToPost(Map<String, dynamic> data,) async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = "";
    if (user != null) {
      uid = user.uid;
    }

    data["uid"] = uid;
    //data={"postId":"dasdsa","text":"usr typed text",uid":"qwrdqwwqwqdeqwfdewfew"};
    postReference.add(data);
  }
  static Future<bool> signupUser(
      {required String email,
        required String password,
        required String fullName,
        required String phoneNumber,
        required dynamic age,
        required dynamic address,
        required String gender}) async {
    bool status = false;
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? currentUser = credential.user;

      if (currentUser != null) {
        DocumentReference currentUserReference =
        userReference.doc(currentUser.uid);
        Map<String, dynamic> userProfileData = {
          "name": fullName,
          "phone": phoneNumber,
          "email": email,
          "uid": currentUser.uid,
          "age": age,
          "address": address,
          "gender": gender,
        };
        await currentUserReference.set(userProfileData);
      }

      status = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return status;
  }

  static Future<bool> loginUser({

    required String email,
    required String password,
  }) async {
    bool status = false;
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User? currentUser = credential.user;

      status = true;
    } on FirebaseAuthException catch (e) {
    } catch (e) {
      print(e);
    }
    return status;
  }
}
