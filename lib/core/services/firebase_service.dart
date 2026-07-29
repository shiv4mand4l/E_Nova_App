import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool isLogedIn() {
    return auth.currentUser != null;
  }
}
