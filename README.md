# upray-mobile

Mobile uPray flutter project - the rosary app.

# Instructions

To build the app make sure you are using right flutter version. I suggest using fvm.

run the following commands:

### clean

`fvm flutter pub clean`

### get packages

`fvm flutter pub get`

### generate files

`fvm dart run build_runner build --delete-conflicting-outputs`

### generate translations

`fvm dart run slang`

### run

`fvm flutter run -t main_<flavor>.dart`

where flavors are
`development`, `production` or `local`