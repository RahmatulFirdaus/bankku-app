import 'package:flutter/material.dart';
import 'package:id_camp_final_project/model/introModel.dart';
import 'package:id_camp_final_project/pages/home.dart';

class IntroScreenpage extends StatefulWidget {
  IntroScreenpage({super.key});

  @override
  State<IntroScreenpage> createState() => _IntroScreenpageState();
}

class _IntroScreenpageState extends State<IntroScreenpage> {
  //membuat variabel baru untuk memanggil model
  List<Intromodel> gambarIntro = [];
  var indexNow = 0;
  late PageController pageContoller;

  void _getInitialInfo() {
    gambarIntro = Intromodel.getIntroModel();
  }

  @override
  void initState() {
    pageContoller = PageController(initialPage: 0);
    super.initState();
    _getInitialInfo();
  }

  @override
  void dispose() {
    super.dispose();
    pageContoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _getInitialInfo();
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 255, 255, 255),
        const Color.fromARGB(255, 161, 207, 245)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (index){
                setState(() {
                  indexNow = index;
                });
              },
              controller: pageContoller,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 130),
                          height: 300,
                          child: Image.asset(
                            "${gambarIntro[index].linkGambar}",
                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: Text(
                          "${gambarIntro[index].judul}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "${gambarIntro[index].deskripsi}",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: gambarIntro.length,
            ),
          ),
          Container(
              // margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              // color: Colors.red,
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      gambarIntro.length,
                      (index) => Container(
                            width: (indexNow == index) ? 13 : 7,
                            height: 7,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color: (indexNow == index)
                                ? Colors.blue : Colors.grey
                                
                                ),
                          )))),
          InkWell(
            onTap: () {
              //nilai indexNow jika sama dengan 2, maka pindah ke halaman homepage
              (indexNow == gambarIntro.length - 1) ?
              Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()))
              //jika tidak, maka pindah ke page view selanjutnya
              : pageContoller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(40, 40, 40, 50),
              height: 70,
              width: 500,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 140, 255),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Center(
                  child: Text(
                (indexNow == gambarIntro.length - 1) ? "Mulai" : "Selanjutnya",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
          )
        ],
      )),
    ));
  }
}
