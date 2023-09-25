import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtchlst_api_example/bloc/contacts_bloc.dart';
import 'package:wtchlst_api_example/constants/textconstants.dart';

enum SortingOption {
  none,
  alphabeticalAscending,
  alphabeticalDescending,
  numericAscending,
  numericDescending
}

class SortingScreen extends StatefulWidget {
  const SortingScreen({Key? key}) : super(key: key);

  @override
  _SortingScreenState createState() => _SortingScreenState();
}

class _SortingScreenState extends State<SortingScreen> {
  SortingOption selectedSortingOption = SortingOption.none;

  void toggleSortingOption(SortingOption option) {
    setState(() {
      if (selectedSortingOption == option) {
        selectedSortingOption = SortingOption.none;
      } else {
        selectedSortingOption = option;
      }
      _sortContacts();
    });
  }

  void _sortContacts() {
    SortingOption sortingOption = SortingOption.none;
    bool ascending = true;

    switch (selectedSortingOption) {
      case SortingOption.alphabeticalAscending:
        sortingOption = SortingOption.alphabeticalAscending;
        break;
      case SortingOption.alphabeticalDescending:
        sortingOption = SortingOption.alphabeticalDescending;
        ascending = false;
        break;
      case SortingOption.numericAscending:
        sortingOption = SortingOption.numericAscending;
        break;
      case SortingOption.numericDescending:
        sortingOption = SortingOption.numericDescending;
        ascending = false;
        break;
      default:
        break;
    }

    BlocProvider.of<ContactsBloc>(context).add(
      SortContacts(sortingOption: sortingOption, ascending: ascending),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TextConstants.sorting,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        TextConstants.done,
                        style: TextStyle(
                          color: selectedSortingOption != SortingOption.none
                              ? Colors.blue
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(TextConstants.alphabetically),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          toggleSortingOption(
                              SortingOption.alphabeticalAscending);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: selectedSortingOption ==
                                  SortingOption.alphabeticalAscending
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        child: Row(
                          children: [
                            Text(
                              TextConstants.aletter,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8.0),
                            const Icon(Icons.arrow_downward),
                            const SizedBox(width: 8.0),
                            Text(
                              TextConstants.zletter,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      TextButton(
                        onPressed: () {
                          toggleSortingOption(
                              SortingOption.alphabeticalDescending);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: selectedSortingOption ==
                                  SortingOption.alphabeticalDescending
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        child: Row(
                          children: [
                            Text(
                              TextConstants.zletter,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8.0),
                            const Icon(Icons.arrow_upward),
                            const SizedBox(width: 8.0),
                            Text(
                              TextConstants.aletter,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(TextConstants.userID),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          toggleSortingOption(SortingOption.numericAscending);
                        },
                        style: TextButton.styleFrom(
                          primary: selectedSortingOption ==
                                  SortingOption.numericAscending
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        child: Row(
                          children: [
                            Text(
                              TextConstants.number_0,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8.0),
                            const Icon(Icons.arrow_downward),
                            const SizedBox(width: 8.0),
                            Text(
                              TextConstants.number_9,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          toggleSortingOption(SortingOption.numericDescending);
                        },
                        style: TextButton.styleFrom(
                          primary: selectedSortingOption ==
                                  SortingOption.numericDescending
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        child: Row(
                          children: [
                            Text(
                              TextConstants.number_9,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8.0),
                            const Icon(Icons.arrow_upward),
                            const SizedBox(width: 8.0),
                            Text(
                              TextConstants.number_0,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
