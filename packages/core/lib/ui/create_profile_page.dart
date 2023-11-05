import 'package:flutter/material.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage(
      {super.key,
      this.isLoading = false,
      this.errorText,
      required this.onSubmit});

  final bool isLoading;
  final String? errorText;
  final Function(String) onSubmit;

  @override
  State<CreateProfilePage> createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Profile'),
        actions: [
          TextButton(
              onPressed: widget.isLoading
                  ? null
                  : () => widget.onSubmit(controller.value.text),
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(errorText: widget.errorText),
          onSubmitted:
              widget.isLoading ? null : (value) => widget.onSubmit(value),
        ),
      ),
    );
  }
}
