import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:path_provider/path_provider.dart';
import 'package:project_objbx/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart' as path;

import '../objectBox/entities.dart';

import '../widgets/personListCard.dart';
import '../screens/addPerson.dart';

class PersonList extends StatefulWidget {
  const PersonList({Key? key}) : super(key: key);

  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  // Objectbox
  late Store _store;
  bool hasBeenInitialized = false;

  late Stream<List<PersonModel>> _stream;

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((dir) {
      _store = Store(
        getObjectBoxModel(),
        directory: path.join(dir.path, 'objectbox'),
      );
      setState(() {
        _stream = _store
            .box<PersonModel>()
            .query()
            .watch(triggerImmediately: true)
            .map((query) => query.find());
        hasBeenInitialized = true;
      });
    });
  }

  @override
  void dispose() {
    _store.close();
    super.dispose();
  }

  void _saveNewPerson(PersonModel newPerson) {
    _store.box<PersonModel>().put(newPerson);
  }

  void _updatePerson(PersonModel updatedPerson) {
    // print(updatedPerson.id);
    _store.box<PersonModel>().put(updatedPerson, mode: PutMode.update);
  }

  // Objectbox end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Persons List"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AddPerson.routeName,
                arguments: _saveNewPerson,
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: !hasBeenInitialized
          ? Center(
              child: CircularProgressIndicator(),
            )
          : StreamBuilder<List<PersonModel>>(
              stream: _stream,
              builder: (ctx, snapShot) {
                if (!snapShot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return PersonListCard(
                  persons: snapShot.data!,
                  updatePersonFunc: _updatePerson,
                  store: _store,
                );
              },
            ),
    );
  }
}
