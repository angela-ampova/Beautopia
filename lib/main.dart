import 'package:beautopia_project/pages/appointments.dart';
import 'package:beautopia_project/pages/book.dart';
import 'package:beautopia_project/pages/authentication/login.dart';
import 'package:beautopia_project/pages/profile.dart';
import 'package:beautopia_project/pages/authentication/register.dart';
import 'package:beautopia_project/pages/salon_details.dart';
import 'package:beautopia_project/pages/salons_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'custom_ui_elements/custom_app_bar.dart';
import 'custom_ui_elements/custom_button.dart';
import 'custom_ui_elements/custom_card.dart';
import 'pages/navigation_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions( apiKey: "AIzaSyB6EVNM6yEkLyhOd6Al1CV3G12cz7_2sSw",
      appId: "1:57371897784:android:4949d8f9cd5efeeef1e94d",
      messagingSenderId: "57371897784",
      projectId: "beautopia-896c0", ), );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
          ),
          labelStyle: TextStyle(
            color: Colors.teal,
          ),
        ),
      ),
      initialRoute: '/signin',
      routes: {
        '/': (context) => HomePage(),
        '/signin': (context) => SignInPage(),
        '/register': (context) => RegisterPage(),
        '/book_appointment': (context) => BookPage(),
        '/salons_list': (context) => SalonsListPage(),
        '/salon_details': (context) => SalonDetailsPage(
          salonName: '',
          salonImage: '',
          salonLocation: '',
        ),
        '/profile': (context) => ProfilePage(),
        '/appointments': (context) => AppointmentsPage(),
        '/navigation': (context) => NavigationMenu(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Beauty Salons',
        backgroundColor: Colors.teal,
      ),
      drawer: NavigationMenu(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/logo.png',
              width: 100.0,
              height: 100.0,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: [
                SalonCard(
                  name: 'Sashions',
                  description: 'Hair and Makeup',
                ),
                SalonCard(
                  name: 'Sim Saltirova',
                  description: 'Hair',
                ),
                SalonCard(
                  name: 'Nails M',
                  description: 'Nails',
                ),
                SalonCard(
                  name: 'Oktay Seydi',
                  description: 'Hair and Makeup',
                ),
                SalonCard(
                  name: 'Hair House',
                  description: 'Hair',
                ),
                SalonCard(
                  name: 'Studio Metier',
                  description: 'Nails',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
