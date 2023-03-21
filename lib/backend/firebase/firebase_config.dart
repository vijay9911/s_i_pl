import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBBIUlOVlJnHDwIphdmYjLsnHmlOhWO8Ic",
            authDomain: "lpsip-a1e2b.firebaseapp.com",
            projectId: "lpsip-a1e2b",
            storageBucket: "lpsip-a1e2b.appspot.com",
            messagingSenderId: "1057221492129",
            appId: "1:1057221492129:web:7cd7247fdb4679e49c5fe0",
            measurementId: "G-P4831D8PCY"));
  } else {
    await Firebase.initializeApp();
  }
}
