import 'package:flutter/material.dart';
import 'package:form_mp1/components/button_form.dart';
import 'package:form_mp1/components/field_entry.dart';

class Home extends StatelessWidget {
  final String title;

  const Home({super.key, required this.title});

  _onPressedButton() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
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
            const FieldEntry('nome'),
            const FieldEntry('endereço'),
            const FieldEntry('email'),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonForm(
                    label: 'Cancelar',
                    onPressed: _onPressedButton,
                  ),
                  const SizedBox(width: 16),
                  ButtonForm(
                    label: 'Salvar',
                    onPressed: _onPressedButton,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
