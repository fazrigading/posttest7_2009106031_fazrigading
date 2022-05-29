import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'controller.dart';

final UserController c = Get.put(UserController());

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final List<Widget> _pagesForAdmin = [const UserList(), const AdminList()];
  int _indexBody = 0;
  String _judulBody = "User List";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(18, 118, 118, 1),
        elevation: 5,
        child: Column(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(18, 118, 118, 1),
              ),
              child: Center(
                child: Text(
                  "Welcome to the\nAdmin Page",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text("User List",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              onTap: () {
                setState(() {
                  _indexBody = 0;
                  _judulBody = "User List";
                  Get.back();
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.admin_panel_settings,
                color: Colors.white,
              ),
              title: const Text("Admin List",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              onTap: () {
                setState(() {
                  _indexBody = 1;
                  _judulBody = "Admin List";
                  Get.back();
                });
              },
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: const Text("Log Out",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
                onTap: () {
                  setState(() {
                    Get.offNamed('/loginpage');
                  });
                },
              ),
            )),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: 70,
        title: Text(
          _judulBody,
          style: const TextStyle(
              fontFamily: 'Manrope',
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w800),
        ),
      ),
      body: _pagesForAdmin.elementAt(_indexBody),
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Stack(children: [
      ListView(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: users.snapshots(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? Column(
                      children: snapshot.data!.docs
                          .map(
                            (e) => ItemCard(
                              e.get('firstname'),
                              e.get('lastname'),
                              0,
                              onUpdate: () {
                                users.doc(e.id).update({
                                  'firstname': c.a1.text,
                                  'lastname': c.a2.text
                                });
                              },
                              onDelete: () {
                                users.doc(e.id).delete();
                              },
                            ),
                          )
                          .toList(),
                    )
                  : const Center(child: Text('Loading...'));
            },
          ),
          const SizedBox(height: 150)
        ],
      ),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(-5, 0),
                  blurRadius: 15,
                  spreadRadius: 3)
            ]),
            width: double.infinity,
            height: 130,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: c.a1,
                        decoration:
                            const InputDecoration(hintText: "First Name"),
                      ),
                      TextField(
                        controller: c.a2,
                        decoration:
                            const InputDecoration(hintText: "Last Name"),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 130,
                  width: 130,
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Add Data',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        users.add(
                            {'firstname': c.a1.text, 'lastname': c.a2.text});
                      }),
                )
              ],
            ),
          )),
    ]);
  }
}

class AdminList extends StatelessWidget {
  const AdminList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference admins =
        FirebaseFirestore.instance.collection('admins');
    return Stack(children: <Widget>[
      ListView(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: admins.snapshots(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? Column(
                      children: snapshot.data!.docs
                          .map(
                            (e) => ItemCard(
                              e.get('username'),
                              e.get('password'),
                              1,
                              onUpdate: () {
                                admins.doc(e.id).update({
                                  'username': c.a1.text,
                                  'password': c.a2.text
                                });
                              },
                              onDelete: () {
                                admins.doc(e.id).delete();
                              },
                            ),
                          )
                          .toList(),
                    )
                  : const Text('Loading...');
            },
          ),
          const SizedBox(height: 150),
        ],
      ),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  // offset: Offset(-5, 0),
                  blurRadius: 15,
                  spreadRadius: 3)
            ]),
            width: double.infinity,
            height: 130,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: c.a1,
                        decoration: const InputDecoration(hintText: "Username"),
                      ),
                      TextField(
                        controller: c.a2,
                        decoration: const InputDecoration(hintText: "Password"),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 130,
                  width: 130,
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Add Data',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        admins.add(
                            {'username': c.a1.text, 'password': c.a2.text});
                      }),
                )
              ],
            ),
          )),
    ]);
  }
}

class ItemCard extends StatelessWidget {
  final String atribut1;
  final String atribut2;
  final int tipeList;
  final Function? onUpdate;
  final Function? onDelete;

  const ItemCard(this.atribut1, this.atribut2, this.tipeList,
      {Key? key, this.onUpdate, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color.fromRGBO(18, 183, 183, 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tipeList == 0 ? "First Name: $atribut1" : "User: $atribut1",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  tipeList == 0 ? "Last Name: $atribut2" : "Pass: $atribut2",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: const Color.fromARGB(255, 15, 65, 18),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.upload,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      if (onUpdate != null) onUpdate!();
                    }),
              ),
              SizedBox(
                height: 40,
                width: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      primary: Colors.red[900],
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      if (onDelete != null) onDelete!();
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
