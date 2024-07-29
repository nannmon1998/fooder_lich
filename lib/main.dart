import 'package:flutter/material.dart';
import 'package:fooderlich/res/app_colors.dart';
import 'package:fooderlich/ui/main_screen/main_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const MainScreen(),
    const NoteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
             Radius.circular(40.0)
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: greenColor,
            selectedItemColor: lightGrey,
            unselectedItemColor: whiteColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items:  [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: '',
                activeIcon: Container(
                    decoration: BoxDecoration(
                        color: bottomIconColor,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      Icons.home,
                      color: whiteColor,
                    )),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.edit_note_outlined),
                label: '',
                activeIcon: Container(
                    decoration: BoxDecoration(
                        color: bottomIconColor,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.edit_note_outlined,
                      color: whiteColor,
                    )),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: '',
                activeIcon: Container(
                    decoration: BoxDecoration(
                        color: bottomIconColor,
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.all(15),
                    child: const Icon(
                      Icons.person,
                      color: whiteColor,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Note Screen'),
    );
  }
}

