import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_collections.dart';
import 'model/driver_personal_data_dto.dart';
import 'model/grand_prix_basic_info_dto.dart';
import 'model/season_driver_dto.dart';
import 'model/team_basic_info_dto.dart';

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

  CollectionReference<TeamBasicInfoDto> teamsBasicInfo() {
    return FirebaseFirestore.instance
        .collection(_firebaseCollections.teamsBasicInfo)
        .withConverter<TeamBasicInfoDto>(
          fromFirestore: (snapshot, _) {
            final data = snapshot.data();
            if (data == null) {
              throw 'TeamBasicInfo document does not exist';
            }
            return TeamBasicInfoDto.fromFirestore(
              id: snapshot.id,
              json: data,
            );
          },
          toFirestore: (TeamBasicInfoDto dto, _) => dto.toFirestore(),
        );
  }

  CollectionReference<SeasonDriverDto> seasonDrivers(int season) {
    return FirebaseFirestore.instance
        .collection(_firebaseCollections.season.main)
        .doc(season.toString())
        .collection(_firebaseCollections.season.drivers)
        .withConverter<SeasonDriverDto>(
          fromFirestore: (snapshot, _) {
            final data = snapshot.data();
            if (data == null) {
              throw 'SeasonDriver document does not exist';
            }
            return SeasonDriverDto.fromFirestore(
              id: snapshot.id,
              season: season,
              json: data,
            );
          },
          toFirestore: (SeasonDriverDto dto, _) => dto.toFirestore(),
        );
  }
}
