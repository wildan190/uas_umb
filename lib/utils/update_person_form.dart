import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:uas_umb/dashboard.dart';

import 'package:uas_umb/models/person.dart';

class UpdatePersonForm extends StatefulWidget {
  final int index;
  final Person person;

  const UpdatePersonForm({
    required this.index,
    required this.person,
  });

  @override
  _UpdatePersonFormState createState() => _UpdatePersonFormState();
}

class _UpdatePersonFormState extends State<UpdatePersonForm> {
  final _personFormKey = GlobalKey<FormState>();

  late final _nameController;
  late final _countryController;
  late final _jurusanController;
  late final _fakultasController;
  late final Box box;

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  // Update info of people box
  _updateInfo() {
    Person newPerson = Person(
      name: _nameController.text,
      country: _countryController.text,
      jurusan: _jurusanController.text,
      fakultas: _fakultasController.text,
    );

    box.putAt(widget.index, newPerson);

    print('Info updated in box!');
  }

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('peopleBox');
    _nameController = TextEditingController(text: widget.person.name);
    _countryController = TextEditingController(text: widget.person.country);
    _fakultasController = TextEditingController(text: widget.person.fakultas);
    _jurusanController = TextEditingController(text: widget.person.jurusan);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _personFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('NIM'),
          TextFormField(
            controller: _nameController,
            validator: _fieldValidator,
          ),
          SizedBox(height: 24.0),
          Text('Nama'),
          TextFormField(
            controller: _countryController,
            validator: _fieldValidator,
          ),
          SizedBox(height: 24.0),
          Text('Fakultas'),
          TextFormField(
            controller: _fakultasController,
            validator: _fieldValidator,
          ),
          SizedBox(height: 24.0),
          Text('Jurusan'),
          TextFormField(
            controller: _jurusanController,
            validator: _fieldValidator,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_personFormKey.currentState!.validate()) {
                    _updateInfo();
                    Navigator.of(context).pop();
                  }
                  Fluttertoast.showToast(msg: 'Mahasiswa Berhasil di Update');
                },
                child: Text('Update'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 24.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: TextButton(
                onPressed: () {
                  Route route =
                      MaterialPageRoute(builder: (context) => dashboard());
                  Navigator.push(context, route);
                  //Fluttertoast.showToast(msg: 'Mahasiswa Berhasil di Update');
                },
                child: Text('Kembali'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
