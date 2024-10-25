import 'package:flutter/material.dart';
import 'package:id_camp_final_project/model/line_chart.dart';
import 'package:id_camp_final_project/model/transaction_model.dart';

class Statisticspage extends StatefulWidget {
  const Statisticspage({super.key});

  @override
  State<Statisticspage> createState() => _StatisticspageState();
}

class _StatisticspageState extends State<Statisticspage> {
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Fitur belum tersedia"),
                    )
                  );
                },
                icon: const Icon(Icons.notification_add_outlined, size: 26,),
                        ),
            )],
          title: const Text(
            "Statistics",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          toolbarHeight: 90,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(children: [
                Column(
                  children: [
                    Text(
                      "Current Balance",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "\$ 14852.99",
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Linechart(),
                const SizedBox(
                  height: 20,
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
                            fontSize: 18,
                          ),
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
                            fontSize: 15,
                          ),
                        ),
                        leading: SizedBox(
                          width: 75,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Image.asset(
                              transaksi[index].gambar,
                              errorBuilder: (BuildContext context,
                                  Object exception,
                                  StackTrace? stackTrace) {
                                return const Icon(
                                  Icons.broken_image,
                                  size: 55,
                                  color: Colors.grey,
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    shrinkWrap: true,
                    itemCount: transaksi.length,
                  ),
                ),
              ]),
            ),
          ],
        )));
  }
}
