import 'package:flutter/material.dart';
import 'package:named_routes/models/person_model.dart';

class ProfilePreview extends StatefulWidget {
  @override
  _ProfilePreviewState createState() => _ProfilePreviewState();
}

class _ProfilePreviewState extends State<ProfilePreview> {
  Person person;

  @override
  void initState() {
    super.initState();
    person = Person(
        name: 'John Doe', email: 'jhn.doe@example.com', phone: '1234567899');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person_pin,
              size: 48.0,
              color: Color(0xffa2231d),
            ),
            SizedBox(
              height: 24.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.person_outline),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(person.name),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.alternate_email),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(person.email),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.phone),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(person.phone.toString()),
                    ],
                  ),
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                _editProfile();
              },
              color: Color(0xffa2231d),
              child: Text(
                'Editar Perfil',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _editProfile() async {
    final object =
        await Navigator.pushNamed(context, '/edit', arguments: person.name);
    if (object != null) {
      setState(() {
        person = object;
      });
    }
  }
}
