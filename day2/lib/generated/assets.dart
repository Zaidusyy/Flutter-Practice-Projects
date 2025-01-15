class Assets {
  // Private constructor
  Assets._();

  // Singleton instance
  static final Assets instance = Assets._();

  // Asset paths
  static const String iconsConsultations = 'assets/icons/Consultations.png';
  static const String iconsLaboratories = 'assets/icons/Laboratories.png';
  static const String iconsMedicines = 'assets/icons/Medicines.png';
  static const String imagesAbbott = 'assets/images/abbott.png';
  static const String imagesDoctor1 = 'assets/images/Doctor1.jpg';
  static const String imagesDoctor2 = 'assets/images/Doctor2.jpg';
  static const String imagesPerson1 = 'assets/images/person1.jpg';
  static const String imagesPerson2 = 'assets/images/person2.jpg';
  static const String imagesProfile = 'assets/images/profile.jpeg';
  static const String imagesSynevologo = 'assets/images/synevologo.png';

  // Global list of doctors
  final List<Map<String, dynamic>> doctors = [
    {
      'id': '1',
      'name': 'Dr. John Doe',
      'specialty': 'Cardiologist',
      'imageUrl': imagesDoctor1,
      'rating': 4.7,
      'description': 'Expert in cardiac care and heart surgery with 10 years of experience.',
      'qualifications': ['MBBS', 'MD (Cardiology)'],
      'contact': '+91 9876543210',
      'location': 'Apollo Hospital, Mumbai',
      'clinicName': 'HeartCare Clinic',
    },
    {
      'id': '2',
      'name': 'Dr. Jane Smith',
      'specialty': 'Dermatologist',
      'imageUrl': imagesDoctor2,
      'rating': 4.5,
      'description': 'Specialist in skin treatments and cosmetic procedures.',
      'qualifications': ['MBBS', 'DDVL'],
      'contact': '+91 9123456789',
      'location': 'Fortis Hospital, Delhi',
      'clinicName': 'Skin Solutions Clinic',
    },
    {
      'id': '3',
      'name': 'Dr. Robert Brown',
      'specialty': 'Pediatrician',
      'imageUrl': imagesDoctor1,
      'rating': 4.8,
      'description': 'Caring and experienced in treating children of all ages.',
      'qualifications': ['MBBS', 'MD (Pediatrics)'],
      'contact': '+91 9988776655',
      'location': 'Rainbow Children’s Hospital, Bangalore',
      'clinicName': 'KidsCare Clinic',
    },
    {
      'id': '4',
      'name': 'Dr. Emily Wilson',
      'specialty': 'Orthopedic Surgeon',
      'imageUrl': imagesDoctor2,
      'rating': 4.6,
      'description': 'Specialist in bone and joint surgeries with extensive experience.',
      'qualifications': ['MBBS', 'MS (Orthopedics)'],
      'contact': '+91 8844221100',
      'location': 'Manipal Hospital, Hyderabad',
      'clinicName': 'Bone & Joint Clinic',
    },
  ];
}
