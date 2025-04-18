import 'package:flutter/material.dart';
import 'package:myapp/business_information/information_screen.dart';
import 'package:myapp/payment_management/hostel_fee_screen.dart';
import 'package:myapp/task_management/add_to_do_list_screen.dart';
class ToDoListScreen extends StatelessWidget {
  const ToDoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: const TabBar(
            tabs: [
              Tab(text: 'My List'),
              Tab(text: 'Hostel List'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // My List
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('My Task ${index + 1}'),
                  subtitle: Text('Description for Task ${index + 1}'),
                  trailing: const Text('2023-12-31'),
                  onTap: () {
                    // Action for tapping on a task
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirm Delete"),
                          content: const Text(
                              "Are you sure you want to delete this task?"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("No"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text("Yes"),
                              onPressed: () {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Task deleted")),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
            // Hostel List
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Hostel Task ${index + 1}'),
                  subtitle: Text('Description for Hostel Task ${index + 1}'),
                  trailing: const Text('2023-12-31'),
                  onTap: () {
                    // Action for tapping on a task
                  },
                   onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirm Delete"),
                          content: const Text(
                              "Are you sure you want to delete this task?"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("No"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text("Yes"),
                              onPressed: () {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Task deleted")),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  AddToDoListScreen()));
          },
          child:  Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.paid),
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
        currentIndex: 4,
        selectedItemColor: Colors.blue,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/room_list'); // Corrected path
              break;
            case 1:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>   HostelFeeScreen()));
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/expense'); // Assuming you have an ExpenseScreen
              break;
            case 3:
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>   InformationScreen()));
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/to_do_list'); // Corrected path
              break;
          }
        },
        ),
      ),
    );
  }
}