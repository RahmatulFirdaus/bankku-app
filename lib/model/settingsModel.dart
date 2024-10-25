import 'package:flutter/material.dart';

class GetGeneral{
  String name;
  IconData icon;

  GetGeneral({required this.name, required this.icon}); 

  static List<GetGeneral> getGeneral(){
    List<GetGeneral> general = [];

    general.add(GetGeneral(name: "Language", icon: Icons.keyboard_arrow_right));
    general.add(GetGeneral(name: "My Profile", icon: Icons.keyboard_arrow_right));
    general.add(GetGeneral(name: "Contact Us", icon: Icons.keyboard_arrow_right));

    return general;
  }
}

class GetSecurity{
  String name;
  IconData icon;

  GetSecurity({required this.name, required this.icon}); 

  static List<GetSecurity> getSecurity(){
    List<GetSecurity> security = [];

    security.add(GetSecurity(name: "Change Password", icon: Icons.keyboard_arrow_right));
    security.add(GetSecurity(name: "Privacy Policy", icon: Icons.keyboard_arrow_right));

    return security;
  }
}