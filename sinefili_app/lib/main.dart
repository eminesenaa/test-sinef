import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sinefili_app/firebase_options.dart'; // Firebase yapılandırma dosyasını ekleyin
import 'package:sinefili_app/login_page.dart'; // LoginPage widget'ını oluşturacağız

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
