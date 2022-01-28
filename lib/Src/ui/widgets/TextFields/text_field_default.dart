
import 'package:dr_dent/Src/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


enum FieldType {
  WithBorder,
  WithOutBorder,
}


enum SecureType {
  Never,
  Toggle,
  Always,
}





class TextFieldDefault extends StatefulWidget {
  final String hint;
  final String? label;
  final String upperTitle;
  final FieldType fieldType;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final IconData? icon;
  final String? prefixIconUrl;
  final String? suffixIconUrl;
  final bool? isPrefixIcon;
  final bool? isSuffixIcon;
  final String? Function(String?)? validation;
  final Function(String)? onChanged;
  final VoidCallback? onComplete;
  final FormFieldSetter<String>? onSaved;
  final Color hintColor;
  final Color? labelColor;
  final Color errorColor;
  final Color fieldColor;
  final Color filledColor;
  final Color enableBorder;
  final Color disableBorder;
  final Color focusBorder;
  final Color errorBorder;
  final Color cursorColor;
  final Color prefixColor;
  final Color suffixColor;
  final Color iconColor;

  final String? errorText;
  final String? errorLargeText;
  final String? errorMinimumText;
  final int largeCondition;
  final int minimumCondition;
  final int maxLines;

  final TextEditingController? controller;

  final double horizentalPadding;
  final double verticalPadding;
  final VoidCallback? onSuffixTap;

  final double borderRadius;
  final double borderWidth;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final SecureType secureType;

  final double outerHorizentalPadding;

  final bool enable;


  final Color upperTitleColor;


  TextFieldDefault(
      {
        @required this.hint='',
        this.controller,
        this.upperTitle='',
        this.upperTitleColor = kCTFUpperTitle,
        this.label,
        this.fieldType = FieldType.WithOutBorder,
        this.prefixIconData,
        this.suffixIconData,
        this.prefixIconUrl,
        this.suffixIconUrl,
        this.isPrefixIcon = true,
        this.isSuffixIcon = false,
        this.validation,
        this.onChanged,
        this.onComplete,
        this.onSaved,
        this.maxLines=1,
        this.enable=true,
        this.hintColor = kCTFHintTitle,
        this.labelColor = kCTFHintTitle,
        this.errorColor = kCTFErrorText,
        this.fieldColor = kCTFBackGround,
        this.filledColor = kCTFBackGround,
        this.enableBorder = kCTFEnableBorder,
        this.disableBorder = kCTFDisableBorder,
        this.focusBorder = kCTFFocusBorder,
        this.errorBorder = kCTFErrorBorder,
        this.cursorColor = kCTFCursor,
        this.errorText,
        this.errorLargeText,
        this.largeCondition = 0,
        this.minimumCondition = 0,
        this.errorMinimumText,
        this.horizentalPadding=19.0,
        this.verticalPadding=14.0,
        this.icon,
        this.onSuffixTap,
        this.prefixColor = kCTFPreFixIcon,
        this.suffixColor = kCTFSuffixFixIcon,
        this.iconColor   = kCTFPreFixIcon,
        this.borderRadius = 15.0,
        this.borderWidth = 1.0  ,
        this.keyboardType,
        this.textInputAction,
        this.secureType=SecureType.Never,
        this.outerHorizentalPadding=0.0
      });

  @override
  _TextFieldDefaultState createState() => _TextFieldDefaultState();
}

