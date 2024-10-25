import 'package:flutter/material.dart';
import 'package:id_camp_final_project/model/profile_model.dart';
import 'package:id_camp_final_project/pages/settings_page/general/edit_profile_page/edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ProfileModel> profile = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    profile = ProfileModel.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Profile'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditProfilePage()));
                  },
                  icon: Icon(Icons.mode_edit_outline)),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/profile.jpg",
                        width: 70,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Rahmatul Firdaus",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Multi-platform Developer",
                        style: TextStyle(
                            fontSize: 15, color: Colors.black.withOpacity(0.5)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: IconButton(
                        icon: Icon(profile[index].iconTrailing),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Fitur ${profile[index].name} belum tersedia"),
                            ),
                          );
                        },
                      ),
                      leading: Icon(profile[index].iconLeading),
                      title: Text("${profile[index].name}"),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider());
                  },
                  itemCount: profile.length),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20), child: Divider())
          ]),
        ));
  }
}
