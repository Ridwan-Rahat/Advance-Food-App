import 'package:advance_foodapp/presentation/color_manager.dart';
import 'package:advance_foodapp/presentation/dimesion.dart';
import 'package:advance_foodapp/presentation/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandText extends StatefulWidget {
  final String text;
  const ExpandText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandTextState createState() => _ExpandTextState();
}

class _ExpandTextState extends State<ExpandText> {
  late String firstHalf;
  late String lastHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/5.63;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length>textHeight.toInt()){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      lastHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }
    else{
      firstHalf=widget.text;
      lastHalf="";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: lastHalf.isEmpty?SmallText(text: firstHalf):Column(
        children: [
          SmallText(text: hiddenText?(firstHalf+"..."):(firstHalf+lastHalf),color: AppColor.paraColor,size: Dimensions.font18,height: 1.8,),
          GestureDetector(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });

            },
            child: Row(
              children: [
                SmallText(text: hiddenText?"Show More":"Show Less",color: AppColor.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppColor.mainColor,)
              ],
            ),
          )
        ],



      ),
    );
  }
}
