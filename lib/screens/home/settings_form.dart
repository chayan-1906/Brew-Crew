import 'package:brew_crew/models/user_model.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  late String _currentName = '';
  late String _currentSugars = '';
  late int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your brew settings.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val!.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0),
          DropdownButtonFormField(
            decoration: textInputDecoration,
            hint: Text(
              _currentSugars == '' ? '0 Sugars' : '$_currentSugars Sugars',
              style: TextStyle(color: Colors.lightBlue),
            ),
            items: sugars.map((sugar) {
              return DropdownMenuItem<String>(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _currentSugars = value.toString();
              });
            },
          ),
          Slider(
              value: (_currentStrength).toDouble(),
              activeColor: Colors.brown[_currentStrength],
              inactiveColor: Colors.brown[_currentStrength],
              min: 100.0,
              max: 900.0,
              divisions: 8,
              onChanged: (val) =>
                  setState(() => _currentStrength = val.round())),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await DatabaseService(uid: user.uid).updateUserData(
                  _currentSugars,
                  _currentName,
                  _currentStrength,
                );
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
