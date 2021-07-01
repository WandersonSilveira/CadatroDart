import 'package:cadastro_completo_app/Provider/users.dart';
import 'package:cadastro_completo_app/Routes/app_routes.dart';
import 'package:cadastro_completo_app/Views/user_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Views/user_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => new Users(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}

