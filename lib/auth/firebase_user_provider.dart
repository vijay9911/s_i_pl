import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class SIPlFirebaseUser {
  SIPlFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

SIPlFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<SIPlFirebaseUser> sIPlFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<SIPlFirebaseUser>(
      (user) {
        currentUser = SIPlFirebaseUser(user);
        return currentUser!;
      },
    );
