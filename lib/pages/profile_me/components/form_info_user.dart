import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  String userName = '';
  String email = '';
  String description = '';

  void UpdateInfoUser(
    String idUser,
    String firstName,
    String lastName,
    String userName,
    String email,
    String description,
  ) async {
    User? userInfo = await ApiUserServices().ApiUpdateInfoUser(
        idUser, firstName, lastName, userName, email, description);
    // context.read<UserInfo>().increment(userInfo);
    print("================================================================");
    print(context.read<UserInfo>().userInfo);
    print("================================================================");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.dBlackColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                      child: Text('Add user information',
                          style: PrimaryFont.medium(24))),
                ),
                //First name
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.badge,
                    ),
                    hintText: 'Enter your first name',
                    labelText: 'First name',
                  ),
                  onChanged: ((value) {
                    setState(() {
                      firstName = value;
                    });
                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                //Last name
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.badge,
                    ),
                    hintText: 'Enter your last name',
                    labelText: 'Last name',
                  ),
                  onChanged: ((value) {
                    setState(() {
                      lastName = value;
                    });
                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                //User Name
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your user name',
                    labelText: 'User name',
                  ),
                  onChanged: ((value) {
                    setState(() {
                      userName = value;
                    });
                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                //Email
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.email,
                    ),
                    hintText: 'Enter your email',
                    labelText: 'Email',
                  ),
                  onChanged: ((value) {
                    setState(() {
                      email = value;
                    });
                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                //Description
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.description,
                    ),
                    hintText: 'Enter your description',
                    labelText: 'Description',
                  ),
                  onChanged: ((value) {
                    setState(() {
                      description = value;
                    });
                  }),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),

                // ignore: unnecessary_new
                new Container(
                    padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                    // ignore: unnecessary_new
                    child: new RaisedButton(
                      color: AppColors.dPrimaryColor,
                      child: const Text('Submit'),
                      onPressed: () {
                        // It returns true if the form is valid, otherwise returns false
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a Snackbar.
                          UpdateInfoUser(
                              context.read<UserInfo>().userInfo!.id.toString(),
                              // "633139abf4b5cb5cb2ca141a",
                              firstName,
                              lastName,
                              userName,
                              email,
                              description);
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
