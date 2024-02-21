import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_management_tutorial/features/contacts/model/contact_model.dart';
import 'package:state_management_tutorial/features/contacts/provider/contact_provider.dart';
import 'package:state_management_tutorial/features/contacts/view/widgets/contact_field_widget.dart';

import '../widgets/header_widget.dart';

class ConctactPage extends ConsumerWidget {
  ConctactPage({super.key});

  final name = TextEditingController();
  final phone = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(contactsProvider);
    return Scaffold(
      appBar: HeaderWidget(
        onTapNew: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => ContactFieldSheet(
              name: name,
              phone: phone,
              formKey: formKey,
              onSubmit: () {
                if (formKey.currentState!.validate()) {
                  ref.read(contactsProvider.notifier).addContact(
                        ContactModel(
                          imageFile: ref.watch(imageProvider) == null
                              ? null
                              : File(ref.watch(imageProvider)!.path),
                          name: name.text,
                          phone: phone.text,
                        ),
                      );
                  name.clear();
                  phone.clear();
                  ref.read(imageProvider.notifier).state = null;
                  Navigator.pop(context);
                }
              },
              onTapImage: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Pick Image From"),
                    content: Row(
                      children: [
                        TextButton.icon(
                          onPressed: () async {
                            final imagePicker = ImagePicker();
                            XFile? image = await imagePicker.pickImage(
                                source: ImageSource.camera);
                            if (image != null) {
                              if (context.mounted) {
                                Navigator.pop(context);
                              }
                            }
                            ref.read(imageProvider.notifier).state = image;
                          },
                          icon: const Icon(Icons.camera),
                          label: const Text("Camera"),
                        ),
                        TextButton.icon(
                          onPressed: () async {
                            final imagePicker = ImagePicker();
                            XFile? image = await imagePicker.pickImage(
                                source: ImageSource.gallery);
                            if (image != null) {
                              Future.sync(() => Navigator.pop(context));
                            }
                            ref.read(imageProvider.notifier).state = image;
                          },
                          icon: const Icon(Icons.photo),
                          label: const Text("Gallery"),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      body: contacts.isEmpty
          ? Center(
              child: Text(
                "Add a new contact",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: contacts[index].imageFile == null
                        ? null
                        : FileImage(contacts[index].imageFile!),
                    child: contacts[index].imageFile == null
                        ? const Icon(Icons.person)
                        : null,
                  ),
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].phone),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.dialpad),
      ),
    );
  }
}
