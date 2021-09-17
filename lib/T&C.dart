
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xspectre/JoinUs.dart';
import 'package:xspectre/help/Footer.dart';
import 'package:xspectre/help/appBar.dart';

import 'AddVideos.dart';
import 'Community.dart';
import 'Home.dart';
import 'Profile.dart';
import 'Squad.dart';
import 'Styles.dart';
import 'Videos.dart';
import 'help/IsPhone.dart';

class Terms extends StatefulWidget {
  static const String route = '/terms';
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      drawer: Container(
          width: MediaQuery.of(context).size.width * 0.5,//20.0,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child:SingleChildScrollView(
              child:Column(
                  children:<Widget>[
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                      onTap: () {
                        Navigator.of(context).pushNamed(Home.route);
                      },
                    ),
                    ListTile(
                        leading: Icon(Icons.face),
                        title: Text("Community"),
                        onTap: () {
                          Navigator.of(context).pushNamed(Community.route);
                        }),
                    ListTile(
                      leading: Icon(Icons.filter),
                      title: Text("Videos"),
                      onTap: () {
                        Navigator.of(context).pushNamed(VideoPage.route);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.people),
                      title: Text("Squad"),
                      onTap: () {
                        Navigator.of(context).pushNamed(Squad.route);
                      },
                    ),
                    ListTile(
                      title: Text("Join Us"),
                      leading: FaIcon(FontAwesomeIcons.headset),
                      onTap: () {
                        Navigator.of(context).pushNamed(JoinUs.route);
                      },
                    ),
                    Container(
                      color: Colors.grey[400],
                      child: ListTile(
                          leading:FaIcon(FontAwesomeIcons.scroll) ,
                          title: Text("T&C"),
                          onTap: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text("Add Videos"),
                      onTap: () {
                        Navigator.of(context).pushNamed(AddVideos.route);
                      },
                    ),
                    // ListTile(
                    //   leading: Icon(Icons.account_circle),
                    //   title: Text("Profile"),
                    //   onTap: () {
                    //     Navigator.of(context).pushNamed(Profile.route);
                    //   },
                    // ),
                  ]
              )
          )
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration:BoxDecoration(
          color:Colors.white,
          // image: DecorationImage(fit:BoxFit.cover,image: AssetImage("images/TermsBackground.webp"))
        ),
        child: SingleChildScrollView(
            child: Column(
               children: <Widget>[
                 appBar("T&C", context),
            SizedBox(height:30),
            Text("Terms And Conditions",style: TextStyle(
              color:Colors.amber,
              fontFamily: "Nimble",
              fontSize: 100,
            ),),
            SizedBox(height: 40,),
            Container(
              child:Padding(
                padding: const EdgeInsets.fromLTRB(15,0,0,0),
                child: Column(
                  children:[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("1.Introduction",style:TermsHead),
                      ],
                    ),
                    Text("Welcome to xspectre!These Terms of Service govern your use of our website located at https://www.xspectre.net/ (together or individually “Service”) operated by xspectre.\nOur Privacy Policy also governs your use of our Service and explains how we collect, safeguard and disclose information that results from your use of our web pages.\n            Your agreement with us includes these Terms and our Privacy Policy. You acknowledge that you have read and understood Agreements, and agree to be bound of them.\n'      If you do not agree with (or cannot comply with) Agreements, then you may not use the Service, but please let us know by emailing at xspectre.g@gmail.com so we can try to find a solution. These Terms apply to all visitors, users and others who wish to access or use Service.",maxLines: null,style: TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("2. Communications",style: TermsHead),
                      ],
                    ),
                    Text("By using our Service, you agree to subscribe to newsletters, marketing or promotional materials and other information we may send. However, you may opt out of receiving any, or all, of these communications from us by following the unsubscribe link or by emailing at xspectre.g@gmail.com.",maxLines: null,style: TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("3. Purchases",style: TermsHead),
                      ],
                    ),
                    Text("If you wish to purchase any product or service made available through Service, you may be asked to supply certain information relevant to your Purchase including but not limited to, your credit or debit card number, the expiration date of your card, your billing address, and your shipping information.\nYou represent and warrant that:\n (i) you have the legal right to use any card(s) or other payment method(s) in connection with any Purchase; \nii) the information you supply to us is true, correct and complete.\nWe may employ the use of third party services for the purpose of facilitating payment and the completion of Purchases. By submitting your information, you grant us the right to provide the information to these third parties subject to our Privacy Policy.\nWe reserve the right to refuse or cancel your order at any time for reasons including but not limited to: product or service availability, errors in the description or price of the product or service, error in your order or other reasons.\nWe reserve the right to refuse or cancel your order if fraud or an unauthorized or illegal transaction is suspected.",maxLines: null,style: TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("4. Contests, Sweepstakes and Promotions",style:TermsHead),
                      ],
                    ),
                    Text("Any contests, sweepstakes or other promotions (collectively, “Promotions”) made available through Service may be governed by rules that are separate from these Terms of Service. If you participate in any Promotions, please review the applicable rules as well as our Privacy Policy. If the rules for a Promotion conflict with these Terms of Service, Promotion rules will apply.",maxLines: null,style: TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("5. Subscriptions",style:TermsHead),
                      ],
                    ),
                    Text("Some parts of Service are billed on a subscription basis. You will be billed in advance on a recurring and periodic basis . Billing cycles will be set depending on the type of subscription plan you select when purchasing a Subscription.\nAt the end of each Billing Cycle, your Subscription will automatically renew under the exact same conditions unless you cancel it or xspectre cancels it. You may cancel your Subscription renewal either through your online account management page or by contacting xspectre.g@gmail.com customer support team.\nA valid payment method is required to process the payment for your subscription. You shall provide xspectre with accurate and complete billing information that may include but not limited to full name, address, state, postal or zip code, telephone number, and a valid payment method information. By submitting such payment information, you automatically authorize xspectre to charge all Subscription fees incurred through your account to any such payment instruments.\nShould automatic billing fail to occur for any reason, xspectre reserves the right to terminate your access to the Service with immediate effect.",maxLines: null,style:TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("6. Free Trial",style: TermsHead),
                      ],
                    ),
                    Text("Xspectre may, at its sole discretion, offer a Subscription with a free trial for a limited period of time.\nYou may be required to enter your billing information in order to sign up for Free Trial.\nIf you do enter your billing information when signing up for Free Trial, you will not be charged by xspectre until Free Trial has expired. On the last day of Free Trial period, unless you cancelled your Subscription, you will be automatically charged the applicable Subscription fees for the type of Subscription you have selected.\nAt any time and without notice, xspectre reserves the right to\n(i) modify Terms of Service of Free Trial offer\n(ii) cancel such Free Trial offer.",maxLines: null,style: TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("7. Fee Changes",style: TermsHead),
                      ],
                    ),
                    Text("Xspectre, in its sole discretion and at any time, may modify Subscription fees for the Subscriptions. Any Subscription fee change will become effective at the end of the then-current Billing Cycle.\nXspectre will provide you with a reasonable prior notice of any change in Subscription fees to give you an opportunity to terminate your Subscription before such change becomes effective.\nYour continued use of Service after Subscription fee change comes into effect constitutes your agreement to pay the modified Subscription fee amount.",maxLines: null,style:TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("8. Refunds",style:TermsHead),
                      ],
                    ),
                    Text("We issue refunds for Contracts within 30 days of the original purchase of the Contract.",maxLines: null,style: TermsDescription,textAlign: TextAlign.left,),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("9. Content",style:TermsHead),
                      ],
                    ),
                    Text("Our Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material. You are responsible for Content that you post on or through Service, including its legality, reliability, and appropriateness.\nBy posting Content on or through Service, You represent and warrant that:\n(i) Content is yours (you own it) and/or you have the right to use it and the right to grant us the rights and license as provided in these Terms\n(ii) that the posting of your Content on or through Service does not violate the privacy rights, publicity rights, copyrights, contract rights or any other rights of any person or entity. We reserve the right to terminate the account of anyone found to be infringing on a copyright.\nYou retain any and all of your rights to any Content you submit, post or display on or through Service and you are responsible for protecting those rights. We take no responsibility and assume no liability for Content you or any third party posts on or through Service. However, by posting Content using Service you grant us the right and license to use, modify, publicly perform, publicly display, reproduce, and distribute such Content on and through Service. You agree that this license includes the right for us to make your Content available to other users of Service, who may also use your Content subject to these Terms.\nXspectre has the right but not the obligation to monitor and edit all Content provided by users.\nIn addition, Content found on or through this Service are the property of Xspectre or used with permission. You may not distribute, modify, transmit, reuse, download, re post, copy, or use said Content, whether in whole or in part, for commercial purposes or for personal gain, without express advance written permission from us.",maxLines: null,style: TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("10. Prohibited Uses",style:TermsHead),
                      ],
                    ),
                    Text("You may use Service only for lawful purposes and in accordance with Terms. You agree not to use Service for:\n1. In any way that violates any applicable national or international law or regulation.\n2. For the purpose of exploiting, harming, or attempting to exploit or harm minors in any way by exposing them to inappropriate content or otherwise.\n3. To transmit, or procure the sending of, any advertising or promotional material, including any “junk mail”, “chain letter,” “spam,” or any other similar solicitation.\n4. To impersonate or attempt to impersonate Company, a Company employee, another user, or any other person or entity.\n5. In any way that infringes upon the rights of others, or in any way is illegal, threatening, fraudulent, or harmful, or in connection with any unlawful, illegal, fraudulent, or harmful purpose or activity.\n6. To engage in any other conduct that restricts or inhibits anyone’s use or enjoyment of Service, or which, as determined by us, may harm or offend Company or users of Service or expose them to liability.\nAdditionally, you agree not to:\n1. Use Service in any manner that could disable, overburden, damage, or impair Service or interfere with any other party’s use of Service, including their ability to engage in real time activities through Service.\n2. Use any robot, spider, or other automatic device, process, or means to access Service for any purpose, including monitoring or copying any of the material on Service.\n3. Use any manual process to monitor or copy any of the material on Service or for any other unauthorized purpose without our prior written consent.\n4. Use any device, software, or routine that interferes with the proper working of Service.\n5. Introduce any viruses, trojan horses, worms, logic bombs, or other material which is malicious or technologically harmful.\n6. Attempt to gain unauthorized access to, interfere with, damage, or disrupt any parts of Service, the server on which Service is stored, or any server, computer, or database connected to Service.\n7. Attack Service via a denial-of-service attack or a distributed denial-of-service attack.\n8. Take any action that may damage or falsify Company rating.\n9. Otherwise attempt to interfere with the proper working of Service.",maxLines: null,style: TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("11. Analytics",style: TermsHead),
                      ],
                    ),
                    Text("We may use third-party Service Providers to monitor and analyze the use of our Service.",maxLines: null,style: TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("12.No Use By Minors",style: TermsHead),
                      ],
                    ),
                    Text("Service is intended only for access and use by individuals at least eighteen (18) years old or those under the guidance of an 18 year old. By accessing or using Service, you warrant and represent that you are at least eighteen (18) years of age and with the full authority, right, and capacity to enter into this agreement and abide by all of the terms and conditions of Terms. If you are not at least eighteen (18) years old, you are prohibited from both the access and usage of Service unless you have approval and guidance from an adult (18+)",maxLines: null,style: TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("13. Accounts",style: TermsHead),
                      ],
                    ),
                    Text("When you create an account with us, you guarantee that you are above the age of 18 or are under the guidance of someone who is above 18, and that the information you provide us is accurate, complete, and current at all times. Inaccurate, incomplete, or obsolete information may result in the immediate termination of your account on Service.\nYou are responsible for maintaining the confidentiality of your account and password, including but not limited to the restriction of access to your computer and/or account. You agree to accept responsibility for any and all activities or actions that occur under your account and/or password, whether your password is with our Service or a third-party service. You must notify us immediately upon becoming aware of any breach of security or unauthorised use of your account.\nYou may not use as a username the name of another person or entity or that is not lawfully available for use, a name or trademark that is subject to any rights of another person or entity other than you, without appropriate authorisation. You may not use as a username any name that is offensive, vulgar or obscene.\nWe reserve the right to refuse service, terminate accounts, remove or edit content, or cancel orders in our sole discretion.",maxLines: null,style: TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("14. Intellectual Property",style:TermsHead),
                      ],
                    ),
                    Text("Service and its original content (excluding Content provided by users), features and functionality are and will remain the exclusive property of xspectre and its licensors. Service is protected by copyright, trademark, and other laws of and foreign countries. Our trademarks may not be used in connection with any product or service without the prior written consent of xspectre.",maxLines: null,style:TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("15. Copyright Policy",style:TermsHead),
                      ],
                    ),
                    Text("We respect the intellectual property rights of others. It is our policy to respond to any claim that Content posted on Service infringes on the copyright or other intellectual property rights (“Infringement”) of any person or entity.\nIf you are a copyright owner, or authorized on behalf of one, and you believe that the copyrighted work has been copied in a way that constitutes copyright infringement, please submit your claim via email to xspectre.g@gmail.com, with the subject line: “Copyright Infringement” and include in your claim a detailed description of the alleged Infringement as detailed below, under “DMCA Notice and Procedure for Copyright Infringement Claims”\nYou may be held accountable for damages (including costs and attorneys’ fees) for misrepresentation or bad-faith claims on the infringement of any Content found on and/or through Service on your copyright.",maxLines: null,style:TermsDescription,),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("16. DMCA Notice and Procedure for Copyright Infringement Claims",style: TermsHead),
                      ],
                    ),
                    Text("You may submit a notification pursuant to the Digital Millennium Copyright Act (DMCA) by providing our Copyright Agent with the following information in writing (see 17 U.S.C 512(c)(3) for further detail:\n1. an electronic or physical signature of the person authorized to act on behalf of the owner of the copyright’s interest\n2. a description of the copyrighted work that you claim has been infringed, including the URL (i.e., web page address) of the location where the copyrighted work exists or a copy of the copyrighted work\n3. identification of the URL or other specific location on Service where the material that you claim is infringing is located\n4. your address, telephone number, and email address\n5. a statement by you that you have a good faith belief that the disputed use is not authorized by the copyright owner, its agent, or the law\n6. a statement by you, made under penalty of perjury, that the above information in your notice is accurate and that you are the copyright owner or authorized to act on the copyright owner’s behalf.\nYou can contact our Copyright Agent via email at xspectre.g@gmail.com.",maxLines: null,style: TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("17. Error Reporting and Feedback",style: TermsHead),
                      ],
                    ),
                    Text("You may provide us either directly at xspectre.g@gmail.com or via third party sites and tools with information and feedback concerning errors, suggestions for improvements, ideas, problems, complaints, and other matters related to our Service (“Feedback”). You acknowledge and agree that:\n(i) you shall not retain, acquire or assert any intellectual property right or other right, title or interest in or to the Feedback\n(ii) Company may have development ideas similar to the Feedback\n (iii) Feedback does not contain confidential information or proprietary information from you or any third party\n(iv) Company is not under any obligation of confidentiality with respect to the Feedback. In the event the transfer of the ownership to the Feedback is not possible due to applicable mandatory laws, you grant Company and its affiliates an exclusive, transferable, irrevocable, free-of-charge, sub-licensee, unlimited and perpetual right to use (including copy, modify, create derivative works, publish, distribute and commercialise) Feedback in any manner and for any purpose.",maxLines: null,style: TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("18. Links To Other Web Sites",style:TermsHead),
                      ],
                    ),
                    Text("Our Service may contain links to third party web sites or services that are not owned or controlled by xspectre.\nXspectre has no control over, and assumes no responsibility for the content, privacy policies, or practices of any third party web sites or services. We do not warrant the offerings of any of these entities/individuals or their websites.\nFor example, the outlined Terms of Use have been created using PolicyMaker.io, a free web application for generating high-quality legal documents. PolicyMaker’s Terms and Conditions generator is an easy-to-use free tool for creating an excellent standard Terms of Service template for a website, blog, e-commerce store or app.\nYOU ACKNOWLEDGE AND AGREE THAT COMPANY SHALL NOT BE RESPONSIBLE OR LIABLE, DIRECTLY OR INDIRECTLY, FOR ANY DAMAGE OR LOSS CAUSED OR ALLEGED TO BE CAUSED BY OR IN CONNECTION WITH USE OF OR RELIANCE ON ANY SUCH CONTENT, GOODS OR SERVICES AVAILABLE ON OR THROUGH ANY SUCH THIRD PARTY WEB SITES OR SERVICES.\nWE STRONGLY ADVISE YOU TO READ THE TERMS OF SERVICE AND PRIVACY POLICIES OF ANY THIRD PARTY WEB SITES OR SERVICES THAT YOU VISIT.",maxLines: null,style:TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("19. Disclaimer Of Warranty",style: TermsHead),
                      ],
                    ),
                    Text("THESE SERVICES ARE PROVIDED BY COMPANY ON AN “AS IS” AND “AS AVAILABLE” BASIS. COMPANY MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THEIR SERVICES, OR THE INFORMATION, CONTENT OR MATERIALS INCLUDED THEREIN. YOU EXPRESSLY AGREE THAT YOUR USE OF THESE SERVICES, THEIR CONTENT, AND ANY SERVICES OR ITEMS OBTAINED FROM US IS AT YOUR SOLE RISK.\nNEITHER COMPANY NOR ANY PERSON ASSOCIATED WITH COMPANY MAKES ANY WARRANTY OR REPRESENTATION WITH RESPECT TO THE COMPLETENESS, SECURITY, RELIABILITY, QUALITY, ACCURACY, OR AVAILABILITY OF THE SERVICES. WITHOUT LIMITING THE FOREGOING, NEITHER COMPANY NOR ANYONE ASSOCIATED WITH COMPANY REPRESENTS OR WARRANTS THAT THE SERVICES, THEIR CONTENT, OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL BE ACCURATE, RELIABLE, ERROR-FREE, OR UNINTERRUPTED, THAT DEFECTS WILL BE CORRECTED, THAT THE SERVICES OR THE SERVER THAT MAKES IT AVAILABLE ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS OR THAT THE SERVICES OR ANY SERVICES OR ITEMS OBTAINED THROUGH THE SERVICES WILL OTHERWISE MEET YOUR NEEDS OR EXPECTATIONS.\n COMPANY HEREBY DISCLAIMS ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, STATUTORY, OR OTHERWISE, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, AND FITNESS FOR PARTICULAR PURPOSE.\nTHE FOREGOING DOES NOT AFFECT ANY WARRANTIES WHICH CANNOT BE EXCLUDED OR LIMITED UNDER APPLICABLE LAW.",maxLines: null,style: TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("20. Limitation Of Liability",style: TermsHead),
                      ],
                    ),
                    Text("EXCEPT AS PROHIBITED BY LAW, YOU WILL HOLD US AND OUR OFFICERS, DIRECTORS, EMPLOYEES, AND AGENTS HARMLESS FOR ANY INDIRECT, PUNITIVE, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGE, HOWEVER IT ARISES (INCLUDING ATTORNEYS’ FEES AND ALL RELATED COSTS AND EXPENSES OF LITIGATION AND ARBITRATION, OR AT TRIAL OR ON APPEAL, IF ANY, WHETHER OR NOT LITIGATION OR ARBITRATION IS INSTITUTED), WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE, OR OTHER TORTIOUS ACTION, OR ARISING OUT OF OR IN CONNECTION WITH THIS AGREEMENT, INCLUDING WITHOUT LIMITATION ANY CLAIM FOR PERSONAL INJURY OR PROPERTY DAMAGE, ARISING FROM THIS AGREEMENT AND ANY VIOLATION BY YOU OF ANY FEDERAL, STATE, OR LOCAL LAWS, STATUTES, RULES, OR REGULATIONS, EVEN IF COMPANY HAS BEEN PREVIOUSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. EXCEPT AS PROHIBITED BY LAW, IF THERE IS LIABILITY FOUND ON THE PART OF COMPANY, IT WILL BE LIMITED TO THE AMOUNT PAID FOR THE PRODUCTS AND/OR SERVICES, AND UNDER NO CIRCUMSTANCES WILL THERE BE CONSEQUENTIAL OR PUNITIVE DAMAGES. SOME STATES DO NOT ALLOW THE EXCLUSION OR LIMITATION OF PUNITIVE, INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE PRIOR LIMITATION OR EXCLUSION MAY NOT.",maxLines: null,style: TermsDescription ),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("21. Termination",style: TermsHead),
                      ],
                    ),
                    Text("We may terminate or suspend your account and bar access to Service immediately, without prior notice or liability, under our sole discretion, for any reason whatsoever and without limitation, including but not limited to a breach of Terms.\nIf you wish to terminate your account, you may simply discontinue using Service.\n All provisions of Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.",maxLines: null,style: TermsDescription,),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("22. Governing Law",style: TermsHead),
                      ],
                    ),
                    Text("These Terms shall be governed and construed in accordance with the laws of India, which governing law applies to agreement without regard to its conflict of law provisions.\n Our failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service and supersede and replace any prior agreements we might have had between us regarding Service.",maxLines: null,style: TermsDescription,),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("24. Amendments To Terms",style:TermsHead,),
                      ],
                    ),
                    Text("We may amend Terms at any time by posting the amended terms on this site. It is your responsibility to review these Terms periodically.\nYour continued use of the Platform following the posting of revised Terms means that you accept and agree to the changes. You are expected to check this page frequently so you are aware of any changes, as they are binding on you.\nBy continuing to access or use our Service after any revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, you are no longer authorized to use Service.",maxLines: null,style:TermsDescription),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("25. Waiver And Severability",style:TermsHead),
                      ],
                    ),
                    Text("No waiver by Company of any term or condition set forth in Terms shall be deemed a further or continuing waiver of such term or condition or a waiver of any other term or condition, and any failure of Company to assert a right or provision under Terms shall not constitute a waiver of such right or provision.\n If any provision of Terms is held by a court or other tribunal of competent jurisdiction to be invalid, illegal or unenforceable for any reason, such provision shall be eliminated or limited to the minimum extent such that the remaining provisions of Terms will continue in full force and effect.",maxLines: null,style: TermsDescription,),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("26. Acknowledgement",style:TermsHead),
                      ],
                    ),
                    Text("BY USING SERVICE OR OTHER SERVICES PROVIDED BY US, YOU ACKNOWLEDGE THAT YOU HAVE READ THESE TERMS OF SERVICE AND AGREE TO BE BOUND BY THEM.",maxLines: null,style: TermsDescription,),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("27. Contact Us",style:TermsHead),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Please send your feedback, comments, requests for technical support by email: xspectre.g@gmail.com.",maxLines: null,style: TermsDescription,),
                      ],
                    ),
                    SizedBox(height: 40,),
                  ]
                ),
              )
            ),
            Footer(context),
           ],
        )),
      ),
    );
  }
}
