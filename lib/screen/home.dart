import 'package:flutter/material.dart';
import 'package:form_mp1/components/button_form.dart';
import 'package:form_mp1/components/field_entry.dart';

class Home extends StatelessWidget {
  final String title;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Home({super.key, required this.title});

  _onSavePressed(BuildContext context) {
    bool? isValid = _formKey.currentState?.validate();
    if (isValid != true) {
      return;
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Sucesso"),
            // Retrieve the text that the user has entered by using the
            // TextEditingController.
            content: Column(
              children: [
                Text(nameController.text),
                Text(emailController.text),
                Text(addressController.text),
              ],
            ),
          );
        },
      );
    }
  }

  _onCancelPressed(BuildContext context) {
    _formKey.currentState?.reset();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Atenção"),
            content: SizedBox(
              height: 70,
              child: Column(
                children: [
                  const Text("Seus dados foram limpos!"),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK')),
                  )
                ],
              ),
            ),
          );
        });
  }

  String? _validateEmail(String? email) {
    if (email != null &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)) {
      return null;
    }
    return _messageToValidate("email");
  }

  String? _validateName(String? name) {
    if (name != null &&
        RegExp(r"^[a-zA-Z]").hasMatch(name) &&
        name.length >= 3) {
      return null;
    }
    return _messageToValidate("nome");
  }

  String? _validateAddress(String? address) {
    if (address != null && address.isNotEmpty) {
      return null;
    }
    return _messageToValidate("endereço");
  }

  _messageToValidate(String field) {
    return "${capitalize(field)} possui formato inválido!";
  }

  capitalize(String field) {
    return field.replaceRange(0, 1, field.characters.first.toUpperCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TELA DE CADASTRO',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FieldEntry(
                'nome',
                controller: nameController,
                inputType: TextInputType.name,
                validate: _validateName,
              ),
              FieldEntry(
                'endereço',
                controller: addressController,
                validate: _validateAddress,
              ),
              FieldEntry(
                'email',
                controller: emailController,
                inputType: TextInputType.emailAddress,
                validate: _validateEmail,
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonForm(
                      label: 'Cancelar',
                      onPressed: () {
                        _onCancelPressed(context);
                      },
                    ),
                    const SizedBox(width: 16),
                    ButtonForm(
                      label: 'Salvar',
                      onPressed: () {
                        _onSavePressed(context);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
