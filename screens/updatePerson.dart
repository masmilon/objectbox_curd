import 'package:flutter/material.dart';
import '../objectBox/entities.dart';

class UpdatePerson extends StatefulWidget {
  static final routeName = "/update-person";

  UpdatePerson({Key? key}) : super(key: key);

  @override
  _UpdatePersonState createState() => _UpdatePersonState();
}

class _UpdatePersonState extends State<UpdatePerson> {
  final _form = GlobalKey<FormState>();
  Function? _updatePerson;

  PersonModel _editedPerson = PersonModel(
    id: 0,
    name: '',
    address: '',
    mobile: '',
  );

  Map<String?, String?> _initValue = {
    'name': '',
    'address': '',
    'mobile': '',
  };

  bool _isInit = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final e = ModalRoute.of(context)?.settings.arguments as List;
      _editedPerson = e[0];
      _updatePerson = e[1];

      _initValue = {
        'name': _editedPerson.name,
        'address': _editedPerson.address,
        'mobile': _editedPerson.mobile,
      };
    }

    _isInit = false;

    super.didChangeDependencies();
  }

  void _savePerson() {
    _form.currentState?.save();
    _updatePerson!(_editedPerson);
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
                child: Form(
                  key: _form,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: _initValue['name'],
                        decoration: InputDecoration(labelText: 'Name'),
                        onSaved: (value) {
                          _editedPerson = PersonModel(
                            id: _editedPerson.id,
                            name: value!,
                            address: _editedPerson.address,
                            mobile: _editedPerson.mobile,
                          );
                        },
                      ),
                      TextFormField(
                          initialValue: _initValue['address'],
                          decoration: InputDecoration(labelText: 'Address'),
                          onSaved: (value) {
                            _editedPerson = PersonModel(
                              id: _editedPerson.id,
                              name: _editedPerson.name,
                              address: value!,
                              mobile: _editedPerson.mobile,
                            );
                          }),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(labelText: 'Mobile'),
                        initialValue: _initValue['mobile'],
                        onSaved: (value) {
                          _editedPerson = PersonModel(
                            id: _editedPerson.id,
                            name: _editedPerson.name,
                            address: _editedPerson.address,
                            mobile: value!,
                          );
                        },
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
          ),
        ],
      ),
    );
  }
}
