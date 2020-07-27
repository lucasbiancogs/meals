import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem({
    @required IconData icon,
    @required String label,
    @required Function onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 20),
          _createItem(
            icon: Icons.restaurant,
            label: 'Refeições',
            /*
            Quando se está fazendo um push, fica se empilhando telas,
            é preciso tomar cuidado pois sempre que chamar o drawer por exemplo
            nunca tirará as telas do empilhamento

            Um exemplo seria ficar clicando em refeições no Drawer
            O que abriria telas de refeições empilhadas indefinidamente...
            (Stack overflow?)

            Para resolver é usado um pushReplacementNamed ao invés de pushNamed
            */
            onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
          _createItem(
            icon: Icons.settings,
            label: 'Configurações',
            onTap: () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
          ),
        ],
      ),
    );
  }
}
