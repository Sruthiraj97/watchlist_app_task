part of 'contacts_bloc.dart';

abstract class ContactsEvent {}

class FetchContacts extends ContactsEvent {}

class SortContacts extends ContactsEvent {
  final bool ascending;

  SortContacts({required this.ascending, required SortingOption sortingOption});
}
