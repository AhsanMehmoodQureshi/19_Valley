
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import '../constants/colors.dart';
import '../constants/footer.dart';
import '../constants/header.dart';
import '../constants/image_path.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final List _isHovering = [false, false, false, false];
  final  _formKey = GlobalKey<FormState>();

  final firstNameController=TextEditingController();
  final phoneNumberController=TextEditingController();
  final emailAddressController=TextEditingController();
  final messageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return  SafeArea(child: Scaffold(
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
                    ImagePath.aboutUs,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: double.infinity,
                      color: darkBlue.withOpacity(0.6),
                    )),
          Header.header(context, screenSize),
                Positioned(child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Contact Us'.toUpperCase(),textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineLarge,),
                      const SizedBox(height: 20,),
                      Text('Please feel free to get in touch with us if you have any questions or require further assistance.'.toUpperCase(),textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                ))
              ],
            ),
            const SizedBox(height: 50,),
            Text('Request for Contact',textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayLarge,),
            const SizedBox(height: 50,),
            LayoutBuilder(builder: (context, BoxConstraints constraints){
              if(constraints.maxWidth<1000){
                return Container(
                  padding: const EdgeInsets.all(15.0),
                  child: form(),
                );
              }
              else{
                return  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width*0.5,
              child:form());
              }
            }),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: LayoutBuilder(builder: (context,BoxConstraints constraints){
                if(constraints.maxWidth<1000){
                  return Column(
                    children: [
                      Row(
                        children: [
                          phone(),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          email(),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: [
                          address(),
                        ],
                      ),
                    ],
                  );
                }
                else{
                  return Row(
                    children: [
                      phone(),
                      const SizedBox(width: 15,),
                      email(),
                      const SizedBox(width: 15,),
                      address(),
                    ],
                  );
                }
              }),
            ),
            const SizedBox(height: 30,),
            Footer.footer(context, screenSize)
          ],
        ),
      ),
    ));
  }
  Widget form(){
    return  Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: firstNameController,
                validator: (val){
                  if(val==null || val.isEmpty){
                    return 'First Name is required.';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    )
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                controller: phoneNumberController,
                validator: (val){
                  if(val==null || val.isEmpty){
                    return 'Phone Number is required.';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Your Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    )
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                controller: emailAddressController,
                validator: (val){
                  if(val==null || val.isEmpty){
                    return 'Email is required.';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Your Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    )
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                maxLines: 6,
                controller: messageController,
                validator: (val){
                  if(val==null || val.isEmpty){
                    return 'Message is required.';
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Type Your Message ...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    )
                ),
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: appFirstCol,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.only(
                          top: 15,
                          bottom: 15
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      )
                  ),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      sendEmail();
                    }
                  }, child: const Text('Submit'))
            ],
          ));
  }
  Widget addressSetting(String data,Widget icon){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: appFirstCol.withOpacity(0.8),
          borderRadius: BorderRadius.circular(3)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding:  const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            color: appFirstCol,
            child:  icon,
          ),
          const SizedBox(width: 15,),
          Expanded(child: Text(data.toString(),style: Theme.of(context).textTheme.headlineSmall,))
        ],
      ),
    );
  }
  Widget phone(){
    return Expanded(child: addressSetting('+92 300-1234567',Icon(Icons.phone,size: 22.sp,color: Colors.white,)));
  }
  Widget email(){
    return
      Expanded(child: addressSetting('Email Address: 19valley@gmail.com',Icon(Icons.email,size: 22.sp,color: Colors.white,)));
  }
  Widget address(){
    return
      Expanded(child: addressSetting('Address: 19Valley',Icon(Icons.location_on,size: 22.sp,color: Colors.white,)));
  }

  Future<void> sendEmail() async {
    final smtpServer = SmtpServer('your_smtp_server',
        username: 'ahsanmehmoodqureshi123@gmail.com',
        password: '123bnm!@#\$%');

    final message = Message()
      ..from = const Address('ahsanmehmoodqureshi123@gmail.com')
      ..recipients.add('recipient@example.com')
      ..subject = 'Form Data Submission'
      ..text = '''
        First Name: ${firstNameController.text}
        Phone Number: ${phoneNumberController.text}
        Email Address: ${emailAddressController.text}
        Message: ${messageController.text}
      ''';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ${sendReport.toString()}');
    } catch (e) {
      print('Error sending email: $e');
    }
  }
  Future sendMail() async{
   const serviceId='service_53zsr2i';
   const templateId='template_ylgpqrz';
   const userId='';
    final url=Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response=http.post(url,
      headers: {'Content-Type':'applcation/json'},
      body: json.encode({
        'service_id':serviceId,
        'template_id':templateId,
        'user_id':userId,
        'template_params':{
          'name':firstNameController.text,
          'name':firstNameController.text,
          'name':firstNameController.text,
          'name':firstNameController.text,
        }
      })
    );
  }
  void submitForm() {
    String firstName = firstNameController.text;
    String phoneNumber = phoneNumberController.text;
    String emailAddress = emailAddressController.text;
    String message = messageController.text;

    String subject = "Form Submission";
    String body = "First Name: $firstName\n"
        "Phone Number: $phoneNumber\n"
        "Email Address: $emailAddress\n"
        "Message: $message";

    String mailtoLink = 'mailto:ahsanmehmoodqureshi123@gmail.com?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}';

    html.window.open(mailtoLink, '_blank');
  }

}
