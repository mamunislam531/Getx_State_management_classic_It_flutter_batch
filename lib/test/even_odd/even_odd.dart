import 'package:flutter/material.dart';
import 'package:getx_state_management/view/common_widgets/common_button.dart';
import 'package:getx_state_management/view/common_widgets/common_text.dart';
import 'package:getx_state_management/view/screen/auth/widget/common_text_field.dart';

class EvenOdd extends StatefulWidget {
  const EvenOdd({super.key});

  @override
  State<EvenOdd> createState() => _EvenOddState();
}

class _EvenOddState extends State<EvenOdd> {
  TextEditingController inputController = TextEditingController();

  String result = "";


  checkEvenOdd(){
    if(int.parse(inputController.text.toString()) % 2 == 0){
      result = "Even";
    }else{
      result = "Odd";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Even Odd Check"),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonTextField(
                              textController: inputController, text: "text"),
                        ),
                        SizedBox(width: 20),
                        Row(
                          children: [
                            CommonText(
                              title: "Result : ",
                              fSize: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CommonText(
                              title: result,
                              fSize: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CommonButton(buttonName: "Check Even or Odd", onTap: () {
                    checkEvenOdd();
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
