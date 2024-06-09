import 'package:apptravelsafe/_comum/minhasCores.dart';
import 'package:apptravelsafe/servicos/autenticacaoServico.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Travel Safe",
          style: TextStyle(
              color: MinhasCores.azul4,
              fontFamily: "Caveat",
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: MinhasCores.azul,
        iconTheme: IconThemeData(color: MinhasCores.azul4),
        actions: [
          Padding(
            padding: EdgeInsets.all(11.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/logo1.png"),
            ),
          ),
        ],
      ),      
      drawer: Drawer(
        child: Container(
          color: MinhasCores.azul,
        child: 
        ListView(
          children: [
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: MinhasCores.azul4,
              ),
              title: const Text("Sair",
                  style: TextStyle(
                      color: MinhasCores.azul4,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                AutenticacaoServico().deslogar();
              },
            ),
            ListTile(
              leading: Icon(Icons.person,color: MinhasCores.azul4,),
              title: Text("Minha Conta",style: TextStyle(color: MinhasCores.azul4),),
              onTap: () {
                Navigator.pop(context);
                //Adicionar ação.
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone,color: MinhasCores.azul4,),
              title: Text("Meus Contatos",style: TextStyle(color: MinhasCores.azul4),),
              onTap: () {
                Navigator.pop(context);
                //Adicionar ação.
              },
            ),
            ListTile(
              leading: Icon(Icons.event,color: MinhasCores.azul4,),
              title: Text("Meus Eventos",style: TextStyle(color: MinhasCores.azul4),),
              onTap: () {
                Navigator.pop(context);
                //Adicionar ação.
              },
            ),
            ListTile(
              leading: Icon(Icons.chat_rounded,color: MinhasCores.azul4,),
              title: Text("Minhas Conversas",style: TextStyle(color: MinhasCores.azul4),),
              onTap: () {
                Navigator.pop(context);
                //Adicionar ação.
              },
            ),
            ListTile(
              leading: Icon(Icons.emergency_rounded,color: MinhasCores.azul4,),
              title: Text("Emergência",style: TextStyle(color: MinhasCores.azul4, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.pop(context);
                //Adicionar ação.
              },
            ),
          ],
        ),      
      ),
      ),
      /*body: Center(child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Pesquisar"),
        ]
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),*/
    );
  }
}
