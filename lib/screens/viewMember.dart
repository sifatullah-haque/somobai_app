import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
        body: Column(
          children: [
            SizedBox(height: 16.0),
            Text('View Member',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 16.0),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('members')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(); // Loading indicator
                  }
                  final members = snapshot.data!.docs;

                  // Create a ListView to display members
                  return ListView.builder(
                    itemCount: members.length,
                    itemBuilder: (context, index) {
                      Map<String?, dynamic> data =
                          members[index].data() as Map<String?, dynamic>;
                      return SingleChildScrollView(
                        child: ListTile(
                          title: Text(
                                "Name: ${data['name']}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ) ??
                              Text('data'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Mail: ${data['mail']}") ?? Text('data'),
                              Text("Mobile: ${data['mobile']}") ?? Text('data'),
                              Text("NID: ${data['nid']}") ?? Text('data'),
                            ],
                          ),
                          // Customize the ListTile as needed
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

// class MemberList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('members').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return CircularProgressIndicator(); // Loading indicator
//         }
//         final members = snapshot.data.docs;

//         // Create a ListView to display members
//         return ListView.builder(
//           itemCount: members.length,
//           itemBuilder: (context, index) {
//             Map<String, dynamic> data =
//                 members[index].data() as Map<String, dynamic>;
//             return ListTile(
//               title: Text(data['name']),
//               subtitle: Text(data['email']),
//               // Customize the ListTile as needed
//             );
//           },
//         );
//       },
//     );
//   }
// }
