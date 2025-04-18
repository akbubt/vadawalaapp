import 'package:flutter/material.dart';

class MemberPaymentScreen extends StatelessWidget {
  const MemberPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(""),
            Text('9:41'),
          ],
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: SizedBox(),
        ),
      ),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Member Payment Screen"),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Fee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Expense',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Task',
          ),
        ],
      ),
    );
  }
}