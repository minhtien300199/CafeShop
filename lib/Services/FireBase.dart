import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseServices {
  final storeImages = FirebaseStorage.instance;
  Future<dynamic> loadImage() async {
    return await storeImages.ref().child('images/coffee.jpg').getDownloadURL();
  }

  Widget toWidget() {}
}
