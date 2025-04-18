import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/add_member_screen.dart';
import 'package:myapp/business_information/information_screen.dart';
import 'package:myapp/expense_management/expense_screen.dart';
import 'package:myapp/member_profile_screen.dart';
import 'package:myapp/payment_management/hostel_fee_screen.dart';
import 'package:myapp/room_management/room_list_screen.dart';
import 'package:myapp/send_message_screen.dart';
import 'package:myapp/task_management/to_do_list_screen.dart';

// Inside Room Screen
class InsideRoomScreen extends StatefulWidget {
  const InsideRoomScreen({super.key});

  @override
  State<InsideRoomScreen> createState() => _InsideRoomScreenState();
}

class _InsideRoomScreenState extends State<InsideRoomScreen> {
  int _selectedIndex = 0;
  // Simulated data for members
  final List<String> members = [
    'Member 1',
    'Member 2',
    'Member 3',
    'Member 4',
    'Member 5'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const RoomListScreen()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HostelFeeScreen()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ExpenseScreen()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const InformationScreen()));
        break;
        case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ToDoListScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Room 1"),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView.builder(
          itemCount: members.length,
          itemBuilder: (context, index) {
            return  ListTile(
              title: Text(members[index]),
              subtitle: const Row(
                children: <Widget>[
                  Icon(Icons.person, size: 15),
                  Text('Leader'),
                  SizedBox(width: 10),
                  Text('One Time'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MemberProfileScreen()));
                      },
                      icon: const Icon(Icons.visibility)),// You might want to pass the member's data to the profile screen.
                  IconButton(
                      onPressed: () {
                        // TODO: Implement edit functionality
                      }, icon: const Icon(Icons.edit)),// TODO: Implement edit functionality
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Confirm Delete'),
                                content: const Text(
                                    'Are you sure you want to delete this member?'),
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
                                  ),// TODO: Implement delete member logic
                                  ),
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.delete)),
                  
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MemberProfileScreen()));
              },// You might want to pass the member's data to the profile screen.
            );
          }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SendMessageScreen()));
              },
              child: const FaIcon(FontAwesomeIcons.message)),
          const SizedBox(height: 10),
          FloatingActionButton(
             onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddMemberScreen()));
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Fee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.request_page),
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