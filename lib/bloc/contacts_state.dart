part of 'contacts_bloc.dart';

abstract class ContactsState {}

class ContactsInitial extends ContactsState {}

class ContactsLoading extends ContactsState {}

class ContactsLoaded extends ContactsState {
  final List<List<ContactModel>> users;

  ContactsLoaded(this.users);
}

class ContactsError extends ContactsState {
  final String errorMessage;

  ContactsError(this.errorMessage);
}
