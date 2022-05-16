import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_booking_app/user_authentication/core/api/firebase_user_info_api.dart';
import 'package:movie_booking_app/user_authentication/core/models/user_model.dart';

void main() {
  group('FirestoreService', () {
    FakeFirebaseFirestore? fakeFirebaseFirestore;
    UserModel userModel = UserModel(location: 'coimbatore');
    Map<String, dynamic> data = userModel.toJson();

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
    });
    group('Document Operations', () {
      // test(
      //     'delete Document From Collection deletes a document from a given collection',
      //     () async {
      //   final FirestoreService firestoreService =
      //       FirestoreService(firestore: fakeFirebaseFirestore!);
      //   const String collectionPath = 'collectionPath';

      //   final CollectionReference<Map<String, dynamic>> collectionReference =
      //       fakeFirebaseFirestore!.collection(collectionPath);

      //   final DocumentReference<Map<String, dynamic>> documentReference =
      //       await collectionReference.add(data);

      //   final String documentPath = documentReference.path;

      //   await firestoreService.deleteDocumentFromCollection(
      //       collectionPath: collectionPath, documentPath: documentPath);

      //   final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
      //       await collectionReference.doc(documentPath).get();

      //   expect(documentSnapshot.exists, false);
      // });

      test('get From Document gets data from a given document', () async {
        final FirebaseUserInfoApi firestoreService =
            FirebaseUserInfoApi(db: fakeFirebaseFirestore!);

        const String collectionPath = 'Users';
        const String documentPath = 'hmvJ9SbqKganjPi8lDyR4QHR4Tv2';

        final DocumentReference<Map<String, dynamic>> documentReference =
            fakeFirebaseFirestore!.collection(collectionPath).doc(documentPath);

        await documentReference.set(data);

        final DocumentSnapshot<Map<String, dynamic>> expectedDocumentSnapshot =
            await documentReference.get();

        final DocumentSnapshot<Map<String, dynamic>> actualDocumentSnapshot =
            await firestoreService.getUserInfoFromDB(id: documentPath);

        final Map<String, dynamic>? expectedData =
            expectedDocumentSnapshot.data();

        final Map<String, dynamic>? actualData = actualDocumentSnapshot.data();

        expect(actualData, expectedData);
      });

      test('set Data On Document sets data on a given document', () async {
        final FirebaseUserInfoApi firestoreService =
            FirebaseUserInfoApi(db: fakeFirebaseFirestore!);

        const String collectionPath = 'Users';
        const String documentPath = 'hmvJ9SbqKganjPi8lDyR4QHR4Tv2';

        await firestoreService.saveUserInfo(
          userModel: UserModel(location: 'coimbatore'),
          id: documentPath,
        );

        final DocumentReference<Map<String, dynamic>> documentReference =
            fakeFirebaseFirestore!.collection(collectionPath).doc(documentPath);

        final DocumentSnapshot<Map<String, dynamic>> actualDocumentSnapshot =
            await documentReference.get();
        final Map<String, dynamic>? actualData = actualDocumentSnapshot.data();

        Map<String, dynamic> expectedData = data;

        expect(actualData, expectedData);
      });

      test('updateDataOnDocument updates a given document\'s data', () async {
        final FirebaseUserInfoApi firestoreService =
            FirebaseUserInfoApi(db: fakeFirebaseFirestore!);

        const String collectionPath = 'Users';
        const String documentPath = 'hmvJ9SbqKganjPi8lDyR4QHR4Tv2';

        final DocumentReference<Map<String, dynamic>> documentReference =
            fakeFirebaseFirestore!.collection(collectionPath).doc(documentPath);

        await documentReference.set(data);
        UserModel updateUserModel = UserModel(location: "Bangalore");
        final Map<String, dynamic> dataUpdate = updateUserModel.toJson();

        await firestoreService.updateLocation(
            userModel: updateUserModel, id: documentPath);

        final DocumentSnapshot<Map<String, dynamic>> actualDocumentSnapshot =
            await documentReference.get();

        final Map<String, dynamic>? actualData = actualDocumentSnapshot.data();

        final Map<String, dynamic> expectedData = dataUpdate;

        expect(actualData, expectedData);
      });
    });
  });
}
