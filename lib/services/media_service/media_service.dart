import 'package:postbird/core/index.dart';

class MediaService extends IMediaService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> getImage({required bool fromGallery}) async {
    final XFile? image = await _picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera);

    final File? file = File(image!.path);
    return file;
  }
}
