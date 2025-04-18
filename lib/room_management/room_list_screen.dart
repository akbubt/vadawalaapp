import 'package:flutter/material.dart';
import 'package:myapp/business_information/information_screen.dart';
import '../inside_room_screen.dart';
import '../payment_management/hostel_fee_screen.dart';
import '../task_management/to_do_list_screen.dart';
import '../expense_management/expense_screen.dart';
import 'add_room_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoomListScreen extends StatefulWidget {
  const RoomListScreen({super.key});

  @override
  State<RoomListScreen> createState() => _RoomListScreenState();
}

class _RoomListScreenState extends State<RoomListScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Room List')),
      body: ListView.builder(
        itemCount: 5, // Example: 5 rooms
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Room ${index + 1}'),
            subtitle: const Row(
              children: [
                Icon(Icons.circle, color: Colors.green, size: 10),
                SizedBox(width: 4),
                Text('Active'),
                SizedBox(width: 10),
                Icon(Icons.person, size: 15),
                SizedBox(width: 4),
                Text('Leader'),
                SizedBox(width: 10),
                Text('3 Beds'),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Delete Room'),
                      content: const Text(
                        'Are you sure you want to delete this room?',
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Yes'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InsideRoomScreen(),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AddRoomScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Fee'),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.moneyBill),
            label: 'Expense',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  final List<Widget> _widgetOptions = <Widget>[
    const RoomListScreen(),
    const HostelFeeScreen(),
    const ExpenseScreen(),
    const InformationScreen(),
    const ToDoListScreen(),
  ];

  Widget getSelectedWidget(int index) {
    return _widgetOptions.elementAt(index);
  }

  void navigateToPage(BuildContext context, int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => getSelectedWidget(index)),
    );
  }
}
