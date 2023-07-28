//Based on step
/*
1 Add the following to your "gradle.properties" file
android.useAndroidX=true
android.enableJetifier=true

2 Make sure you set the compileSdkVersion in your "android/app/build.gradle" file to 33
android {
  compileSdkVersion 33
  ...
}

var status = await Permission.camera.status;
if (status.isDenied) {
  // We didn't ask for permission yet or the permission has been denied before but not permanently.
}

// You can can also directly ask the permission about its status.
if (await Permission.location.isRestricted) {
  // The OS restricts access, for example because of parental controls.
}

if (await Permission.contacts.request().isGranted) {
  // Either the permission was already granted before or the user just granted it.
}

// You can request multiple permissions at once.
Map<Permission, PermissionStatus> statuses = await [
  Permission.location,
  Permission.storage,
].request();
print(statuses[Permission.location]);

if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
  // Use location.
}

if (await Permission.speech.isPermanentlyDenied) {
  // The user opted to never again see the permission request dialog for this
  // app. The only way to change the permission's status now is to let the
  // user manually enable it in the system settings.
  openAppSettings();
}

bool isShown = await Permission.contacts.shouldShowRequestRationale;
*/