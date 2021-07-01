import 'dart:math';

import 'package:cadastro_completo_app/Data/dummy_users.dart';
import 'package:cadastro_completo_app/Models/user.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier{
  Map<String,User> _items = {...DUMMY_USERS};

  List<User> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  User byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(User user){
    if(User == null){
      return;
    }

    //ALTERAR
    if( user.id != null && user.id.trim().isNotEmpty && _items.containsKey(user.id)){
      _items.update(user.id, (_) => User(
        id: user.id,
        nome: user.nome,
        email: user.email,
        avatar_url: user.avatar_url
      ));
    }
    //ADICIONAR
    else{
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () => User(
          id: id,
          nome: user.nome,
          email: user.email,
          avatar_url: user.avatar_url
      ));
    }

    notifyListeners();
  }

  void remove(User user){
    if(user != null && user.id != null){
      _items.remove(user.id);
      notifyListeners();
    }
  }
}