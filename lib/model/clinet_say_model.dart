List<ClinetSayModel> message = [
  ClinetSayModel(
    profile: 'assets/images/Mobile.png',
    clinetName: 'John Doe',
    testimonialText:
        'This company has done an amazing job helping me grow my business!',
  ),
  ClinetSayModel(
    profile: 'assets/images/Mobile.png',
    clinetName: 'Jane Smith',
    testimonialText: 'I highly recommend them. Their service is top-notch!',
  ),
  ClinetSayModel(
    profile: 'assets/images/Mobile.png',
    clinetName: 'John Doe',
    testimonialText:
        'This company has done an amazing job helping me grow my business!,\n This company has done an amazing job helping me grow my business!,\n This company has done an amazing job helping me grow my business!',
  ),
  ClinetSayModel(
    profile: 'assets/images/Mobile.png',
    clinetName: 'Jane Smith',
    testimonialText:
        'I highly recommend them. Their service is top-notch!,\n This company has done an amazing job helping me grow my business!,\n This company has done an amazing job helping me grow my business!',
  ),
  // Add more testimonials here...
];

class ClinetSayModel {
  final String profile;
  final String clinetName;
  final String testimonialText;

  ClinetSayModel({
    required this.profile,
    required this.clinetName,
    required this.testimonialText,
  });
}
