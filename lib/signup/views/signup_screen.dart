import 'package:flutter/material.dart';
import 'package:http/http.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  void login(String email,String password)async{
    try{
      Response response=await post(Uri.parse('https://reqres.in/api/register'),
      body: {
        'email':email,
        'password':password,
      }
      );
      if(response.statusCode==200){
        print('account created successfully');
      }
      else{
        print('failled');
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text('welcome')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// email filled......
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'email',
              ),
            ),
            SizedBox(height: 20,),
            /// password filled......
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            SizedBox(height: 20,),
            /// submit button.....

            SizedBox(
              height: 50,
                width: 110,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black,width: 2),
                  ),
                    child: Center(child: InkWell(
                      onTap: (){
                        login(emailController.text,passwordController.text);
                      },
                        child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 18),),
                    ),
                    )
                ),
            ),
          ],
        ),
      ),
    );
  }
}
