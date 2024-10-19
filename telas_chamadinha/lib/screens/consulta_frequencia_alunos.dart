import 'package:flutter/material.dart';
// Importando o arquivo da tela de detalhes
import 'aluno_detalhado_screen.dart';

class FrequenciaScreen extends StatefulWidget {
  @override
  _FrequenciaScreenState createState() => _FrequenciaScreenState();
}

class _FrequenciaScreenState extends State<FrequenciaScreen> {
  String? turmaSelecionada;
  String? materiaSelecionada;
  final List<String> turmas = ['Turma 1', 'Turma 2', 'Turma 3'];
  final List<String> materias = ['Português', 'Matemática', 'História'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100], // Cor de fundo
      appBar: AppBar(
        backgroundColor: Colors.blue[900], // Cor da barra
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Informações do usuário
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/walterBranco.png'), // Imagem de perfil
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
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ID do usuário
            Text(
              'ID: 123456789',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Seletor de turma
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
                  materiaSelecionada = null; // Reseta a matéria ao mudar a turma
                });
              },
              items: turmas.map((turma) {
                return DropdownMenuItem(
                  child: Text(turma),
                  value: turma,
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            // Seletor de matéria
            if (turmaSelecionada != null) ...[
              Text(
                'MATÉRIA',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                hint: Text('Selecione a Matéria'),
                value: materiaSelecionada,
                onChanged: (newValue) {
                  setState(() {
                    materiaSelecionada = newValue;
                  });
                },
                items: materias.map((materia) {
                  return DropdownMenuItem(
                    child: Text(materia),
                    value: materia,
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
            ],

            // Tabela de frequência dos alunos
            if (turmaSelecionada != null && materiaSelecionada != null) ...[
              Expanded(
                child: ListView(
                  children: [
                    Table(
                      children: [
                        TableRow(
                          children: [
                            tableCell('Alunos', isHeader: true),
                            tableCell('Presenças', isHeader: true),
                            tableCell('Faltas', isHeader: true),
                          ],
                        ),
                        tableRow(context, 'Aluno 01', '24', '06'),
                        tableRow(context, 'Aluno 02', '13', '17'),
                        tableRow(context, 'Aluno 03', '12', '18'),
                        tableRow(context, 'Aluno 04', '21', '09'),
                        tableRow(context, 'Aluno 05', '20', '10'),
                        tableRow(context, 'Aluno 06', '25', '05'),
                        tableRow(context, 'Aluno 07', '15', '15'),
                        tableRow(context, 'Aluno 08', '13', '17'),
                        tableRow(context, 'Aluno 09', '12', '18'),
                        tableRow(context, 'Aluno 10', '21', '09'),
                        tableRow(context, 'Aluno 11', '20', '10'),
                      ],
                    ),
                  ],
                ),
              ),
            ] else if (turmaSelecionada != null) ...[
              Center(
                child: Text(
                  'Selecione uma matéria para ver a frequência',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],

            // Botão Gerar Relatório
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Ação de gerar relatório
                },
                child: Text('Gerar Relatório'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função para gerar uma célula da tabela
  Widget tableCell(String content, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        content,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 16 : 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Função para criar uma linha da tabela com nomes clicáveis
  TableRow tableRow(BuildContext context, String aluno, String presencas, String faltas) {
    return TableRow(
      children: [
        GestureDetector(
          onTap: () {
            // Navegação para a tela de detalhes do aluno ao clicar no nome
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetalhadaFrequenciaScreen(), // Aqui usa a tela pronta
              ),
            );
          },
          child: tableCell(aluno),
        ),
        tableCell(presencas),
        tableCell(faltas),
      ],
    );
  }
}
