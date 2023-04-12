import 'package:flutter/material.dart';
import 'package:random_person_data/models/helpers/api_helper.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: FutureBuilder(
            future: ApiHelper.apiHelper.getInfo(),
            builder: (context, snapShot) {
              if (snapShot.hasError) {
                return Text("${snapShot.error}");
              } else if (snapShot.hasData) {
                Map? P = snapShot.data;
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        color: Colors.brown.shade900,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 560,
                      ),
                      child: Container(
                        height: 100,
                        width: 270,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              color: Colors.grey,
                              offset: Offset(0, 5),
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 450,
                        width: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 10,
                              color: Colors.grey,
                              offset: Offset(0, 5),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 80,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "${P!['results'][0]['name']['title']}. ${P['results'][0]['name']['first']} ${P['results'][0]['name']['last']}",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Age       : ",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.brown.shade800,
                                      ),
                                    ),
                                    Text(
                                      "${P['results'][0]['dob']['age']} Year",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 15,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Gender  : ",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.brown.shade800,
                                      ),
                                    ),
                                    Text(
                                      "${P['results'][0]['gender']}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 15,
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Email   : ",
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.brown.shade800,
                                        ),
                                      ),
                                      Text(
                                        "${P['results'][0]['email']}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 80,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 70,
                                    width: 170,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.brown.shade900,
                                    ),
                                    child: const Text(
                                      "RESET",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 130,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                "${P!['results'][0]['picture']['large']}"),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
