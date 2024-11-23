import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:id_camp_final_project/model/settings_model.dart';
import 'package:id_camp_final_project/pages/settings_page/general/contact_page.dart';
import 'package:id_camp_final_project/pages/settings_page/general/language_page.dart';
import 'package:id_camp_final_project/pages/settings_page/general/profile_page.dart';
import 'package:id_camp_final_project/pages/settings_page/security/change_password_page.dart';
import 'package:id_camp_final_project/pages/settings_page/security/privacy_policy_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black87, size: 24),
            onPressed: () {},
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () => SystemNavigator.pop(),
              icon: const Icon(
                Icons.exit_to_app,
                size: 24,
                color: Colors.black87,
              ),
            ),
          )
        ],
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: Colors.grey[50],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionHeader("General"),
            _buildSection(getGeneral, (index) {
              switch (getGeneral[index].name) {
                case "Language":
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const LanguagePage()),
                  );
                  break;
                case "My Profile":
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                  break;
                case "Contact Us":
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ContactPage()),
                  );
                  break;
              }
            }),
            const SizedBox(height: 24),
            _buildSectionHeader("Security"),
            _buildSection(getSecurity, (index) {
              switch (getSecurity[index].name) {
                case "Change Password":
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ChangepasswordPage(),
                    ),
                  );
                  break;
                case "Privacy Policy":
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PrivacypolicyPage(),
                    ),
                  );
                  break;
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black87.withOpacity(0.7),
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  Widget _buildSection(List items, Function(int) onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[200],
          height: 1,
          indent: 16,
          endIndent: 16,
        ),
        itemBuilder: (context, index) => ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          title: Text(
            items[index].name,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Icon(
            items[index].icon,
            size: 20,
            color: Colors.black54,
          ),
          onTap: () => onTap(index),
        ),
      ),
    );
  }
}
