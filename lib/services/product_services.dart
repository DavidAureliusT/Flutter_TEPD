import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_widgets/models/models.dart';
import 'package:image_picker/image_picker.dart';

class ProductServices {
  //setup cloud firestore
  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");
  static DocumentReference productDoc;

  //setup firestore storage
  static Reference ref;
  static UploadTask uploadTask;

  static String imageUrl;

  static Future<bool> addProduct(Products product, PickedFile imageFile) async {
    await Firebase.initializeApp();

    productDoc = await productCollection.add({
      'id': "",
      'name': product.name,
      'price': product.price,
      'image': product.image
    });

    if (productDoc.id != null) {
      ref = FirebaseStorage.instance
          .ref()
          .child('images')
          .child(productDoc.id + ".png");
      uploadTask = ref.putFile(File(imageFile.path));

      await uploadTask.whenComplete(
          () => ref.getDownloadURL().then((value) => imageUrl = value));
      productCollection.doc(productDoc.id).update({
        'id': product.id,
        'image': imageUrl,
      });
      return true;
    } else {
      return false;
    }
  }
  // static Future<>
}
