import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormAddInfoUser extends StatefulWidget {
  const FormAddInfoUser({Key? key}) : super(key: key);

  @override
  FormAddInfoUserState createState() {
    return FormAddInfoUserState();
  }
}

class FormAddInfoUserState extends State<FormAddInfoUser> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  String firstName = '';
  String lastName = '';
  String userName = '';
  String email = '';
  String description = '';

  void updateInfoUser(
    String idUser,
    String firstName,
    String lastName,
    String userName,
    String email,
    String description,
  ) async {
    User? userInfo = null;
    setState(() {
      _loading = true;
    });
    userInfo = await ApiUserServices().ApiUpdateInfoUser(
        idUser, firstName, lastName, userName, email, description);
    setState(() {
      _loading = false;
    });
    // ignore: use_build_context_synchronously
    context.read<UserInfo>().GetUserInfoProvider(null, userInfo);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
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
          child: Stack(alignment: Alignment.center, children: [
            Form(
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
                        color: _loading
                            ? AppColors.dGreyLightColor
                            : AppColors.dPrimaryColor,
                        child: const Text('Submit'),
                        onPressed: () {
                          // user();
                          if (_formKey.currentState!.validate()) {
                            updateInfoUser(
                                context
                                    .read<UserInfo>()
                                    .userInfo!
                                    .id
                                    .toString(),
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
            _loading ? const LoadingCenter() : const SizedBox.shrink(),
          ]),
        ),
      ),
    );
  }
}
