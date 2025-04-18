import 'package:flutter/material.dart';
import 'package:myapp/payment_management/edit_reason_popup.dart';


// Unpaid List Screen
class UnpaidListScreen extends StatelessWidget {
  const UnpaidListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Example: 5 unpaid members
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Member ${index + 1}'),
          subtitle: const Text('Room A, 01/01/2023'),
          trailing: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => const EditReasonPopup(),
              );
            },
            child: const Text('Mark as Paid'),
          ),
        );
      },
    );
  }
}