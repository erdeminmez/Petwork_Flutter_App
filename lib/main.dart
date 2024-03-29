import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:petwork/responsive/mobile_screen_layout.dart';
import 'package:petwork/responsive/responsive_layout_screen.dart';
import 'package:petwork/responsive/web_screen_layout.dart';
import 'package:petwork/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:petwork/screens/login_screen.dart';
import 'package:petwork/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:petwork/providers/user_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyDX7yn8k-UruzK9XsF1HOfueD9N1r_OSBg',
        appId: '1:195290147414:web:57e2a466a4692aae8ee9f7',
        messagingSenderId: '195290147414',
        projectId: 'petwork-92a4c',
        storageBucket: 'petwork-92a4c.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Petwork',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: mobileBackgroundColor,
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.active) {
                if(snapshot.hasData) {
                  return const ResponsiveLayout(
                    mobileScreenLayout: MobileScreenLayout(),
                    webScreenLayout: WebScreenLayout(),
                  );
                }
                else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}'),);
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: primaryColor,),
                );
              }
              return const LoginScreen();
            },
          ),
        )
    );
  }
}