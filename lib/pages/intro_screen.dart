import 'package:flutter/material.dart';
import 'package:id_camp_final_project/model/intro_model.dart';
import 'package:id_camp_final_project/pages/login_page/sign_in.dart';

class IntroScreenpage extends StatefulWidget {
  const IntroScreenpage({super.key});

  @override
  State<IntroScreenpage> createState() => _IntroScreenpageState();
}

class _IntroScreenpageState extends State<IntroScreenpage> {
  // Membuat variabel baru untuk memanggil model
  List<Intromodel> introModel = [];
  var indexNow = 0;
  late PageController pageContoller;

  void _getInitialInfo() {
    introModel = Intromodel.getIntroModel();
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
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 161, 207, 245)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          clipBehavior: Clip.antiAlias,
                          onPageChanged: (index) {
                            setState(() {
                              indexNow = index;
                            });
                          },
                          controller: pageContoller,
                          itemCount: introModel.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 130),
                                  height: 200,
                                  child: Image.asset(
                                    introModel[index].linkGambar,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 20),
                                  child: Text(
                                    introModel[index].judul,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 40),
                                  child: Text(
                                    introModel[index].deskripsi,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            introModel.length,
                            (index) => Container(
                              width: (indexNow == index) ? 13 : 7,
                              height: 7,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color:
                                    (indexNow == index) ? Colors.blue : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          (indexNow == introModel.length - 1)
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Signinpage(),
                                  ),
                                )
                              : pageContoller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 50),
                          height: 70,
                          width: 500,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 140, 255),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              (indexNow == introModel.length - 1)
                                  ? "Mulai"
                                  : "Selanjutnya",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 161, 207, 245)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          indexNow = index;
                        });
                      },
                      controller: pageContoller,
                      itemCount: introModel.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 130),
                              height: 300,
                              child: Image.asset(
                                introModel[index].linkGambar,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 20),
                              child: Text(
                                introModel[index].judul,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                introModel[index].deskripsi,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        introModel.length,
                        (index) => Container(
                          width: (indexNow == index) ? 13 : 7,
                          height: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            color:
                                (indexNow == index) ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      (indexNow == introModel.length - 1)
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Signinpage(),
                              ),
                            )
                          : pageContoller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(40, 40, 40, 50),
                      height: 70,
                      width: 500,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 140, 255),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          (indexNow == introModel.length - 1)
                              ? "Mulai"
                              : "Selanjutnya",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
