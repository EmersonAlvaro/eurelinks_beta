import '../model/BDE.dart';

BDE bde_members_function() {
  BDE bdeMembers = BDE(
      presidentName: "Robert Moller",
      vicePresidentName: "Lorenzo Pisanò",
      secretaryName: "Clara Leonet",
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

  return bdeMembers;
}
