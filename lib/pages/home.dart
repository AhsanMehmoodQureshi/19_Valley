
import 'package:flutter/material.dart';
import 'package:nineteen_valley/constants/footer.dart';
import 'package:nineteen_valley/constants/image_path.dart';
import 'package:nineteen_valley/constants/string_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';
import '../constants/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(child: Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                 // height: screenSize.height * 0.45,
                  width: screenSize.width,
                  child: Image.asset(
                    ImagePath.homepageBg,
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned(
                //   top: 0,
                //     left: 0,
                //     right: 0,
                //     child: PreferredSize(
                //   preferredSize: Size(screenSize.width, 1000),
                //   child: Padding(
                //     padding: const EdgeInsets.all(20),
                //     child: Row(
                //       children: [
                //         Text('19 Valley',style: Theme.of(context).textTheme.headlineLarge,),
                //         Expanded(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               SizedBox(width: screenSize.width / 20),
                //               InkWell(
                //                 onTap: (){},
                //                 onHover: (value) {
                //                   setState(() {
                //                     _isHovering[0] = value;
                //                   });
                //                 },
                //                 child: Column(
                //                   mainAxisSize: MainAxisSize.min,
                //                   children: [
                //                     Text(
                //                       'Home',
                //                       style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                //                         color: _isHovering[0]
                //                             ? Colors.blue.shade200
                //                             : Colors.white,
                //                       ),
                //                     ),
                //                     SizedBox(height: 5),
                //                     // For showing an underline on hover
                //                     Visibility(
                //                       maintainAnimation: true,
                //                       maintainState: true,
                //                       maintainSize: true,
                //                       visible: _isHovering[0],
                //                       child: Container(
                //                         height: 2,
                //                         width: 20,
                //                         color: Colors.white,
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //               SizedBox(width: screenSize.width / 20),
                //               InkWell(
                //                 onTap: (){
                //                   Navigator.pushNamed(context, '/about_us');
                //                 },
                //                 onHover: (value) {
                //                   setState(() {
                //                     _isHovering[1] = value;
                //                   });
                //                 },
                //                 child: Column(
                //                   mainAxisSize: MainAxisSize.min,
                //                   children: [
                //                     Text(
                //                       'About Us',
                //                       style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                //                         color: _isHovering[1]
                //                             ? Colors.blue.shade200
                //                             : Colors.white,
                //                       ),
                //                     ),
                //                     SizedBox(height: 5),
                //                     // For showing an underline on hover
                //                     Visibility(
                //                       maintainAnimation: true,
                //                       maintainState: true,
                //                       maintainSize: true,
                //                       visible: _isHovering[1],
                //                       child: Container(
                //                         height: 2,
                //                         width: 20,
                //                         color: Colors.white,
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //               SizedBox(width: screenSize.width / 20),
                //               InkWell(
                //                 onTap: (){
                //                   Navigator.pushNamed(context, '/contact_us');
                //                 },
                //                 onHover: (value) {
                //                   setState(() {
                //                     _isHovering[2] = value;
                //                   });
                //                 },
                //                 child: Column(
                //                   mainAxisSize: MainAxisSize.min,
                //                   children: [
                //                     Text(
                //                       'Contact Us',
                //                       style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                //                         color: _isHovering[3]
                //                             ? Colors.blue.shade200
                //                             : Colors.white,
                //                       ),
                //                     ),
                //                     SizedBox(height: 5),
                //                     // For showing an underline on hover
                //                     Visibility(
                //                       maintainAnimation: true,
                //                       maintainState: true,
                //                       maintainSize: true,
                //                       visible: _isHovering[2],
                //                       child: Container(
                //                         height: 2,
                //                         width: 20,
                //                         color: Colors.white,
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // )),
                Header.header(context, screenSize),
                Positioned(child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('19 valley'.toUpperCase(),textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineLarge,),
                      const SizedBox(height: 20,),
                      Text('19 Valley situated in the heart of Islamabad is a definition of'
                          ' luxury and serenity.\n When it comes to finding the perfect family-friendly'
                          ' neighborhood a lot of things are to be\n considered, from schools to'
                          ' hospitals to other facilities that are required.',textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                )),
              ],
            ),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LayoutBuilder(builder: (context,BoxConstraints constraints){
                if(constraints.maxWidth<1000){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      welcomeText(),
                      const SizedBox(height: 15,),
                      welcomeImg(),
                    ],
                  );
                }
                else{
                 return Row(
                    children: [
                      Expanded(child: welcomeImg()),
                      const SizedBox(width: 20,),
                      Expanded(child: welcomeText())
                    ],
                );
                }
              })),
            const SizedBox(height: 50,),
            Container(
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                image: const DecorationImage(image: AssetImage(ImagePath.agentImg),fit: BoxFit.cover)
              ),
              child: LayoutBuilder(builder: (context,BoxConstraints constraints){
                if(constraints.maxWidth<1000){
                  return Column(
                   // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ceoIntro(),
                      const SizedBox(height: 15,),
                      ceoImage(),
                      const SizedBox(height: 15,),
                      ceoName(),
                      const SizedBox(height: 15,),
                      ceoContact(),
                      const SizedBox(height: 15,),
                    ],
                  );
                }
                else{
                  return Column(
                    children: [
                      ceoIntro(),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          Expanded(child: ceoName()),
                          SizedBox(width: screenSize.width / 20),
                          Expanded(child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child:
                              ceoImage()),
                              const SizedBox(width: 15,),
                              Expanded(child: ceoContact())
                            ],
                          )),
                        ],
                      )
                    ],
                  );
                }
              }),
            ),
            const SizedBox(height: 50,),
            /// FOOTER
            Footer.footer(context, screenSize)
