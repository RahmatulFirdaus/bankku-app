
import 'package:flutter/material.dart';
import 'package:id_camp_final_project/model/lineChart.dart';
import 'package:id_camp_final_project/model/transactionModel.dart';

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
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.menu),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  size: 26,
                ),
              ),
            )
          ],
          title: Text(
            "My Card",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          toolbarHeight: 90,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 255, 255, 255), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  "assets/images/kartudebit.jpg",
                ),
              ),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(
                              "${transaksi[index].judul}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            subtitle: Text(
                              "${transaksi[index].deskripsi}",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            trailing: Text(
                              "${transaksi[index].nominal}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            leading: Container(
                              width: 75,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: Image.asset(
                                    "${transaksi[index].gambar}",
                                    // width: 100,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Icon(
                                        Icons.broken_image,
                                        size: 55,
                                        color: Colors.grey,
                                      );
                                    },
                                  )),
                            ));
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      shrinkWrap: true,
                      itemCount: transaksi.length)),
              SizedBox(height: 20),
              Container(
               margin: EdgeInsets.symmetric(horizontal: 20),
               child: Row(
                children: [
                  Text(
                    "Money Spending This Month",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  )
                ],
               )
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Linechartsecond(),
              )
            ]))));
  }
}
