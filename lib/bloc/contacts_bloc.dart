import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/contact_model.dart';
import '../repositories/contacts_repo.dart';
import '../screens/sorting_screen.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc() : super(ContactsLoading()) {
    on<FetchContacts>((event, emit) async {
      emit(ContactsLoading());
      try {
        final watchlist = await ContactsRepository().getUsers();
        final watchlistGroups = _splitContactsIntoSublist(watchlist, 30);
        emit(ContactsLoaded(watchlistGroups));
      } catch (e) {
        emit(ContactsError('Something Went Wrong!!'));
      }
    });

    on<SortContacts>((event, emit) {
      if (state is ContactsLoaded) {
        final currentState = state as ContactsLoaded;
        final sortedUsers = _sortContacts(currentState.users, event.ascending);
        emit(ContactsLoaded(sortedUsers));
      }
    });
  }

  List<List<ContactModel>> _splitContactsIntoSublist(
      List<ContactModel> contacts, int chunkSize) {
    List<List<ContactModel>> sublistFinal = [];
    for (int i = 0; i < contacts.length; i += chunkSize) {
      final endIndex = i + 30;
      final sublist = contacts.sublist(
          i, endIndex > contacts.length ? contacts.length : endIndex);
      sublistFinal.add(sublist);
    }
    return sublistFinal;
  }

  List<List<ContactModel>> _sortContacts(
      List<List<ContactModel>> contacts, bool ascending) {
    contacts.forEach((group) {
      group.sort((a, b) {
        if (ascending) {
          return a.id.compareTo(b.id);
        } else {
          return b.id.compareTo(a.id);
        }
      });
    });
    return contacts;
  }
}
