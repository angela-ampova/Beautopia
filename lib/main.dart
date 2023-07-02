import 'package:beautopia_project/pages/appointments.dart';
import 'package:beautopia_project/pages/book.dart';
import 'package:beautopia_project/pages/authentication/login.dart';
import 'package:beautopia_project/pages/profile.dart';
import 'package:beautopia_project/pages/authentication/register.dart';
import 'package:beautopia_project/pages/salon_details.dart';
import 'package:beautopia_project/pages/salons_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
      initialRoute: '/signin',
      routes: {
        '/': (context) => HomePage(),
        '/signin': (context) => SignInPage(),
        '/register': (context) => RegisterPage(),
        '/book_appointment': (context) => BookPage(),
        '/salons_list': (context) => SalonsListPage(),
        '/salon_details': (context) => SalonDetailsPage(salonName: '', salonImage: '', salonLocation: '',),
        '/profile': (context) => ProfilePage(),
        '/appointments': (context) => AppointmentsPage(),
        '/navigation': (context) => NavigationMenu(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beauty Salons'),
        backgroundColor: Colors.teal,
      ),
      drawer: NavigationMenu(),
      body: Column(
        children: [
          // Logo
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/logo.png',
              width: 100.0,
              height: 100.0,
            ),
          ),

          // Beauty Salons List
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

class SalonCard extends StatelessWidget {
  final String name;
  final String description;

  SalonCard({
    required this.name,
    required this.description,});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        title: Text(name),
        subtitle: Text(description),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.teal, // Change the button background color
            onPrimary: Colors.white, // Change the button text color
          ),
          child: Text('Book'),
        ),
      ),
    );
  }
}