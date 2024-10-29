import 'package:flutter/material.dart';
import 'package:id_camp_final_project/model/intro_model.dart';
import 'package:id_camp_final_project/pages/login_page/sign_in.dart';

class IntroScreenpage extends StatefulWidget {
  const IntroScreenpage({super.key});

  @override
  State<IntroScreenpage> createState() => _IntroScreenpageState();
}

class _IntroScreenpageState extends State<IntroScreenpage> {
  List<Intromodel> introModel = [];
  PageController _pageController = PageController();
  var indexNow = 0;

  void _getInitialInfo() {
    introModel = Intromodel.getIntroModel();
  }

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                const Color.fromARGB(255, 255, 255, 255),
                Colors.blue.shade200
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            //metod ini digunakan untuk membuat layout secara ditengah
            child: Align(
              alignment: Alignment.center,
              //sama seperti container constraint
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            indexNow = index;
                          });
                        },
                        itemCount: introModel.length,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 50),
                                      child: Image.asset(
                                        introModel[index].linkGambar,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                                        const EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      introModel[index].deskripsi,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
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
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 40, left: 40, right: 40),
                      child: InkWell(
                        onTap: () {
                          if (indexNow < introModel.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Signinpage(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 70,
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
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                const Color.fromARGB(255, 255, 255, 255),
                Colors.blue.shade200
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        indexNow = index;
                      });
                    },
                    itemCount: introModel.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 50),
                                  child: Image.asset(
                                    introModel[index].linkGambar,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  introModel[index].deskripsi,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
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
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 40, left: 40, right: 40),
                  child: InkWell(
                    onTap: () {
                      if (indexNow < introModel.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signinpage(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 70,
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
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
