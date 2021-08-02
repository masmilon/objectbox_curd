import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

import '../objectBox/entities.dart';
import '../screens/updatePerson.dart';

class PersonListCard extends StatefulWidget {
  // final List<PersonsDetails> persons;
  final List<PersonModel> persons;
  final Function updatePersonFunc;
  final Store store;

  const PersonListCard({
    required this.persons,
    required this.updatePersonFunc,
    required this.store,
  });

  @override
  _PersonListCardState createState() => _PersonListCardState();
}

class _PersonListCardState extends State<PersonListCard> {
  void _updatePerson(PersonModel person) {
    Navigator.of(context).pushNamed(
      UpdatePerson.routeName,
      arguments: [
        person,
        widget.updatePersonFunc,
      ],
    );
  }

  void _deletePerson(id) {
    widget.store.box<PersonModel>().remove(id);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: widget.persons.map(
          (person) {
            return Dismissible(
              key: ValueKey(person.id),
              background: Container(
                color: Theme.of(context).errorColor,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 40,
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                _deletePerson(person.id);
              },
              child: ListTile(
                onTap: () {},
                title: Text(person.name),
                subtitle: Row(
                  children: [
                    Text(person.address),
                    Text(" : "),
                    Text(person.mobile),
                  ],
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _updatePerson(person);
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          _deletePerson(person.id);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
