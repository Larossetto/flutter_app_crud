import 'package:flutter/material.dart';
import 'package:meuapp/view/holidays_page.dart';
import 'package:meuapp/view/home_page.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Cursos'),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  )),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Professores'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Feriados'),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HolidayPage(),
                    ),
                  )),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
