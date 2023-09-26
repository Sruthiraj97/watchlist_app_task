import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtchlst_api_example/bloc/contacts_bloc.dart';
import 'package:wtchlst_api_example/constants/textconstants.dart';
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
    BlocProvider.of<ContactsBloc>(context).add(FetchContacts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          body: DefaultTabController(
            length: 5,
            child: Scaffold(
              appBar: customAppBar(),
              body: BlocBuilder<ContactsBloc, ContactsState>(
                builder: (context, state) {
                  if (state is ContactsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ContactsLoaded) {
                    final singleListContacts =
                        state.users.expand((list) => list).toList();
                    print(state.users);

                    return TabBarView(
                      children: [
                        BlocProvider.value(
                          value: BlocProvider.of<ContactsBloc>(context),
                          child: Tab1(contacts: singleListContacts),
                        ),
                        BlocProvider.value(
                          value: BlocProvider.of<ContactsBloc>(context),
                          child: Tab1(contacts: singleListContacts),
                        ),
                        BlocProvider.value(
                          value: BlocProvider.of<ContactsBloc>(context),
                          child: Tab1(contacts: singleListContacts),
                        ),
                        BlocProvider.value(
                          value: BlocProvider.of<ContactsBloc>(context),
                          child: Tab1(contacts: singleListContacts),
                        ),
                        BlocProvider.value(
                          value: BlocProvider.of<ContactsBloc>(context),
                          child: Tab1(contacts: singleListContacts),
                        ),
                      ],
                    );
                  }

                  if (state is ContactsError) {
                    // retry here
                    return Center(
                      child: Text(TextConstants.unableToFetch),
                    );
                  }

                  return Container(
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    child: Text(TextConstants.somethingWentWrong),
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

PreferredSizeWidget customAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: titleText(),
    leading: const Padding(
      padding: EdgeInsets.only(
        left: 10,
      ),
      child: Icon(
        Icons.arrow_back_ios,
      ),
    ),
    bottom: TabBar(
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.black,
      tabs: [
        Tab(
          child: tabText(TextConstants.contactOne),
        ),
        Tab(
          child: tabText(TextConstants.contactTwo),
        ),
        Tab(
          child: tabText(TextConstants.contactThree),
        ),
        Tab(
          child: tabText(TextConstants.contactThree),
        ),
        Tab(
          child: tabText(TextConstants.contactThree),
        ),
      ],
    ),
  );
}

Widget titleText() {
  return Text(
    TextConstants.watchList,
    style: const TextStyle(
      color: Colors.black,
    ),
  );
}

Widget tabText(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 14),
  );
}
