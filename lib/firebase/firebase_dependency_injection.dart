import 'package:betgrid_shared/betgrid_shared.dart';
import 'package:betgrid_shared/firebase/firebase_collections.dart';
import 'package:get_it/get_it.dart';

import 'firebase_collections_references.dart';

class FirebaseDependencyInjection {
  static void configure(GetIt getIt) {
    getIt.registerFactory(
      () => FirebaseCollections(),
    );
    getIt.registerFactory(
      () => FirebaseCollectionsReferences(
        getIt<FirebaseCollections>(),
      ),
    );
    getIt.registerFactory(
      () => FirebaseDriverPersonalDataService(
        getIt<FirebaseCollectionsReferences>(),
      ),
    );
  }
}
