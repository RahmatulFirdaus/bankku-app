import 'package:flutter/material.dart';

class ReceivePage extends StatelessWidget {
  const ReceivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String fullName = "Rahmatul Firdaus";
    final String email = "rahmatulfirdaus30@gmail.com";
    final String description = "Orang ganteng";
    final String day = "06";
    final String month = "06";
    final String year = "2066";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            const Text("Receive Money", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return _wideValue(fullName, email, description, day, month, year, context);
        } else {
          return _mobileValue(fullName, email, description, day, month, year, context);
        }
      }),
    );
  }

  SingleChildScrollView _mobileValue(String fullName, String email, String description, String day, String month, String year, BuildContext context) {
    return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Payer Name",
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person_outline,
                          color: Colors.black.withOpacity(0.6), size: 20),
                      const SizedBox(width: 12),
                      Text(fullName,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black87)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Email Address",
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.email_outlined,
                          color: Colors.black.withOpacity(0.6), size: 20),
                      const SizedBox(width: 12),
                      Text(email,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black87)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Description",
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.description_outlined,
                          color: Colors.black.withOpacity(0.6), size: 20),
                      const SizedBox(width: 12),
                      Text(description,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black87)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text("Monthly Due By",
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 50,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(day,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black87)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 50,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(month,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black87)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 60,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(year,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black87)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.all(10),
                  height: 150,
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
                Center(
                  child: Container(
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
                ),
              ],
            ),
          ),
        );
  }

  SingleChildScrollView _wideValue(String fullName, String email, String description, String day, String month, String year, BuildContext context) {
    return SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.all(20),
              width: 800,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Payer Name",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black54)),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300)),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.person_outline,
                                    color: Colors.black.withOpacity(0.6),
                                    size: 20),
                                const SizedBox(width: 12),
                                Text(fullName,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text("Email Address",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black54)),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300)),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.email_outlined,
                                    color: Colors.black.withOpacity(0.6),
                                    size: 20),
                                const SizedBox(width: 12),
                                Text(email,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text("Description",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black54)),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300)),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.description_outlined,
                                    color: Colors.black.withOpacity(0.6),
                                    size: 20),
                                const SizedBox(width: 12),
                                Text(description,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text("Monthly Due By",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black54)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                width: 50,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(day,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black87)),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 50,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(month,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black87)),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 60,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(year,
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black87)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.all(10),
                          height: 150,
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
                                margin:
                                    EdgeInsets.only(right: 10, top: 10, left: 10),
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
                              style: TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
  }
}
