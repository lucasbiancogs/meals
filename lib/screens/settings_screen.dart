import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChange;
  final Settings settings;

  SettingsScreen(this.onSettingsChange, this.settings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings _settings;

  @override
  void initState() {
    super.initState();
    _settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    void Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(_settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Filtros',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem Glúten',
                  'Só exibe refeições sem glúten.',
                  _settings.isGlutenFree,
                  (value) => setState(() {
                    _settings.isGlutenFree = value;
                  }),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose.',
                  _settings.isLactoseFree,
                  (value) => setState(() {
                    _settings.isLactoseFree = value;
                  }),
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas.',
                  _settings.isVegan,
                  (value) => setState(() {
                    _settings.isVegan = value;
                  }),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas.',
                  _settings.isVegetarian,
                  (value) => setState(() {
                    _settings.isVegetarian = value;
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
