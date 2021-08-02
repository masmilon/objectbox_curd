import 'package:flutter/material.dart';
import '../objectBox/entities.dart';

class AddPerson extends StatefulWidget {
  static final routeName = "/add-person";

  AddPerson({Key? key}) : super(key: key);

  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _mobileController = TextEditingController();
  Function? saveNewPerson;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    saveNewPerson = ModalRoute.of(context)?.settings.arguments as Function;
  }

  void _savePerson() {
    if (_nameController.text.isEmpty || _addressController.text.isEmpty) {
      return;
    }

    final personModelData = PersonModel(
      name: _nameController.text,
      address: _addressController.text,
      mobile: _mobileController.text,
    );

    saveNewPerson!(personModelData);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new person"),
        actions: [
          IconButton(
            onPressed: _savePerson,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(labelText: 'Address'),
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      controller: _mobileController,
                      decoration: InputDecoration(labelText: 'Mobile'),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _savePerson,
                        icon: Icon(Icons.add),
                        label: Text('Add Person'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
