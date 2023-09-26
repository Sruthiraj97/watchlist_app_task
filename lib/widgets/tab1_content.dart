import 'package:flutter/material.dart';
import 'package:wtchlst_api_example/constants/textconstants.dart';
import 'package:wtchlst_api_example/models/contact_model.dart';

class Tab1 extends StatefulWidget {
  const Tab1({Key? key, required this.contacts}) : super(key: key);

  final List<ContactModel> contacts;

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: widget.contacts.length,
        itemBuilder: (context, index) {
          final contact = widget.contacts[index];
          return Card(
            color: Colors.white,
            elevation: 4,
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Text(
                        contact.name?.toUpperCase() ?? TextConstants.noName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            contact.contacts ?? TextConstants.nocontacts,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'UserID: ${contact.id}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/person.jpg'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
