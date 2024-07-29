import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(MyApp());
  } catch (e) {
    runApp(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Failed to initialize Firebase: $e'),
        ),
      ),
    ));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Check',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirebaseAuthCheck(),
    );
  }
}

class FirebaseAuthCheck extends StatefulWidget {
  @override
  _FirebaseAuthCheckState createState() => _FirebaseAuthCheckState();
}

class _FirebaseAuthCheckState extends State<FirebaseAuthCheck> {
  String _status = 'Checking Firebase...';

  @override
  void initState() {
    super.initState();
    _checkFirebaseAuth();
  }

  Future<void> _checkFirebaseAuth() async {
    try {
      // Anonim olarak giriş yapma denemesi
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      setState(() {
        _status = 'Firebase is working correctly! User ID: ${userCredential.user?.uid}';
      });
    } catch (e) {
      setState(() {
        _status = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth Check'),
      ),
      body: Center(
        child: Text(_status),
      ),
    );
  }
}
