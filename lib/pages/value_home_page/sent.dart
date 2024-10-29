import 'package:flutter/material.dart';

class SentPage extends StatelessWidget {
  const SentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:
              const Text("Send Money", style: TextStyle(color: Colors.black)),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _wideValue(context);
          } else {
            return _mobileValue(context);
          }
        }));
  }

  SingleChildScrollView _mobileValue(BuildContext context) {
    return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    "assets/images/kartudebit.jpg",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(10),
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: const Text("Send to",
                            style: TextStyle(fontSize: 18)),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(
                                        "assets/images/lunatif.png",
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("User $index",
                                        style: const TextStyle(fontSize: 15)),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox();
                          },
                          itemCount: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(10),
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10, top: 10, left: 10),
                        child: Row(
                          children: [
                            Text("Enter Your Amount",
                                style: TextStyle(fontSize: 15)),
                            const Spacer(),
                            Text("Change Currency?",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.red)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Row(children: [
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text("USD",
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: const Color.fromARGB(
                                          255, 152, 190, 255)))),
                          SizedBox(
                            width: 10,
                          ),
                          Text("56.0", style: TextStyle(fontSize: 35))
                        ]),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 70,
                  width: 450,
                  margin: const EdgeInsets.symmetric(horizontal: 22),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Fitur belum tersedia"),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                      backgroundColor: WidgetStatePropertyAll(
                          Colors.blue.withOpacity(0.8)),
                    ),
                    child: const Text(
                      "Send Money",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  SingleChildScrollView _wideValue(BuildContext context) {
    return SingleChildScrollView(
            child: Center(
              child: Container(
                width: 1000,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Image.asset(
                          "assets/images/kartudebit.jpg",
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                          padding: const EdgeInsets.all(10),
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: const Text("Send to",
                                    style: TextStyle(fontSize: 18)),
                              ),
                              const SizedBox(height: 20),
                              Expanded(
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {},
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.asset(
                                                "assets/images/lunatif.png",
                                                width: 70,
                                                height: 70,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text("User $index",
                                                style: const TextStyle(
                                                    fontSize: 15)),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox();
                                  },
                                  itemCount: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          padding: const EdgeInsets.all(10),
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: 10, top: 10, left: 10),
                                child: Row(
                                  children: [
                                    Text("Enter Your Amount",
                                        style: TextStyle(fontSize: 15)),
                                    const Spacer(),
                                    Text("Change Currency?",
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.red)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Row(children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text("USD",
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: const Color.fromARGB(
                                                  255, 152, 190, 255)))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("56.0", style: TextStyle(fontSize: 35))
                                ]),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 70,
                          width: 450,
                          margin: const EdgeInsets.symmetric(horizontal: 22),
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Fitur belum tersedia"),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              backgroundColor: WidgetStatePropertyAll(
                                  Colors.blue.withOpacity(0.8)),
                            ),
                            child: const Text(
                              "Send Money",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ]),
                    ))
                  ],
                ),
              ),
            ),
          );
  }
}
