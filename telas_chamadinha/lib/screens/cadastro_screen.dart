import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CadastroAlunoScreen extends StatefulWidget {
  @override
  _CadastroAlunoScreenState createState() => _CadastroAlunoScreenState();
}

class _CadastroAlunoScreenState extends State<CadastroAlunoScreen> {
  String? periodoSelecionado;
  String? turmaSelecionada;
  File? _image; // Variável para armazenar a imagem do aluno
  final ImagePicker _picker = ImagePicker(); // Instância do ImagePicker

  final List<String> periodos = ['Matutino', 'Vespertino', 'Noturno'];
  final List<String> turmas = ['Turma 1', 'Turma 2', 'Turma 3'];

  TextEditingController idController = TextEditingController(text: '123456789');
  TextEditingController nomeController = TextEditingController(text: 'Marina Santos');
  TextEditingController senhaController = TextEditingController(text: '123456789');

  // Função para abrir a câmera e capturar uma imagem
  Future<void> _openCamera() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  // Função para carregar uma imagem da galeria
  Future<void> _pickImageFromGallery() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/walterBranco.png'),
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('SAIR'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue[900],
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView( // Adiciona o scroll
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RA DO ALUNO',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: idController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            Text(
              'NOME COMPLETO',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            Text(
              'PERÍODO',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              hint: Text('Selecione o Período'),
              value: periodoSelecionado,
              onChanged: (newValue) {
                setState(() {
                  periodoSelecionado = newValue;
                });
              },
              items: periodos.map((periodo) {
                return DropdownMenuItem(
                  child: Text(periodo),
                  value: periodo,
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            Text(
              'TURMA',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              hint: Text('Selecione a Turma'),
              value: turmaSelecionada,
              onChanged: (newValue) {
                setState(() {
                  turmaSelecionada = newValue;
                });
              },
              items: turmas.map((turma) {
                return DropdownMenuItem(
                  child: Text(turma),
                  value: turma,
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            // Área de exibição da foto do aluno
            Center(
              child: Column(
                children: [
                  _image != null
                      ? Image.file(
                    _image!,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Icon(Icons.person, size: 100, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _openCamera,
                        child: Text('Tirar Foto'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _pickImageFromGallery,
                        child: Text('Carregar da Galeria'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Ação de cadastrar o aluno (futuramente integração com Firebase)
                  if (_image != null) {
                    print('Imagem carregada: ${_image!.path}');
                  }
                },
                child: Text('Cadastrar'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
