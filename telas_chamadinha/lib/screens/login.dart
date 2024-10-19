import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo "SUA Presença"
              Text(
                "SUA Presença",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40), // Espaço entre logo e campos

              // Texto de instrução
              Text(
                "Faça o LOGIN\nInforme seu Número de Identificação (ID) e Senha para acessar o app",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),

              // Campo de ID
              TextField(
                decoration: InputDecoration(
                  labelText: 'Digite seu ID aqui',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Campo de Senha
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Digite sua SENHA aqui',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // Botão de login
              ElevatedButton(
                onPressed: () {
                  // Lógica de login
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  iconColor: Colors.black,
                ),
                child: Text('ENTRAR'),
              ),
              SizedBox(height: 20),

              // Termos de serviço e política de privacidade
              Text(
                'By clicking continue, you agree to our Terms of Service and Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
