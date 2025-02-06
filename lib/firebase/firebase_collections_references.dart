import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import 'firebase_collections.dart';
import 'model/driver_personal_data_dto.dart';

@injectable
class FirebaseCollectionsReferences {
  final FirebaseCollections _firebaseCollections;

  const FirebaseCollectionsReferences(this._firebaseCollections);

  CollectionReference<DriverPersonalDataDto> driversPersonalData() {
    return FirebaseFirestore.instance
        .collection(_firebaseCollections.driversPersonalData)
        .withConverter<DriverPersonalDataDto>(
          fromFirestore: (snapshot, _) {
            final data = snapshot.data();
            if (data == null) throw 'DriverPersonalData document data is null';
            return DriverPersonalDataDto.fromFirestore(
              id: snapshot.id,
              json: data,
            );
          },
          toFirestore: (DriverPersonalDataDto dto, _) => dto.toFirestore(),
        );
  }
}
