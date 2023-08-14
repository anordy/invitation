class ParticipantModel {
  final String id;
  final String name;
  final String date;
  final String icon;

  ParticipantModel(
      {required this.date,
    
      required this.id,
      required this.name,
      required this.icon});
}

List<ParticipantModel> participantModels = [
  ParticipantModel(
      id: "1",
      name: 'Anord John',
      icon: 'AJ',
      date: '10:10 PM'),
    
  ParticipantModel(
      id: "2",
      name: 'Gerald Njau',
      icon: 'GN',
      date: '10:15 PM'),
   
  ParticipantModel(
      id: "3",
      name: 'Lucksford Isack',
      icon: 'LI',
      date: '10:25 PM',
  ),

  ParticipantModel(
      id: "4",
      name: 'Matungwa Kaana',
      icon: 'MK',
      date: '10:28 PM',
  ),

  ParticipantModel(
      id: "3",
      name: 'Caicedo Chelsea',
      icon: 'CC',
      date: '10:30 PM',
  )
  
];
