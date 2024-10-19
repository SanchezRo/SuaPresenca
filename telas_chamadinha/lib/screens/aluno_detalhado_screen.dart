import 'package:flutter/material.dart';



class DetalhadaFrequenciaScreen extends StatefulWidget {
  @override
  _DetalhadaFrequenciaScreenState createState() => _DetalhadaFrequenciaScreenState();
}

class _DetalhadaFrequenciaScreenState extends State<DetalhadaFrequenciaScreen> {
  String? turmaSelecionada;
  final List<String> turmas = ['Português', 'Matemática', 'História'];

  String alunoNome = "Marina Santos"; // Nome do Aluno
  String idAluno = "123456789"; // ID do aluno

  // Exemplo de dados de presença por turma
  final Map<String, List<Map<String, String>>> presencasAluno = {
    "Português": [
      {"data": "14/02", "presencas": "2", "faltas": "0"},
      {"data": "21/02", "presencas": "2", "faltas": "0"},
      {"data": "28/02", "presencas": "1", "faltas": "1"},
      {"data": "04/03", "presencas": "2", "faltas": "0"},
      {"data": "11/03", "presencas": "0", "faltas": "2"},
      {"data": "18/03", "presencas": "0", "faltas": "2"},
      {"data": "25/03", "presencas": "1", "faltas": "1"},
    ],
    "Matemática": [
      {"data": "14/02", "presencas": "1", "faltas": "1"},
      {"data": "21/02", "presencas": "0", "faltas": "2"},
      {"data": "28/02", "presencas": "1", "faltas": "1"},
      {"data": "04/03", "presencas": "2", "faltas": "0"},
      {"data": "11/03", "presencas": "0", "faltas": "2"},
      {"data": "18/03", "presencas": "0", "faltas": "2"},
      {"data": "25/03", "presencas": "1", "faltas": "1"},
    ],
    "História": [
      {"data": "14/02", "presencas": "1", "faltas": "1"},
      {"data": "21/02", "presencas": "0", "faltas": "2"},
      {"data": "28/02", "presencas": "1", "faltas": "1"},
      {"data": "04/03", "presencas": "2", "faltas": "0"},
      {"data": "11/03", "presencas": "0", "faltas": "2"},
      {"data": "18/03", "presencas": "0", "faltas": "2"},
      {"data": "25/03", "presencas": "1", "faltas": "1"},
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue[900],
                  backgroundColor: Colors.white),
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
              'ID: $idAluno',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Nome do aluno
            Text(
              'Aluno: $alunoNome',
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

            // Tabela de frequência dos alunos
            turmaSelecionada != null
                ? Expanded(child: buildTabelaPresencas())
                : Container(
              alignment: Alignment.center,
              child: Text(
                "Selecione uma turma para ver a frequência",
                style: TextStyle(fontSize: 16),
              ),
            ),

            // Botão Alterar
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Ação de alterar dados
                },
                child: Text('Alterar'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir a tabela de presenças
  Widget buildTabelaPresencas() {
    List<Map<String, String>>? dadosPresenca = presencasAluno[turmaSelecionada];

    return ListView(
      children: [
        Table(
          children: [
            TableRow(
              children: [
                tableCell('Data', isHeader: true),
                tableCell('Presenças', isHeader: true),
                tableCell('Faltas', isHeader: true),
              ],
            ),
            ...dadosPresenca!.map((presenca) {
              return TableRow(children: [
                tableCell(presenca["data"]!),
                tableCell(presenca["presencas"]!),
                tableCell(presenca["faltas"]!),
              ]);
            }).toList(),
          ],
        ),
      ],
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
}
