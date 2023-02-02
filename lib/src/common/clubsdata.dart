import '../model/Course.dart';
import '../model/Evaluation.dart';
import '../model/User.dart';
import '../model/Comment.dart';
import '../model/Job.dart';
import '../model/Club.dart';
import '../model/EventCalendar.dart';
import '../model/EventTimelime.dart';
import '../model/News.dart';
import '../model/Event.dart';



List<Club> createlistclubs() {
  List<Club> clublist = [];
  Club clubs = Club(
      name: "Eureclimb",
      nameShort: "EC",
      description:"Here, you will find all you need to know about activities related to climbing. If you want to do indoor or outdoor, bouldering or lead, just ask/suggest here and let's plan this ",
      presidenteName: "Zachari Thiry",
      );

  clublist.add(clubs);

  clubs = Club(
      name: "BasketBall",
      nameShort: "BB",
      description:"Join this club if you love basketball",
      presidenteName: "Dario Ferrero",
      );

  clublist.add(clubs);

  clubs = Club(
      name: "EureHik",
      nameShort: "EH",
      description:"Join this club if you love hiking",
      presidenteName: "Baptiste Masson",
      );

  clublist.add(clubs);

   clubs = Club(
      name: "Skiing",
      nameShort: "SK",
      description:"Join this club if you love skiing",
      presidenteName: "Zachari Thiry",
      );

  clublist.add(clubs); 

   clubs = Club(
      name: "EURObOARD Club",
      nameShort: "EB",
      description:"Join this club if you love board games",
      presidenteName: "Emerson Cardoso",
      );

  clublist.add(clubs); 

   clubs = Club(
      name: "EureSound",
      nameShort: "EB",
      description:"Join this club if you want to learn playing music",
      presidenteName: "Marco Klepatzky",
      );

  clublist.add(clubs); 

   clubs = Club(
      name: "Beach Volley",
      nameShort: "BV",
      description:"Join this club if you want to play beach volleyball",
      presidenteName: "Anis Amor",
      );

  clublist.add(clubs); 

   clubs = Club(
      name: "Eureswim",
      nameShort: "ESM",
      description:"Join this club if you want to learn swimming",
      presidenteName: "Julie Schult",
      );

  clublist.add(clubs); 

  return clublist;
 }
