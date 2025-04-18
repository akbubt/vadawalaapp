import 'package:flutter/material.dart';

class MemberProfileScreen extends StatelessWidget {
  const MemberProfileScreen({super.key});

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
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(text: 'Information'),
                  Tab(text: 'Payment History'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // Information Tab Content
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                    ),
                    // Payment History Tab Content
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.builder(
                        itemCount: 5, // Example: 5 payment entries
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: const Text('August 1, 2022'),
                            subtitle: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Hostel Fees'),
                                Text('Rs.15000'),
                              ],
                            ),
                            trailing: const Text('Paid',
                                style: TextStyle(color: Colors.green)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}