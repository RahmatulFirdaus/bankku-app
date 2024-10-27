import 'package:flutter/material.dart';
import 'package:id_camp_final_project/model/transaction_model.dart';
import 'package:id_camp_final_project/pages/value_home_page/receieve.dart';
import 'package:id_camp_final_project/pages/value_home_page/search.dart';
import 'package:id_camp_final_project/pages/value_home_page/sent.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Transactionmodel> transaksi = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    transaksi = Transactionmodel.getTransactionmodel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    // color: Colors.blue,
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  "assets/images/profile.jpg",
                                  width: 55,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome Back",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                const Text(
                                  "Rahmatul Firdaus",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => const Searchhomepage()));
                            },
                            icon: const Icon(Icons.search),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      "assets/images/kartudebit.jpg",
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => const SentPage()),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_upward_outlined,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Sent")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => const ReceievePage()),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_downward_outlined,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Receive")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.attach_money,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Loan")
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.cloud_upload_outlined,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Top Up")
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 35),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transaction History",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(
                                  transaksi[index].judul,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                subtitle: Text(
                                  transaksi[index].deskripsi,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                trailing: Text(
                                  transaksi[index].nominal,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                leading: SizedBox(
                                  width: 75,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(80),
                                      child: Image.asset(
                                        transaksi[index].gambar,
                                        // width: 100,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return const Icon(
                                            Icons.broken_image,
                                            size: 55,
                                            color: Colors.grey,
                                          );
                                        },
                                      )),
                                ));
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          shrinkWrap: true,
                          itemCount: transaksi.length))
                ]),
          ),
        ));
  }
}
