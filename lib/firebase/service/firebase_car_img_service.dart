import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseCarImgService {
  String _storagePath(int season) => 'Season/$season/Cars';

  Future<String?> fetchUrl({
    required int season,
    required String imgFileName,
  }) async {
    return await _doesCarImgExists(season: season, imgFileName: imgFileName)
        ? await FirebaseStorage.instance
            .ref('${_storagePath(season)}/$imgFileName')
            .getDownloadURL()
        : null;
  }

  Future<bool> _doesCarImgExists({
    required int season,
    required String imgFileName,
  }) async {
    final allCarImgs =
        await FirebaseStorage.instance.ref(_storagePath(season)).listAll();

    return allCarImgs.items.firstWhereOrNull(
          (Reference reference) => reference.fullPath.contains(imgFileName),
        ) !=
        null;
  }
}
