import 'package:postbird/core/index.dart';

abstract class IMediaService {
  Future<File?> getImage({required bool fromGallery});
}
