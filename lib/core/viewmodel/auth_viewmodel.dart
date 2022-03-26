import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/models/user_model.dart';
import 'package:firebase_project/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../services/firestore_user.dart';

class AuthViewModel extends GetxController{


    String? email, password, name;

 
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    // _user!.bindStream(_firebaseAuth.authStateChanges());
  }













 










  Future<bool> signIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        if (userCredential.user!.emailVerified) {
          return true;
        } else {
          await signOut();
          
          return false;
        }
      }
      return false;
    } on FirebaseAuthException catch (e) {
      _controlException(context, e);
    } catch (e) {
      //
    }
    return false;
  }

  Future<bool> createAccount(
      {required BuildContext context,
      required String email,
      required String password,
      required String name,
      
      }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
           final User? user = _firebaseAuth.currentUser;
           final uid = user!.uid;
            FirebaseFirestore.instance.collection('users').doc(uid).set(
        {
          'id': uid,
          'email': email,
          'name':name,
          'createAt': Timestamp.now(),
        },
      );
           
      userCredential.user?.sendEmailVerification();
      return true;
    } on FirebaseAuthException catch (e) {
      _controlException(context, e);
    } catch (e) {
      //
    }
    return false;
  }
 

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  bool loggedIn() => _firebaseAuth.currentUser != null;

  StreamSubscription<User?> checkUserStates(userAuthStates) {
     return  _firebaseAuth.authStateChanges().listen((event) {
      userAuthStates(loggedIn: event != null);
    });
  }


     void saveUser(UserCredential userCredential) async {
    UserModel _userModel = UserModel(
      userId: userCredential.user!.uid,
      email: userCredential.user!.email!,
      name: name == null ? userCredential.user!.displayName! : this.name!,
    );
    FirestoreUser().addUserToFirestore(_userModel);
    // saveUserLocal(_userModel);
  }
    Future<bool> resetPassword(
      {required String email, required BuildContext context}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    return true;
  }

  void _controlException(
      BuildContext context, FirebaseAuthException exception) {
   
    switch (exception.code) {
      case 'invalid-email':
        break;
      case 'user-disabled':
        break;
      case 'user-not-found':
        break;
      case 'wrong-password':
        break;
    }
  }
}
