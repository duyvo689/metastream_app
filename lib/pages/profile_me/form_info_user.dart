import 'package:app_metastream/components/components.dart';
import 'package:app_metastream/funtions/funtions.dart';
import 'package:app_metastream/models/models.dart';
import 'package:app_metastream/services/services.dart';
import 'package:app_metastream/values/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class FormAddInfoUser extends StatefulWidget {
  const FormAddInfoUser({Key? key}) : super(key: key);

  @override
  FormAddInfoUserState createState() {
    return FormAddInfoUserState();
  }
}

//category/avatar/user
class FormAddInfoUserState extends State<FormAddInfoUser> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  File? image;
  PickedFile? file;
  UserForm userForm = UserForm();

  Future pickImage() async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      file = await imagePicker.getImage(source: ImageSource.gallery);
      if (file == null) return;
      final imageTemp = File(file!.path);
      setState(() => file = file);
      setState(() => image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      file = await imagePicker.getImage(source: ImageSource.camera);
      if (file == null) return;

      final imageTemp = File(file!.path);
      setState(() => file = file);
      setState(() => image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future signUrl(String fileName, String path, String fileExtension,
      PickedFile file, File image) async {
    var response =
        await ApiUploadServices().getSignUrl(fileName, path, fileExtension);
    if (response != null && response.url != null) {
      await ApiUploadServices()
          .uploadImageAws(response.url.toString(), file, fileExtension);
    }

    return "https://metastream-static.s3.ap-southeast-1.amazonaws.com/category/avatar/user/${getFileName(image)}";
  }

  String getFileName(File image) {
    String fileName = image.path.split('/').last;
    return fileName;
  }

  String getFileType(File image) {
    List<String> imagePathArr = image.path.split(".");
    String fileType = 'image/' + imagePathArr[1];
    return fileType;
  }

  void updateInfoUser(
    String idUser,
    String avatarUrl,
  ) async {
    User? _userInfo = null;
    setState(() {
      _loading = true;
    });
    String _avatarUrl = avatarUrl;
    if (file != null) {
      _avatarUrl = await signUrl(
          getFileName(image as File),
          "category/avatar/user",
          getFileType(image as File),
          file as PickedFile,
          image as File);
    }
    _userInfo = await ApiUserServices().ApiUpdateInfoUser(
        idUser,
        userForm.firstName.toString(),
        userForm.lastName.toString(),
        userForm.userName.toString(),
        userForm.email.toString(),
        userForm.description.toString(),
        _avatarUrl);
    setState(() {
      _loading = false;
    });
    // ignore: use_build_context_synchronously
    context.read<UserInfo>().GetUserInfoProvider(null, _userInfo);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Future.delayed(const Duration(milliseconds: 1500))
        .then((value) => {Navigator.of(context).pop()});
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
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                        child: Text('Add user information',
                            style: PrimaryFont.medium(22))),
                  ),
                  const SizedBox(height: 20),
                  //Avatar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      image != null
                          ? ClipOval(
                              child: Image.file(
                                image!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Stack(alignment: Alignment.center, children: [
                              const CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.white,
                              ),
                              CircleAvatar(
                                radius: 48,
                                backgroundImage: CachedNetworkImageProvider(context
                                                .read<UserInfo>()
                                                .userInfo !=
                                            null &&
                                        context
                                                .read<UserInfo>()
                                                .userInfo!
                                                .avatar !=
                                            null
                                    ? context
                                        .read<UserInfo>()
                                        .userInfo!
                                        .avatar
                                        .toString()
                                    : 'https://miro.medium.com/max/720/1*W35QUSvGpcLuxPo3SRTH4w.png'),
                              ),
                            ]),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ButtonChooseImage(
                            icon: const Icon(
                              Icons.photo_camera_back_outlined,
                              size: 20,
                            ),
                            onPress: pickImage,
                            label: 'Album',
                          ),
                          _ButtonChooseImage(
                            icon: const Icon(
                              Icons.photo_camera,
                              size: 20,
                            ),
                            onPress: pickImageC,
                            label: 'Camera',
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // First name
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.badge,
                        color: AppColors.dPrimaryDarkColor,
                      ),
                      hintText: 'Enter your first name',
                      labelText: 'First name',
                      labelStyle: TextStyle(color: AppColors.dPrimaryDarkColor),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.dPrimaryDarkColor, width: 1)),
                    ),
                    initialValue: context.read<UserInfo>().userInfo != null &&
                            context.read<UserInfo>().userInfo!.firstName != null
                        ? context
                            .read<UserInfo>()
                            .userInfo!
                            .firstName
                            .toString()
                        : '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some first name';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      userForm.firstName = value.toString();
                    },
                  ),
                  //Last name
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.badge,
                            color: AppColors.dPrimaryDarkColor),
                        hintText: 'Enter your last name',
                        labelText: 'Last name',
                        labelStyle:
                            TextStyle(color: AppColors.dPrimaryDarkColor),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.dPrimaryDarkColor, width: 1))),
                    initialValue: context.read<UserInfo>().userInfo != null &&
                            context.read<UserInfo>().userInfo!.lastName != null
                        ? context.read<UserInfo>().userInfo!.lastName.toString()
                        : '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some last name';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      userForm.lastName = value.toString();
                    },
                  ),
                  //User Name
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person,
                            color: AppColors.dPrimaryDarkColor),
                        hintText: 'Enter your user name',
                        labelText: 'User name',
                        labelStyle:
                            TextStyle(color: AppColors.dPrimaryDarkColor),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.dPrimaryDarkColor, width: 1))),
                    initialValue: context.read<UserInfo>().userInfo != null &&
                            context.read<UserInfo>().userInfo!.userName != null
                        ? context.read<UserInfo>().userInfo!.userName.toString()
                        : '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some user name';
                      }
                      if (value.length < 3) {
                        return 'UserName must be more than 3 characters';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      userForm.userName = value.toString();
                    },
                  ),
                  //Email
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email,
                            color: AppColors.dPrimaryDarkColor),
                        hintText: 'Enter your email',
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(color: AppColors.dPrimaryDarkColor),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.dPrimaryDarkColor, width: 1))),
                    initialValue: context.read<UserInfo>().userInfo != null &&
                            context.read<UserInfo>().userInfo!.email != null
                        ? context.read<UserInfo>().userInfo!.email.toString()
                        : '',
                    validator: (value) {
                      // if (!isEmail(value.toString())) {
                      //   return 'Please enter a valid email';
                      // }
                      if (value!.isEmpty) {
                        return 'Please enter some email';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      userForm.email = value.toString();
                    },
                  ),
                  //Description
                  TextFormField(
                    decoration: const InputDecoration(
                        icon: Icon(Icons.description,
                            color: AppColors.dPrimaryDarkColor),
                        hintText: 'Enter your description',
                        labelText: 'Description',
                        labelStyle:
                            TextStyle(color: AppColors.dPrimaryDarkColor),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.dPrimaryDarkColor, width: 1))),
                    initialValue: context.read<UserInfo>().userInfo != null &&
                            context.read<UserInfo>().userInfo!.descriptions !=
                                null
                        ? context
                            .read<UserInfo>()
                            .userInfo!
                            .descriptions
                            .toString()
                        : '',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter some description';
                      }
                      if (value.length <= 10) {
                        return 'Description must be more than 10 characters';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      userForm.description = value.toString();
                    },
                  ),

                  // ignore: unnecessary_new
                  new Container(
                      padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                      // ignore: unnecessary_new
                      child: new RaisedButton(
                        color: _loading
                            ? AppColors.dGreyLightColor
                            : AppColors.dPrimaryDarkColor,
                        child: const Text('Submit'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            updateInfoUser(
                                context
                                    .read<UserInfo>()
                                    .userInfo!
                                    .id
                                    .toString(),
                                context.read<UserInfo>().userInfo!.avatar !=
                                        null
                                    ? context
                                        .read<UserInfo>()
                                        .userInfo!
                                        .avatar
                                        .toString()
                                    : 'https://miro.medium.com/max/720/1*W35QUSvGpcLuxPo3SRTH4w.png');
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

class _ButtonChooseImage extends StatelessWidget {
  _ButtonChooseImage(
      {Key? key,
      required this.icon,
      required this.onPress,
      required this.label})
      : super(key: key);
  final Icon icon;
  final String label;
  Function onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        onPress();
      },
      icon: icon,
      label: Text(label),
      style: ElevatedButton.styleFrom(
          primary: AppColors.dWhileColor,
          onPrimary: AppColors.dGreyDarkColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }
}
