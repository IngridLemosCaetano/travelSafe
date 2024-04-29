import 'package:apptravelsafe/_comum/minhasCores.dart';
import 'package:apptravelsafe/servicos/autenticacaoServico.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial", style: TextStyle(color: Colors.white),),
        backgroundColor: MinhasCores.azul,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Sair"),
              onTap: () {
                AutenticacaoServico().deslogar();
              },
            ),
          ],
        ),
      ),
    );
  }
}
