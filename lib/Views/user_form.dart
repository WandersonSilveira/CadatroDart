import 'package:cadastro_completo_app/Models/user.dart';
import 'package:cadastro_completo_app/Provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget{

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void loadUserData(User user){
    if(user != null){
      _formData['id'] = user.id;
      _formData['nome'] = user.nome;
      _formData['email'] = user.email;
      _formData['avatar_url'] = user.avatar_url;
    }
  }

  @override
  Widget build(BuildContext context) {

    final User user = ModalRoute.of(context).settings.arguments;
    loadUserData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de usuário'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: (){
                final isValid = _form.currentState.validate();
                _form.currentState.save();
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData['id'],
                  nome: _formData['nome'],
                  email: _formData['email'],
                  avatar_url: _formData['avatar_url'],
                ));
                Navigator.of(context).pop();
              }
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child:  Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(
                  labelText: 'Nome'
                ),
                onSaved: (value) => _formData['nome'] = value,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                initialValue: _formData['avatar_url'],
                decoration: InputDecoration(
                  labelText: 'URL do avatar'
                ),
                onSaved: (value) => _formData['avatar_url'] = value,
              ),
            ],
          ),
        ),
      ),
    );

  }
}