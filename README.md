# flutter_firebase_auth

This project demonstrates how to integrate Firebase Authentication into a Flutter application. It includes features such as user registration, login, and logout using Firebase's authentication services.

## Installation

1. Create Firebase project at [firebase console](https://console.firebase.google.com/)
2. Install Firebase using command

   ```
   flutter pub add firebase_auth
   ```

   ```
   dart pub global activate flutterfire_cli
   ```

3. Link a project to Firebase project
   ```
   flutterfire configure --project=[FIREBASE-PROJECT-ID]
   ```
4. Enable authentication method with email/password in Firebase project

## Initialize firebase to app

to use Firebase in project we add this command to main()

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_auth/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}
```

## Create new account

use `createUserWithEmailAndPassword()` to create new user with email and password

```dart
final FirebaseAuth _auth = FirebaseAuth.instance;

UserCredential userCredential = await _auth.createUserWithEmailAndPassword( email: email, password: password, );
```
