import 'package:flutter/material.dart';
import 'package:id_camp_final_project/model/line_chart.dart';
import 'package:id_camp_final_project/model/transaction_model.dart';

class Mycard extends StatefulWidget {
  const Mycard({super.key});

  @override
  State<Mycard> createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
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
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Fitur belum tersedia"),
                    ));
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 26,
                  ),
                ),
              )
            ],
            title: const Text(
              "My Card",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            toolbarHeight: 90,
            centerTitle: true,
            backgroundColor: Colors.white),
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _valueWide();
          } else {
            return _valueMobile();
          }
        }));
  }

  SingleChildScrollView _valueMobile() {
    return SingleChildScrollView(
              child: Column(children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                "assets/images/kartudebit.jpg",
              ),
            ),
            const SizedBox(height: 20),
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
                                fontWeight: FontWeight.bold, fontSize: 18),
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
                    itemCount: transaksi.length)),
            const SizedBox(height: 25),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  children: [
                    Text(
                      "Money Spending This Month",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ],
                )),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: const Linechartsecond(),
            )
          ]));
  }

  SingleChildScrollView _valueWide() {
    return SingleChildScrollView(
              child: Center(
            child: Container(
              width: 1000,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(children: [
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: Image.asset(
                              "assets/images/kartudebit.jpg",
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  physics:
                                      const NeverScrollableScrollPhysics(),
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
                                              color: Colors.black
                                                  .withOpacity(0.5)),
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
                                              borderRadius:
                                                  BorderRadius.circular(80),
                                              child: Image.asset(
                                                transaksi[index].gambar,
                                                errorBuilder: (BuildContext
                                                        context,
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
                                  itemCount: transaksi.length)),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(children: [
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: const Row(
                                children: [
                                  Text(
                                    "Money Spending This Month",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              )),
                          const SizedBox(height: 20),
                          Container(
                            child: const Linechartsecond(),
                          ),
                          SizedBox(height: 10),
                        ]),
                      ),
                    )
                  ]),
            ),
          ));
  }
}
