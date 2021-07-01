import 'package:cadastro_completo_app/Components/user_tile.dart';
import 'package:cadastro_completo_app/Data/dummy_users.dart';
import 'package:cadastro_completo_app/Models/user.dart';
import 'package:cadastro_completo_app/Provider/users.dart';
import 'package:cadastro_completo_app/Routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     final Users users = Provider.of(context);

     return Scaffold(
       appBar: AppBar(
         title: Text('Lista de usuários'),
         actions: <Widget> [
           IconButton(
               icon: Icon(Icons.add),
               color: Colors.white,
               onPressed: (){
                 Navigator.of(context).pushNamed(
                   AppRoutes.USER_FORM
                 );
               }
           ),
         ],
       ),
       body: ListView.builder(
         itemCount: users.count,
         itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
       ),
     );
  }
}