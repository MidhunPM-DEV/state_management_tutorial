import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_management_tutorial/features/contacts/model/contact_model.dart';

class ContactNotifier extends Notifier<List<ContactModel>> {
  @override
  List<ContactModel> build() {
    return [];
  }

  void addContact(ContactModel contact) {
    state = [contact, ...state];
  }
}

final contactsProvider = NotifierProvider<ContactNotifier, List<ContactModel>>(
  () => ContactNotifier(),
);

final imageProvider = StateProvider<XFile?>((ref) => null);
