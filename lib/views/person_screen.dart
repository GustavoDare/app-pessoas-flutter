import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/models/person.dart';
import '../viewmodels/person_viewmodel.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PersonViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('App Pessoas - Floor')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _ageController,
                    decoration: const InputDecoration(labelText: 'Idade'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.blue),
                  onPressed: () {
                    final name = _nameController.text.trim();
                    final age = int.tryParse(_ageController.text.trim()) ?? 0;

                    if (name.isNotEmpty && age > 0) {
                      viewModel.addPerson(name, age);
                      _nameController.clear();
                      _ageController.clear();
                      FocusScope.of(context).unfocus();
                    }
                  },
                )
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: StreamBuilder<List<Person>>(
              stream: viewModel.personStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Nenhuma pessoa cadastrada.'));
                }

                final persons = snapshot.data!;
                return ListView.builder(
                  itemCount: persons.length,
                  itemBuilder: (context, index) {
                    final person = persons[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(person.id?.toString() ?? ''),
                      ),
                      title: Text(person.name),
                      subtitle: Text('${person.age} anos'),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}