

class OnboardingModel{
   String image;
  String title;
  String description;

      OnboardingModel({required this.title, required this.description,  required this.image});

}
List<OnboardingModel> onboardingModelList =[
  OnboardingModel(
   image:  "assets/image/p1.png",
    title:"Discover available rides tailored to your needs" ,
      description: "Choose from a variety of rides offered by nearby drivers Submit a request and start you journey hassle-free", ),
  OnboardingModel(title: "Enjoy a seamless ride-sharing experience", description:
  "Communicate with your drive rather you're preferred payment method your comfort and convenience are our priority ",
    image: "assets/image/p3.png"
  ),
  OnboardingModel(title: "JoyRide - Your hassle-free ride-sharing solution",
    description: "Get ride experience hassle-free transportation we have got everything you need to travel with lat's get started",
      image: "assets/image/p2.png",)
];
