part of 'contacts_bloc.dart';

abstract class ContactsEvent {}

class FetchContacts extends ContactsEvent {}

class SortContacts extends ContactsEvent {
  final bool ascending;
  final SortingOption sortingOption;

  SortContacts({
    required this.ascending,
    required this.sortingOption,
  });
}
