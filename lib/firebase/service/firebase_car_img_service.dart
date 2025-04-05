import 'package:firebase_storage/firebase_storage.dart';

class FirebaseCarImgService {
  String _storagePath(int season) => 'Season/$season/Cars';

  Future<String?> fetchUrl({
    required int season,
    required String imgFileName,
  }) async {
    try {
      return await FirebaseStorage.instance
          .ref('${_storagePath(season)}/$imgFileName')
          .getDownloadURL();
    } on FirebaseException catch (e) {
      if (e.code == 'object-not-found') {
        return null;
      }

      rethrow;
    }
  }
}
