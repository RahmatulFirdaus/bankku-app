import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguePageState();
}

class _LanguePageState extends State<LanguagePage> {
  List<String> languageList = [
    "English",
    "Indonesia",
    "French",
    "Spanish",
    "Arabic"
  ];
  List searchList = [];
  String? language;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchList = languageList;
  }

  void searchLanguage(String value) {
    if(value.isEmpty) {
      setState(() {
        searchList = languageList;
      });
    }else{
      setState(() {
        searchList = languageList.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Language"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              controller: searchController,
              onChanged: searchLanguage,
                decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Search Language",
              prefixIcon: const Icon(Icons.search),
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${searchList[index]}"),
                  trailing: Radio(
                      value: "${searchList[index]}",
                      groupValue: language,
                      onChanged: (value) {
                        setState(() {
                          language = value;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Changing Language to ${searchList[index]}"),
                        ));
                      }),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(color: Colors.black.withOpacity(0.2)));
              },
              itemCount: searchList.length),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(color: Colors.black.withOpacity(0.2)))
        ],
      ),
    );
  }
}