/*
            Container(
              padding: const EdgeInsets.all(50.0),
              color: Colors.black.withOpacity(0.9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2,
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('19 Valley'.toUpperCase(),style: Theme.of(context).textTheme.headlineLarge,),
                          const SizedBox(height: 30,),
                          Text(AppString.footerMsg,style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.white70
                          ),)
                        ],
                      )),
                      SizedBox(width: screenSize.width / 15),
                      Expanded(flex: 1,child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Info',style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w500),),
                          const SizedBox(height: 30,),
                          TextButton(onPressed: (){}, style: TextButton.styleFrom(
                            foregroundColor: Colors.white70
                          ),child: Text('Home',style: TextStyle(),)),
                          const SizedBox(height: 15,),
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, '/about_us');
                          }, style: TextButton.styleFrom(
                              foregroundColor: Colors.white70
                          ),child: Text('About Us',style: TextStyle(),)),
                          const SizedBox(height: 15,),
                          TextButton(onPressed: (){}, style: TextButton.styleFrom(
                              foregroundColor: Colors.white70
                          ),child: Text('Contact Us',style: TextStyle(),)),                        ],
                      ))
                    ],
                  )),
                  SizedBox(width: screenSize.width / 20),
                  Expanded(child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact Detail',style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w500),),
                              const SizedBox(height: 30,),
                              InkWell(
                                onTap: (){},
                                child:  Text('19valley@gmail.com',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70,
                                    fontSize: 12.sp
                                ),),
                              ),
                              SizedBox(height: 5,),
                              Divider(color: Colors.white70,),
                              SizedBox(height: 5,),
                              Text('Address: PO Box 16122 Collins Street West Victoria 8007 Australia',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white70,
                                  fontSize: 12.sp
                              ),),
                              SizedBox(height: 5,),
                              Divider(color: Colors.white70,),
                              SizedBox(height: 5,),
                              Text('+92 300 1234567',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white70,
                                  fontSize: 12.sp
                              ),),
                            ],
                          )),
                      SizedBox(width: screenSize.width / 15),
                      Expanded(flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Social',style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w500),),
                              const SizedBox(height: 30,),
                              InkWell(
                                onTap: (){},
                                child:  Text('Facebook',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70,
                                    fontSize: 12.sp
                                ),),
                              ),
                              const SizedBox(height: 5,),
                              const Divider(color: Colors.white70,),
                              const SizedBox(height: 5,),
                              InkWell(
                                onTap: (){},
                                child:  Text('Twitter',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70,
                                    fontSize: 12.sp
                                ),),
                              ),
                              const SizedBox(height: 5,),
                              const Divider(color: Colors.white70,),
                              const SizedBox(height: 5,),
                              InkWell(
                                onTap: (){},
                                child:  Text('Pinterest',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70,
                                    fontSize: 12.sp
                                ),),
                              ),
                              const SizedBox(height: 5,),
                              const Divider(color: Colors.white70,),
                              const SizedBox(height: 5,),
                              InkWell(
                                onTap: (){},
                                child:  Text('Instagram',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70,
                                    fontSize: 12.sp
                                ),),
                              ),
                            ],
                          )),
                    ],
                  )),
                ],
              ),
            )
*/
          ],
        ),
      ),
    ));
  }
  Widget welcomeImg(){
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 5,color: appFirstCol)
        ),
        child: Image.asset(ImagePath.homeImage,fit: BoxFit.cover,));
  }
  Widget welcomeText(){
    return Column(
      children: [
        Text('AWARDS WINNING REAL ESTATE COMPANY',textAlign: TextAlign.center,style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.bold),),
        SizedBox(height: 15,),
        Text('Welcome to 19 valley '.toUpperCase(),textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayLarge,),
        SizedBox(height: 15,),
        Text(AppString.welcomeMsg,textAlign: TextAlign.center,style: Theme.of(context).textTheme.displaySmall,),
      ],
    );
  }
  Widget ceoIntro(){
    return  Text(AppString.ceoIntro.toUpperCase(),style: Theme.of(context).textTheme.headlineLarge?.copyWith(
        color: Colors.white70
    ),);
  }
  Widget ceoName(){
    return Column(
      children: [
        Text(AppString.ceoName.toUpperCase(),style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Colors.white70
        ),),
        const SizedBox(height: 15,),
        Text(AppString.ceoMsg.toUpperCase(),style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white70,
            fontSize: 12.sp
        ),),
      ],
    );
  }
  Widget ceoImage(){
    return
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: 5,color: appFirstCol)
          ),
          child: Image.asset(ImagePath.agent,fit: BoxFit.cover,));
  }
  Widget ceoContact(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        supportDetail(const Icon(Icons.mail,color: Colors.white70,), '19valley@gmail.com'),
        supportDetail(const Icon(Icons.phone,color: Colors.white70,), '0300-1234567'),
        supportDetail(const Icon(Icons.facebook,color: Colors.white70,), 'facebook.com'),
      ],
    );
  }
  Widget supportDetail(Widget icon,String text){
    return Padding(padding: const EdgeInsets.only(top: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black45
          ),
          child: const Icon(Icons.mail,color: Colors.white70,),
        ),
        const SizedBox(width: 15,),
        Text(text,style: Theme.of(context).textTheme.displayMedium,)
      ],
    ),);

  }
}
