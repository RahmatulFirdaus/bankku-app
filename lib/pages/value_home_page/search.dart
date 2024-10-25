import 'package:flutter/material.dart';
import 'package:id_camp_final_project/model/transaction_model.dart';

class Searchhomepage extends StatefulWidget {
  const Searchhomepage({super.key});

  @override
  State<Searchhomepage> createState() => _SearchhomepageState();
}

class _SearchhomepageState extends State<Searchhomepage> {
  List<Transactionmodel> transaksi = [];
  List<Transactionmodel> search =[];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    setState(() {
      transaksi = Transactionmodel.getTransactionmodel();
      search = List.from(transaksi);
    });
  }

  void searchTransaksi(String value) {
    setState(() {
      if (value.isEmpty) {
        search = List.from(transaksi); 
      } else {
        search = transaksi
            .where((element) =>
                element.judul.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              controller: searchController,
              onChanged: searchTransaksi,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(
                          search[index].judul,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Text(
                          search[index].deskripsi,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                        trailing: Text(
                          search[index].nominal,
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
                                search[index].gambar,
                                // width: 100,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
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
                  itemCount: search.length))
        ],
      ),
    );
  }
}
