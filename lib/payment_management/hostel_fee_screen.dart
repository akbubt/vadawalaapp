import 'package:flutter/material.dart';
import 'paid_list_screen.dart';
import 'unpaid_list_screen.dart';

class HostelFeeScreen extends StatelessWidget {
  const HostelFeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(""), Text('9:41')],
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
          bottom: const TabBar(
            tabs: [Tab(text: 'Unpaid List'), Tab(text: 'Paid List')],
          ),
        ),
        body: TabBarView(children: [UnpaidListScreen(), PaidListScreen()]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: 'Fee',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_down),
              label: 'Expense',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
            BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
          ],
          onTap: (int index) {
            // Implement navigation logic here
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/home');
            }
            if (index == 1) {
              Navigator.pushReplacementNamed(context, '/fee');
            }
            if (index == 2) {
              Navigator.pushReplacementNamed(context, '/expense');
            }
            if (index == 3) {
              Navigator.pushReplacementNamed(context, '/info');
            }
            if (index == 4) {
              Navigator.pushReplacementNamed(context, '/task');
            }
          },
        ),
      ),
    );
  }
}
