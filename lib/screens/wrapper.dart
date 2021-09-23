import 'package:brew_crew/models/user_model.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    print(user);

    // return either Home or Authenticate widget
    // return Home();
    return user == null ? Authenticate() : Home();
  }
}
