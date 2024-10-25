import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:id_camp_final_project/model/settings_model.dart';
import 'package:id_camp_final_project/pages/settings_page/general/contact_page.dart';
import 'package:id_camp_final_project/pages/settings_page/general/language_page.dart';
import 'package:id_camp_final_project/pages/settings_page/general/profile_page.dart';
import 'package:id_camp_final_project/pages/settings_page/security/change_password_page.dart';
import 'package:id_camp_final_project/pages/settings_page/security/privacy_policy_page.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  List<GetGeneral> getGeneral = [];
  List<GetSecurity> getSecurity = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    getGeneral = GetGeneral.getGeneral();
    getSecurity = GetSecurity.getSecurity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: const Icon(
                Icons.exit_to_app,
                size: 26,
              ),
            ),
          )
        ],
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        toolbarHeight: 90,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                "General",
                style: TextStyle(
                    fontSize: 17, color: Colors.black.withOpacity(0.5)),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView.separated(
                shrinkWrap:
                    true, // Menghindari ListView mengambil seluruh ruang
                physics: const NeverScrollableScrollPhysics(),
                itemCount: getGeneral.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(getGeneral[index].name),
                    trailing: IconButton(
                      icon: Icon(getGeneral[index].icon),
                      onPressed: () {
                        switch (getGeneral[index].name) {
                          case "Language":
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LanguagePage()));
                            break;
                          case "My Profile":
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ProfilePage()));
                            break;
                          case "Contact Us":
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ContactPage()));
                            break;
                          default:
                            print("error");
                        }
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 14),
                  child: Divider(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Security",
                style: TextStyle(
                    fontSize: 17, color: Colors.black.withOpacity(0.5)),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: getSecurity.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(getSecurity[index].name),
                    trailing: IconButton(
                      icon: Icon(getSecurity[index].icon),
                      onPressed: () {
                        switch (getSecurity[index].name) {
                          case "Change Password":
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ChangepasswordPage()));
                            break;
                          case "Privacy Policy":
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const PrivacypolicyPage()));
                            break;
                          default:
                            print("error");
                        }
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 14),
                  child: Divider(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
