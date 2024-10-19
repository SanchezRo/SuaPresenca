import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100], // Cor de fundo
      appBar: AppBar(
        backgroundColor: Colors.blue[900], // Cor do AppBar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Informações do usuário
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/walterBranco.png'), // Imagem do perfil
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Walter Branco',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Administrador(a)',
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
            // Botão de Sair
            ElevatedButton(
              onPressed: () {
                // Ação de sair
                Navigator.pushNamed(context, '/login');
              },
              child: Text('SAIR'),
              style: ElevatedButton.styleFrom(foregroundColor: Colors.blue[900], backgroundColor: Colors.white),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Exibição do ID do usuário
            Text(
              'ID: 123456789',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),


            // Ícones e textos em GridView
            Expanded(
              child: SizedBox(
                width: 200,  // Largura comum para todos os botões
                height: 200,
                child: Align(//COMO ALINHAR AO CENTRO???????????????????????????
                  child: GridView.count(
                    crossAxisCount: 1, // Dois ícones por linha
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      // Agora cada ícone é um botão
                        IconButton(
                            icon: Icon(Icons.visibility, size: 50),
                          onPressed: (){
                            Navigator.pushNamed(context, '/consultaGeral');
                          }
                        ),

                      IconButton(
                          icon: Icon(Icons.person_add, size: 50),
                          onPressed: (){
                            Navigator.pushNamed(context, '/cadastro');
                          }
                      ),

                      IconButton(
                          icon: Icon(Icons.camera_alt, size: 50),
                          onPressed: (){
                            Navigator.pushNamed(context, '/camera');
                          }
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
