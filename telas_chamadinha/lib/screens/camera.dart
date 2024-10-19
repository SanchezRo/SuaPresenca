import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistroScreen extends StatefulWidget {
  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  String? selectedTurma;
  String? selectedMateria;

  // Listas de opções (substitua pelos seus dados reais)
  final List<String> turmas = ['Turma A', 'Turma B', 'Turma C'];
  final List<String> materias = ['Matemática', 'História', 'Ciências'];

  // Função para abrir a câmera
  Future<void> _openCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      // Aqui você pode processar a imagem capturada
      print('Imagem capturada: ${image.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Imagem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dropdown para escolher a turma
            DropdownButton<String>(
              hint: Text('Escolha uma Turma'),
              value: selectedTurma,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTurma = newValue;
                });
              },
              items: turmas.map<DropdownMenuItem<String>>((String turma) {
                return DropdownMenuItem<String>(
                  value: turma,
                  child: Text(turma),
                );
              }).toList(),
            ),

            SizedBox(height: 20), // Espaçamento

            // Dropdown para escolher a matéria
            DropdownButton<String>(
              hint: Text('Escolha uma Matéria'),
              value: selectedMateria,
              onChanged: (String? newValue) {
                setState(() {
                  selectedMateria = newValue;
                });
              },
              items: materias.map<DropdownMenuItem<String>>((String materia) {
                return DropdownMenuItem<String>(
                  value: materia,
                  child: Text(materia),
                );
              }).toList(),
            ),

            SizedBox(height: 20), // Espaçamento

            // Botão para abrir a câmera
            ElevatedButton(
              onPressed: () {
                if (selectedTurma != null && selectedMateria != null) {
                  _openCamera();
                } else {
                  // Exibir mensagem de erro se não selecionar turma ou matéria
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Por favor, escolha a turma e a matéria.')),
                  );
                }
              },
              child: Text('Registrar Imagem'),
            ),
          ],
        ),
      ),
    );
  }
}
