import 'package:flutter/material.dart';
import 'package:named_routes/models/person_model.dart';

class EditProfile extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String personName = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person_pin,
                size: 48.0,
                color: Color(0xffa2231d),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Container(
                  width: 300.0,
                  child: Text(
                    'Hola $personName, edita tu información...',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        width: 300.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Nombre',
                            icon: Icon(Icons.person_outline),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por favor ingrese un valor';
                            }
                            return null;
                          },
                          controller: this.controllerName,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        width: 300.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Correo electrónico',
                            icon: Icon(Icons.alternate_email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por favor ingrese un valor';
                            }
                            return null;
                          },
                          controller: this.controllerEmail,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        width: 300.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Teléfono',
                            icon: Icon(Icons.phone),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Por favor ingrese un valor';
                            }
                            return null;
                          },
                          controller: this.controllerPhone,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Person person = Person(
                      name: this.controllerName.text,
                      email: this.controllerEmail.text,
                      phone: this.controllerPhone.text,
                    );
                    Navigator.pop(context, person);
                  }
                },
                color: Color(0xffa2231d),
                child: Text(
                  'Aceptar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
