import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthService> authService = ValueNotifier(AuthService());

class AuthService {
  //create Firebase Auth Instance
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// Get the Currrent User
  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  //Function to sign in
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //Function to create account
  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

// Function to send email verification link
  // Future<void> verifyEmail() async {
  //   User? user = currentUser;
  //   if (user != null && !user.emailVerified) {
  //     await user.sendEmailVerification();
  //   }
  // }

  //Function to signout/log out
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  //Function to Reset Password
  Future<void> resetPassword({
    required String email,
  }) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  //Function to Update Username
  Future<void> updateUsername({
    required String username,
  }) async {
    await currentUser!.updateDisplayName(username);
  }

  //Function to Delete Account
  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.delete();
    await firebaseAuth.signOut();
  }

  //Function to Change Current Password
  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: currentPassword,
    );
    await currentUser!.reauthenticateWithCredential(credential);
    await currentUser!.updatePassword(newPassword);
  }
}
