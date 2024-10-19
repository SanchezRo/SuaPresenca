import 'package:flutter/material.dart';

import 'screens/aluno_detalhado_screen.dart';
import 'screens/cadastro_screen.dart';
import 'screens/camera.dart';
import 'screens/consulta_frequencia_alunos.dart';
import 'screens/homeScreen.dart';
import 'screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/login":(context) => LoginScreen(),
        "/home":(context) => HomeScreen(),
        "/consultaGeral":(context) => FrequenciaScreen(),
        "/aluno":(context) => DetalhadaFrequenciaScreen(),
        "/cadastro":(context) => CadastroAlunoScreen(),
        "/camera":(context) => RegistroScreen(),
      },
      initialRoute: '/login',
    );
  }
}
