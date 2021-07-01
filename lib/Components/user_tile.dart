import 'package:cadastro_completo_app/Models/user.dart';
import 'package:cadastro_completo_app/Provider/users.dart';
import 'package:cadastro_completo_app/Routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget{
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {

    final avatar = user.avatar_url == null || user.avatar_url.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatar_url));

    return ListTile(
      leading: avatar,
      title: Text(user.nome),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: (){
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              }
          ),
          IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir usuário'),
                    content: Text('Tem certeza?'),
                    actions: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: (){
                          Provider.of<Users>(context, listen: false).remove(user);
                          Navigator.of(context).pop();
                        },
                        child: Text('Sim'),
                      ),                      // ignore: deprecated_member_use
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: Text('Não'),
                      )
                    ],
                  )
                );
              }
          )
        ],
      ),
      )
    );
  }

}