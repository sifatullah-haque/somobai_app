import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:somobai/added_by_sifat/main_color.dart';

/// A screen that displays a list of members from a Firestore collection.
class ViewMember extends StatefulWidget {
  const ViewMember({super.key});

  @override
  State<ViewMember> createState() => _ViewMemberState();
}

class _ViewMemberState extends State<ViewMember> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "View Member",
            style: TextStyle(fontSize: 20.0),
          ),
          backgroundColor: ColorIs.basicColor,
        ),
        body: Column(
          children: [
            const SizedBox(height: 32.0),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('members')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator(); // Loading indicator
                  }
                  final members = snapshot.data!.docs;

                  // Create a ListView to display members
                  return ListView.builder(
                    itemCount: members.length,
                    itemBuilder: (context, index) {
                      Map<String?, dynamic> data =
                          members[index].data() as Map<String?, dynamic>;
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ListTile(
                              title: Text(
                                "Name: ${data['name']}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),

                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("Mail: ${data['mail']}"),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("Mobile: ${data['mobile']}"),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text("NID: ${data['nid']}"),
                                ],
                              ),
                              // Customize the ListTile as needed
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
