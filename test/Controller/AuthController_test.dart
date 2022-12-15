import 'package:pasell/Controller/AuthController.dart';
import 'package:pasell/Models/AuthModel.dart';
import 'package:pasell/Models/ResponseModels.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pasell/Models/UpdateProfile.dart';
import 'package:pasell/Models/UploadPicture.dart';
import 'AuthController_test.mocks.dart';

@GenerateMocks([AuthController])
void main() {

  AuthController authController;
  var userData = {"user": "", "password": "", "email": "", "image":"","uidPerson":"", "picture":""};
  var authUserData;
  
  setUpAll(() {
    authController = MockAuthController();
    userData = {
      "user": "test3",
      "password": "Test@12345",
      "email": "test3@gmail.com",
      "image":"profile.png",
      "uidPerson":"1",
      "picture":"profile.png"
      

    };
    authUserData = Users(
      image:userData['image'],
      uidPerson:userData['uidPerson'],
      email: userData['email'],
      id: "1",
      profile: "profile.png",
      role: "User",
      picture:userData['picture'],
      users: userData['user'],

    
    );
  });


  test('Registering user when is successful', () async {
    when(authController.createUsers(
            user: userData["user"],
            email: userData['email'],
            password: userData['password']))
        .thenAnswer(
      (_) async => ResponseModels(
        resp: true,
        msj: "Registered Successfully",
      ),
    );
    ResponseModels response = await authController.createUsers(
        user: userData["user"],
        email: userData['email'],
        password: userData['password']);
    verify(authController.createUsers(
        user: userData["user"],
        email: userData['email'],
        password: userData['password']));
    expect(response.msj, "Registered Successfully");
    expect(response.resp, true);
  });

  test('Login user when is successful', () async {
    when(authController.login(
            email: userData['email'], password: userData['password']))
        .thenAnswer(
      (_) async => AuthModel(
        resp: true,
        msj: "Logged Successfully",
        token: "token",
        role: "User",
        users: authUserData,
      ),
    );
    AuthModel response = await authController.login(
        email: userData['email'], password: userData['password']);
    verify(authController.login(
        email: userData['email'], password: userData['password']));
    expect(response.msj, "Logged Successfully");
    expect(response.resp, true);
    expect(response.role, "User");
    expect(response.token, "token");
    expect(response.users, authUserData);
  });

  test('profile should be updated successfully', () async{ 
     when(authController.updatedImageProfile(
            image:userData['image'] , uidPerson:userData['uidPerson']))
        .thenAnswer(
      (_) async => UpdateProfile(
        resp: false,
        msj: "profile is not updated successfully",
        profile: "profile.png",

     ),
    );
    UpdateProfile response = await authController.updatedImageProfile(
        image:userData['image'] , uidPerson:userData['uidPerson'] );
    verify(authController.updatedImageProfile(
        image:userData['image'] , uidPerson:userData['uidPerson'] ));
    expect(response.msj, "profile is not updated successfully");
    expect(response.resp, false);
    expect(response.profile, "profile.png");
   

  });


 
  tearDownAll(() {
    authController = null;
  });
}








