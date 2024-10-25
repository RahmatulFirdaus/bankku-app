import 'package:flutter/material.dart';

class ProfileModel {
  String name;
  IconData iconLeading;
  IconData iconTrailing;

  ProfileModel({required this.name, required this.iconTrailing, required this.iconLeading});

  static List<ProfileModel> getProfile() {
    List<ProfileModel> profile = [];
    
    profile.add(ProfileModel(name: "Personal Information", iconLeading: Icons.person_pin_circle_outlined, iconTrailing: Icons.keyboard_arrow_right));
    profile.add(ProfileModel(name: "Payment Preferences", iconLeading: Icons.wallet_outlined, iconTrailing: Icons.keyboard_arrow_right));
    profile.add(ProfileModel(name: "Banks and Cards", iconLeading: Icons.account_balance_outlined, iconTrailing: Icons.keyboard_arrow_right));
    profile.add(ProfileModel(name: "Message Center", iconLeading: Icons.message_outlined, iconTrailing: Icons.keyboard_arrow_right));
    profile.add(ProfileModel(name: "Address", iconLeading: Icons.location_on_outlined, iconTrailing: Icons.keyboard_arrow_right));
    profile.add(ProfileModel(name: "Settings", iconLeading: Icons.settings, iconTrailing: Icons.keyboard_arrow_right));

    return profile;
  }
}
