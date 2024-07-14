// Import the library
import 'package:shorebird_code_push/shorebird_code_push.dart';

class CheckForeUpdates {
  CheckForeUpdates();

  // Create an instance of the ShorebirdCodePush class
  final shorebirdCodePush = ShorebirdCodePush();

  // function to make update of version code
  Future<void> makeUpdate() async {
    await shorebirdCodePush
        .currentPatchNumber()
        .then((value) => print('current patch number is $value'));
    // Check whether a patch is available to install.
    final isUpdateAvailable =
        await shorebirdCodePush.isNewPatchAvailableForDownload();

    if (isUpdateAvailable) {
      // Download the new patch if it's available.
      await shorebirdCodePush.downloadUpdateIfAvailable();
    }
  }
}
