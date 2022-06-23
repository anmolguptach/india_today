import 'package:flutter/material.dart';
import 'package:untitled1/ui/my_profile_page.dart';

void main() {
  runApp(
    const MaterialApp(
      home: DashboardScreen(),
    ),
  );
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(Icons.arrow_back_ios, color: Colors.orangeAccent),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.orangeAccent,
            indicatorWeight: 3,
            labelColor: Colors.orangeAccent,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                child: Text(
                  "My Profile",
                ),
              ),
              Tab(
                child: Text(
                  "Order History",
                ),
              ),
            ],
          ),
          title: Image.asset(
            "assets/icon.png",
            height: 50,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                width: 80,
                child: const Center(
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.orangeAccent),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orangeAccent, width: 2),
                ),
              ),
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            MyProfilePage(),
            Center(child: Text("Order History")),
          ],
        ),
      ),
    );
  }
}

