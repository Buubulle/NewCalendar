import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medicalnote/models/listpatient.dart';
import 'package:medicalnote/models/listsettings.dart';

import '../component/component.dart';

class NewPatientController extends StatefulWidget {
  const NewPatientController({Key? key}) : super(key: key);

  @override
  State<NewPatientController> createState() => _NewPatientControllerState();
}

class _NewPatientControllerState extends State<NewPatientController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boxPatient = Hive.box('Patient');
  }

  late Box<Patients> boxPatient;
  late Box<Settings> settings;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController dateofbirthcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();

  void _submitData() {
    final enteredname = namecontroller.text;
    final enteredfirstname = firstnamecontroller.text;
    final entereddateofbirth = dateofbirthcontroller.text;
    final enteredemail = emailcontroller.text;
    final enteredphonenumber = phonenumbercontroller.text;

    if (enteredname.isEmpty ||
        enteredfirstname.isEmpty ||
        entereddateofbirth.isEmpty ||
        enteredemail.isEmpty ||
        enteredphonenumber.isEmpty) {
      return;
    }

    final newPT = Patients(
      name: enteredname,
      firstname: enteredfirstname,
      dateofbirth: entereddateofbirth,
      email: enteredemail,
      phonenumber: enteredphonenumber,
      date: DateTime.now(),
      id: DateTime.now().millisecondsSinceEpoch,
      //id: DateTime.now().millisecondsSinceEpoch,
      //listOfNotes: [],
    );
    boxPatient.add(newPT);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appBar(),
      body: _buildForm(),
      bottomNavigationBar: _savePatients(size),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'New Patient',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: -12,
              right: 6,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kDefaultcolor, elevation: 0),
                  child: const Text(
                    'Done',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onPressed: (() {
                    _submitData();
                  })),
            )
          ],
        ),
      ),
      backgroundColor: kDefaultcolor,
    );
  }

  SingleChildScrollView _buildForm() {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        children: <Widget>[
          Text(
            'Name',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Name',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(width: 1, color: kDefaultcolor),
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
                filled: true,
                fillColor: kcolor3,
              ),
              controller: namecontroller,
              onSubmitted: (_) => {
                    _submitData(),
                  }),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Firstname',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: 'Firstname',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(width: 1, color: kDefaultcolor),
              ),
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
              filled: true,
              fillColor: kcolor3,
            ),
            controller: firstnamecontroller,
            onSubmitted: (_) => {
              _submitData(),
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Date Of Birth',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Date Of Birth',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(width: 1, color: kDefaultcolor),
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
                filled: true,
                fillColor: kcolor3,
              ),
              controller: dateofbirthcontroller,
              onSubmitted: (_) => {
                    _submitData(),
                  }),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Email',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(width: 1, color: kDefaultcolor),
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
                filled: true,
                fillColor: kcolor3,
              ),
              controller: emailcontroller,
              onSubmitted: (_) => {
                    _submitData(),
                  }),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Phone number',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold),
          ),
          TextField(
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Phone number',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(width: 1, color: kDefaultcolor),
                ),
                border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.white.withOpacity(1)),
                filled: true,
                fillColor: kcolor3,
              ),
              controller: phonenumbercontroller,
              onSubmitted: (_) => {
                    _submitData(),
                  }),
          Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom))
        ],
      ),
    );
  }

  Widget _savePatients(Size size) {
    return Stack(children: <Widget>[
      Container(
        width: size.width,
        height: 80,
        color: kcolor3,
      ),
      SizedBox(
          height: 58,
          width: size.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: kcolor2),
            onPressed: (() {
              _submitData();
              Navigator.pop(context);
            }),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Save Patient',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          )),
    ]);
  }
}
