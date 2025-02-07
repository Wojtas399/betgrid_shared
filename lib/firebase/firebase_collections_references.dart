import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_collections.dart';
import 'model/driver_personal_data_dto.dart';
import 'model/grand_prix_basic_info_dto.dart';

class FirebaseCollectionsReferences {
  final _firebaseCollections = FirebaseCollections();

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

  CollectionReference<GrandPrixBasicInfoDto> grandPrixesBasicInfo() {
    return FirebaseFirestore.instance
        .collection(_firebaseCollections.grandPrixesBasicInfo)
        .withConverter<GrandPrixBasicInfoDto>(
          fromFirestore: (snapshot, _) {
            final data = snapshot.data();
            if (data == null) {
              throw 'GrandPrixBasicInfo document does not exist';
            }
            return GrandPrixBasicInfoDto.fromFirestore(
              id: snapshot.id,
              json: data,
            );
          },
          toFirestore: (GrandPrixBasicInfoDto dto, _) => dto.toFirestore(),
        );
  }
}
