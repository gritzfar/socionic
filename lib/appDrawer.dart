import 'package:flutter/material.dart';
import 'package:socionic_tools/aspectCalulationPage.dart';
import 'package:socionic_tools/aspectsPage.dart';
import 'package:socionic_tools/quadratesPage.dart';
import 'package:socionic_tools/relationsPage.dart';
import 'package:socionic_tools/typesPage.dart';

class AppDrawer extends StatelessWidget {
  final BuildContext context;

  const AppDrawer({Key key, this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.contacts,
            text: 'Социотипы',
            onTap: () =>
                Navigator.pushReplacementNamed(context, TypesPage.routeName),
          ),
          _createDrawerItem(
            icon: Icons.all_out,
            text: 'Отношения',
            onTap: () =>
                Navigator.pushReplacementNamed(context, RelationsPage.routeName),
          ),
          _createDrawerItem(
            icon: Icons.border_all,
            text: 'Квадры',
            onTap: () {
              Navigator.popAndPushNamed(context, QuadratesPage.routeName);
            },
          ),
          _createDrawerItem(
            icon: Icons.category,
            text: 'Аспекты',
            onTap: () {
              Navigator.popAndPushNamed(context, AspectsPage.routeName);
            },
          ),
          Divider(),
          _createDrawerItem(
            icon: Icons.assignment_ind,
            text: 'Типирование',
            onTap: () => Navigator.popAndPushNamed(
                context, AspectCalculationPage.routeName),
          ),
          Divider(),
          _createDrawerItem(
              icon: Icons.local_library,
              text: 'Школа соционики',
              onTap: () => {}
              //Navigator.pushReplacementNamed(context, QuadratesPage.routeName),
              ),
        ],
      ),
    );
  }

  Widget _createHeader() {

    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
//            image: DecorationImage(
//                fit: BoxFit.fill,
//                image: AssetImage('images/back_gray.png'))
        ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Моя соционика",
                  style: TextStyle(
                      //color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
