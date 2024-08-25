import 'package:flutter/material.dart';
import 'package:getx_state_management/view/common_widgets/common_button.dart';
import 'package:getx_state_management/view/common_widgets/common_text.dart';
import 'package:getx_state_management/view/screen/auth/widget/common_text_field.dart';

class EvenOddWithRange extends StatefulWidget {
  const EvenOddWithRange({super.key});

  @override
  State<EvenOddWithRange> createState() => _EvenOddWithRangeState();
}

class _EvenOddWithRangeState extends State<EvenOddWithRange> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController lastNumberController = TextEditingController();
  List<int> evenList = [];
  List<int> oddList = [];


  findEvenOdd(){
    int first = int.parse(firstNumberController.text.toString());
    int last = int.parse(lastNumberController.text.toString());
    for(first; first <= last; first++){
      if(first % 2 == 0){
        evenList.add(first);
      }else{
        oddList.add(first);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Even Odd Range"),
      ),
      body: SingleChildScrollView(
        child: Center( 
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: CommonTextField(
                            textController: firstNumberController,
                            text: "first number")),
                    Expanded(
                        child: CommonTextField(
                            textController: lastNumberController,
                            text: "Last number"))
                  ],
                ),
                CommonButton(buttonName: "Find Even Odd", onTap: () {
                  findEvenOdd();
                }),
                const SizedBox(height: 20,),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CommonText(title: "Even Number"),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: evenList.length,
                                    itemBuilder: (context, index) {
                                      return   CommonText(title: evenList[index].toString());
                                    })
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          color: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CommonText(title: "Odd Number"),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: oddList.length,
                                    itemBuilder: (context, index) {
                                      return CommonText(title: oddList[index].toString());
                                    })
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
