class FirebaseCollections {
  String get grandPrixesBasicInfo => 'GrandPrixesBasicInfo';
  String get driversPersonalData => 'DriversPersonalData';
  String get teamsBasicInfo => 'TeamsBasicInfo';
  FirebaseSeasonCollections get season => const FirebaseSeasonCollections();
  FirebaseUsersCollections get users => const FirebaseUsersCollections();
}

class FirebaseSeasonCollections {
  const FirebaseSeasonCollections();

  String get main => 'Season';
  String get grandPrixes => 'GrandPrixes';
  String get drivers => 'Drivers';
  String get teams => 'Teams';
  String get grandPrixesResults => 'GrandPrixesResults';
}

class FirebaseUsersCollections {
  const FirebaseUsersCollections();

  String get main => 'Users';
  String get stats => 'Stats';
  String get grandPrixesBets => 'GrandPrixBets';
  String get grandPrixesBetPoints => 'GrandPrixBetPoints';
}