class _TextFieldDefaultState extends State<TextFieldDefault> {
  bool secureState = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: widget.outerHorizentalPadding.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          drawUpperTitle(upperTitleText: widget.upperTitle,usedUpperTitleColor: widget.upperTitleColor),
          TextFormField(
            obscureText: widget.secureType==SecureType.Never?false: widget.secureType==SecureType.Always?true:secureState,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            onEditingComplete: widget.onComplete,
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
            controller: widget.controller,
            cursorColor: widget.cursorColor,
            // ignore: missing_return
            enabled: widget.enable,
            maxLines: widget.maxLines,
            validator: widget.validation??(value) {
              if (value!.isEmpty)
                return widget.errorText;
              else if (value.length < widget.minimumCondition)
                return widget.errorMinimumText;
              if(widget.largeCondition !=0){
               if (value.length > widget.largeCondition)
                return widget.errorLargeText;
              }
              else
                return null;
            },
            style: TextStyle(
                fontSize: 16.r,
                color: kCTFMainTitle,
                fontFamily: "semibold"
            ),
            decoration: InputDecoration(
              enabled: true,
              filled: true,
              fillColor: widget.filledColor,
              // HINT TEXT WITH STYLE
              hintText: widget.hint,
              hintStyle: TextStyle(
                  fontSize: 15.r,
                  color: widget.hintColor,
                  fontFamily: "light"
              ),
              // LABEL TEXT WITH STYLE
              labelText: widget.label,
              labelStyle: TextStyle(
                  fontSize: 11.r,
                  color: widget.labelColor,
                  fontFamily: "light"
              ),
              // ERROR TEXT STYLE
              errorStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 12.r,
                  color: widget.errorColor,
                  fontFamily: "light"
              ),
              // PADDING
              contentPadding: EdgeInsets.symmetric(
                  vertical: widget.verticalPadding.h,
                  horizontal: widget.horizentalPadding.w,
              ),
              icon: widget.icon!=null ? Icon(
                widget.icon,
                color:widget.iconColor,
                size: 24.w,
              ):null,
              prefixIcon: (widget.prefixIconUrl != null || widget.prefixIconData != null)
                  ? widget.prefixIconUrl != null
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/${widget.prefixIconUrl}.png",
                    height: 14.79.w,
                    width: 12.17.w,
                    color: widget.prefixColor,
                  ),
                ],
              )
                  : Icon(
                widget.prefixIconData,
                color: widget.prefixColor,
                size: 24.w,
              )
                  : null,

              prefixIconConstraints: widget.prefixIconUrl == null
                  ? null
                  : BoxConstraints(
                maxHeight:14.79.w,
                maxWidth: (12.17 + (10.0 * 1.0)).w,
              ),
              suffixIcon:
              widget.secureType==SecureType.Toggle ?
              IconButton(
                  icon: Icon(secureState? Icons.visibility_outlined : Icons.visibility_off_outlined),
                  color: widget.suffixColor,
                  iconSize: 20.w,
                  onPressed: (){
                    setState(() {
                      secureState = !secureState;
                    });
                  }
              ):
              (widget.suffixIconData != null || widget.suffixIconUrl != null)?
              IconButton(
                icon: Icon(
                  widget.suffixIconData,
                  color: widget.suffixColor,
                  size: 24.w,
                ),
                onPressed: widget.onSuffixTap,
              ):null,
              border: widget.fieldType == FieldType.WithBorder
                  ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius.r),
                borderSide: BorderSide(
                    color: widget.enableBorder,
                    width: widget.borderWidth.w
                  //style: BorderStyle.solid,
                ),
              )
                  : UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.errorBorder,
                    width: widget.borderWidth.w),
              ),
              disabledBorder:widget.fieldType == FieldType.WithBorder
                  ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    widget.borderRadius.r),
                borderSide: BorderSide(
                    color:widget.disableBorder,
                    width: widget.borderWidth.w),
              )
                  : UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.disableBorder,
                    width: widget.borderWidth.w),
              ),
              enabledBorder: widget.fieldType == FieldType.WithBorder
                  ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    widget.borderRadius.r),
                borderSide: BorderSide(
                    color:widget.enableBorder,
                    width: widget.borderWidth.w),
              )
                  : UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.enableBorder,
                    width: widget.borderWidth.w),
              ),
              focusedBorder: widget.fieldType == FieldType.WithBorder
                  ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    widget.borderRadius.r),
                borderSide: BorderSide(
                    color: widget.focusBorder,
                    width: widget.borderWidth.w),
              )
                  : UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.focusBorder,
                    width: widget.borderWidth.w),
              ),
              errorBorder: widget.fieldType == FieldType.WithBorder
                  ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    widget.borderRadius.r),
                borderSide: BorderSide(
                    color: widget.errorBorder,
                    width: widget.borderWidth.w),
              )
                  : UnderlineInputBorder(
                borderSide: BorderSide(
                    color:widget.errorBorder,
                    width: widget.borderWidth.w),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawUpperTitle({String upperTitleText = '',Color? usedUpperTitleColor }){
    return widget.upperTitle.isNotEmpty
        ? Padding(
      padding:  EdgeInsets.only(
          bottom: 7.h
      ),
      child: Text(
        widget.upperTitle,
        textDirection: TextDirection.rtl,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.caption!.copyWith(
            color: usedUpperTitleColor,
            fontSize: 16.sp,
            fontFamily: 'light',
        ),
      ),
    )
        : SizedBox(
      height: 0,
    );
  }

}
