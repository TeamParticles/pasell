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

  test('picture should be uploaded successfully', () async{ 
     when(authController.uploadPicture(
            picture:userData['picture'] ))
        .thenAnswer(
      (_) async => UploadPicture(
        resp: false,
        msj: "picture is not uploaded successfully",
        picture: "profile.png",

     ),
    );
    UploadPicture response = await authController.uploadPicture(
        picture:userData['picture']);
    verify(authController.uploadPicture(
        picture:userData['picture'] ));
    expect(response.msj, "picture is not uploaded successfully");
    expect(response.resp, false);
    expect(response.picture, "profile.png");
   

  });




  tearDownAll(() {
    authController = null;
  });
}








