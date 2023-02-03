import '../model/BDE.dart';


BDE bde_members_function(){
  BDE bdeMembers = BDE(
      presidentName: "Robert Moller",
      vicePresidentName: "BUzzinga",
      secretaryName: "Clara Leonet",
      description: "BUzzingaBUzzingaBUzzingaBUzzingaBUzzinga",
      logoPath: "assets/images/bde.jpg",
      address: '''
      BDE EURECOM
      Campus SophiaTech,
      450 Route des Chappes, 
      06410 Biot
      ''',
      contact: "+33(0)493008221",
      email: "bde@eurecom.fr"

  );
  return bdeMembers;
}

