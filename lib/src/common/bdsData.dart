import '../model/BDS.dart';

BDS bds_members_function() {
  BDS bdsMembers = BDS(
      presidentName: "Lorenzo Pisanò",
      vicePresidentName: "Lorenzo Pisanò",
      secretaryName: "Lucas Georget",
      description:
          "The student office or BDE is an association that animates the student life of its school or university. This office is made up of students elected by their classmates and who represent them to the administration.",
      logoPath: "assets/images/bde.jpg",
      address: '''
      BDE EURECOM
      Campus SophiaTech,
      450 Route des Chappes, 
      06410 Biot
      ''',
      contact: "+33(0)493008221",
      email: "bde@eurecom.fr");
  return bdsMembers;
}
