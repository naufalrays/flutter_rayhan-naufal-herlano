import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notula_notes/components/loading.dart';
import 'package:notula_notes/pages/admin/admin_view_model.dart';
import 'package:notula_notes/pages/auth/auth_view_model.dart';
import 'package:notula_notes/pages/auth/login_page.dart';
import 'package:notula_notes/pages/main_page.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'models/notes_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotesViewModel(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => NoteViewModel(),
        // ),
        ChangeNotifierProvider(
          create: (context) => AdminViewModel(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final prof = Provider.of<AuthViewModel>(context).
    // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    final authC = Provider.of<AuthViewModel>(context);
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.active) {
          return MaterialApp(
            // navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              primarySwatch: Colors.cyan,
            ),
            home: snapshot.data != null && snapshot.data!.emailVerified == true
                ? const MainPage()
                : const LoginPage(),
          );
        }
        return const Loading();
      },
    );
  }
}
