import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtchlst_api_example/bloc/contacts_bloc.dart';
import 'package:wtchlst_api_example/models/contact_model.dart';
import 'package:wtchlst_api_example/screens/sorting_screen.dart';
import 'package:wtchlst_api_example/widgets/tab1_content.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => ContactsScreenState();
}

class ContactsScreenState extends State<ContactsScreen> {
  List<List<ContactModel>> contacts = [];

  @override
  void initState() {
    // call API here
    BlocProvider.of<ContactsBloc>(context).add(FetchContacts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          body: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                title: const Text('WatchList'),
                leading: const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'Contacts 1',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Contacts 2',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Contacts 3',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color:
                            Colors.blue, // Color of the underline when selected
                        width: 3.0, // Thickness of the underline
                      ),
                    ),
                  ),
                  labelColor: Colors.black,
                ),
              ),
              body: BlocBuilder<ContactsBloc, ContactsState>(
                builder: (context, state) {
                  if (state is ContactsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ContactsLoaded) {
                    contacts = state.users;
                    print(contacts);
                    return TabBarView(
                      children: [
                        BlocProvider.value(
                          value: BlocProvider.of<ContactsBloc>(context),
                          child: Tab1(contacts: contacts[0]),
                        ),
                        BlocProvider.value(
                          value: BlocProvider.of<ContactsBloc>(context),
                          child: Tab1(contacts: contacts[1]),
                        ),
                        BlocProvider.value(
                          value: BlocProvider.of<ContactsBloc>(context),
                          child: Tab1(contacts: contacts[2]),
                        ),
                      ],
                    );
                  }
                  if (state is ContactsError) {
                    // retry here
                    return const Center(
                      child: Text('Unable to fetch data, Please try again!!'),
                    );
                  }
                  return Container(
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    child: const Text(
                        'Something went wrong!!, Please try after a while.'),
                  );
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endDocked,
              floatingActionButton: buildFloatingActionButton(context),
            ),
          ),
        );
      },
    );
  }
}

Widget buildFloatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: Container(
                color: Colors.white,
                child: const Center(
                  child: SortingScreen(),
                ),
              ),
            ),
          );
        },
      );
    },
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(20.0), // Adjust the border radius as needed
    ),
    backgroundColor: Colors.white,
    child: const Icon(
      Icons.menu_open,
      color: Colors.blue, // Set the color of the icon to blue
    ),
  );
}
