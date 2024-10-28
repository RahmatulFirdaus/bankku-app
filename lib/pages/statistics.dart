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
    final screenWidth = MediaQuery.of(context).size.width;

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
              icon: const Icon(Icons.notification_add_outlined, size: 26),
            ),
          )
        ],
        title: const Text(
          "Statistics",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        toolbarHeight: 90,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 800;
          return SingleChildScrollView(
            child: Center(
              child: Container(
                width: isWideScreen ? 800 : screenWidth * 0.9,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: isWideScreen
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Current Balance",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "\$ 14852.99",
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Linechart(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          // Right side: Transaction History
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Transaction History",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Implement 'See All' functionality
                                      },
                                      child: const Text(
                                        "See All",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: transaksi.length,
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
                                          color: Colors.black.withOpacity(0.5),
                                        ),
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
                                            errorBuilder: (context, error, stackTrace) {
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
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Current Balance",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "\$ 14852.99",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Linechart(),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Transaction History",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Implement 'See All' functionality
                                },
                                child: const Text(
                                  "See All",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ListView.separated(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: transaksi.length,
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
                                    color: Colors.black.withOpacity(0.5),
                                  ),
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
                                      errorBuilder: (context, error, stackTrace) {
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
                          ),
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
