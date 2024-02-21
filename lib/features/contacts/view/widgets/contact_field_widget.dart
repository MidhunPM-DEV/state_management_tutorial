import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_tutorial/features/contacts/provider/contact_provider.dart';

class ContactFieldSheet extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController phone;
  final GlobalKey<FormState> formKey;
  final void Function() onSubmit;
  final VoidCallback onTapImage;
  const ContactFieldSheet({
    super.key,
    required this.name,
    required this.phone,
    required this.formKey,
    required this.onSubmit,
    required this.onTapImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * .6,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                  IconButton(
                    onPressed: onSubmit,
                    icon: const Icon(Icons.check),
                  )
                ],
              ),
              Center(
                child: GestureDetector(
                  onTap: onTapImage,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Consumer(builder: (_, ref, __) {
                        return CircleAvatar(
                          radius: 88,
                          backgroundImage: ref.watch(imageProvider) == null
                              ? null
                              : FileImage(File(ref.watch(imageProvider)!.path)),
                          child: ref.watch(imageProvider) == null
                              ? const Icon(
                                  Icons.person,
                                  size: 8 * 6,
                                )
                              : null,
                        );
                      }),
                      Positioned(
                        right: 16,
                        bottom: 8,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurple,
                          ),
                          padding: const EdgeInsets.all(3),
                          child: const Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "Name",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.redAccent,
                  )),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  hintText: "Enter name",
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name Cannot be empty";
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              Text(
                "Phone Number",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              TextFormField(
                controller: phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.redAccent,
                  )),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  hintText: "Enter phone number",
                  prefixIcon: Icon(Icons.phone_android),
                  counterText: '',
                ),
                maxLength: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Phone number Cannot be empty";
                  }
                  if (value.length < 10) {
                    return "Enter a valid phone number";
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
