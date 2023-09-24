import 'package:flutter/material.dart';
import 'package:wtchlst_api_example/constants/textconstants.dart';

class SortingScreen extends StatefulWidget {
  const SortingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SortingScreenState createState() => _SortingScreenState();
}

class _SortingScreenState extends State<SortingScreen> {
  bool isAlphabeticalAscending = false;
  bool isUserIDAscending = false;

  void toggleAlphabeticalSort() {
    setState(() {
      isAlphabeticalAscending = !isAlphabeticalAscending;
    });
  }

  void toggleUserIDSort() {
    setState(() {
      isUserIDAscending = !isUserIDAscending;
    });
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
                          color: isAlphabeticalAscending || isUserIDAscending
                              ? Colors.blue
                              : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      // Add spacing between options
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
                          toggleAlphabeticalSort();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: isAlphabeticalAscending
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
                          toggleAlphabeticalSort();
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: isAlphabeticalAscending
                              ? Colors.grey
                              : Colors.blue,
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
                          toggleUserIDSort();
                        },
                        style: TextButton.styleFrom(
                          primary:
                              isUserIDAscending ? Colors.blue : Colors.grey,
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
                          toggleUserIDSort();
                        },
                        style: TextButton.styleFrom(
                          primary:
                              isUserIDAscending ? Colors.grey : Colors.blue,
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
