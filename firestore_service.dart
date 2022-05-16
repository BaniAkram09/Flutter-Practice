// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables
import 'dart:math';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp1/model/user.dart' as myuser;
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('User');

  Future<String> login(String email, String password) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          print(user.uid);
        }
      },
    );
    return '';
  }

  Future<String> signUp() async {
    return '';
  }

  Future<void> addUser(myuser.MyUser user) {
    return collection.doc(user.id).set(user.toJSON());
  }

  void updateUser(myuser.MyUser user) async {
    await collection.doc().set(user.toJSON(), SetOptions(merge: true));
  }

  void deleteUser(myuser.MyUser user) async {
    await collection.doc(user.id).delete();
  }
}
