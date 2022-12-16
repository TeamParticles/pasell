import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pasell/Controller/PersonalController.dart';
import 'package:pasell/Models/Response/PersonalInformationResponse.dart';
import 'package:pasell/Models/ResponseModels.dart';

import 'PersonalController_test.mocks.dart';



@GenerateMocks([PersonalController])
void main() {

  PersonalController personalController;
  var Information = {"firstName": "", "lastName": "", "phone": "", "address":"","reference":"",};
  var PersonalInformationData;

  setUpAll(() {
    
    personalController = MockPersonalController();

    Information  = {
      "firstName": "sushmita",
      "lastName": "sharma",
      "phone": "9800655975",
      "address":"kathmandu",
      "reference":"1",
    
    };

    PersonalInformationData = Information;
  });


  test('personal information should be successfully passed ', () async {
    when(personalController.getPersonalInformation(
            firstName: PersonalInformationData["firstName"],
            lastName: PersonalInformationData['lastName'],
            phone: PersonalInformationData['phone'],
            address:PersonalInformationData['address'],
            reference:PersonalInformationData['reference'],
           
            ))
        .thenAnswer(
      (_) async => PersonalInformationResponse(
        resp: true,
        msj: "getting personal information successfully",
      ),
    );
    PersonalInformationResponse response = await personalController.getPersonalInformation(
        firstName:PersonalInformationData["firstName"],
        lastName: PersonalInformationData['lastName'],
        phone: PersonalInformationData['phone'],
        address:PersonalInformationData['address'],
        reference:PersonalInformationData['reference'],

        );

    verify(personalController.getPersonalInformation(
        firstName:PersonalInformationData["firstName"],
        lastName: PersonalInformationData['lastName'],
        phone: PersonalInformationData['phone'],
        address:PersonalInformationData['address'],
        reference:PersonalInformationData['reference'],

        ));

    expect(response.msj, "getting personal information successfully");
    expect(response.resp, true);

  });


  test('personal information registration has been successfully passed ', () async {
    when(personalController.registerPersonalInformation(
            firstName: PersonalInformationData["firstName"],
            lastName: PersonalInformationData['lastName'],
            phone: PersonalInformationData['phone'],
            address:PersonalInformationData['address'],
            reference:PersonalInformationData['reference'],
           
            ))
        .thenAnswer(
      (_) async => ResponseModels(
        resp: true,
        msj: "personal information registration is added",
      ),
    );
    ResponseModels response = await personalController.registerPersonalInformation(
        firstName: PersonalInformationData["firstName"],
        lastName: PersonalInformationData['lastName'],
        phone: PersonalInformationData['phone'],    
        address:PersonalInformationData['address'],
        reference:PersonalInformationData['reference'],

        );

    verify(personalController.registerPersonalInformation(
        firstName: PersonalInformationData["firstName"],
        lastName: PersonalInformationData['lastName'],
        phone: PersonalInformationData['phone'],
        address:PersonalInformationData['address'],
        reference:PersonalInformationData['reference'],

        ));
    expect(response.msj, "personal information registration is added");
    expect(response.resp, true);

  });


  test('adding street address has been successfully passed ', () async {
    when(personalController.addStreetAddress(
            
            address:PersonalInformationData['address'],
            reference:PersonalInformationData['reference'],
           
            ))
        .thenAnswer(
      (_) async => ResponseModels(
        resp: true,
        msj: "street address is added",
      ),
    );
    ResponseModels response = await personalController.addStreetAddress(
        
        address:PersonalInformationData['address'],
        reference:PersonalInformationData['reference'],

        );

    verify(personalController.addStreetAddress(
        
        address:PersonalInformationData['address'],
        reference:PersonalInformationData['reference'],

        ));
    expect(response.msj, "street address is added");
    expect(response.resp, true);
  });

  tearDownAll(() {
    personalController = null;
  });

}















