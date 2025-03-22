import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/my_colors.dart';

// ignore: must_be_immutable
class MyTextFeild extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  String? Function(String?)? validate;
  String? Function(String?)? onChanged;
  Widget? icon;
  bool isPassowrd;
  bool? showPassword;
  bool check;
  Color? color;
  int? maxLines;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  MyTextFeild({
    super.key,
    this.color,
    this.showPassword,
    this.onChanged,
    this.hintText,
    this.controller,
    this.validate,
    this.maxLines,
    this.icon,
    this.check = false,
    this.inputAction,
    this.focusNode,
    this.isPassowrd = false,
  });

  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowPasswordBloc>(
        create: (BuildContext context) => ShowPasswordBloc(),
        child: BlocBuilder<ShowPasswordBloc, ShowPasswordState>(
            builder: (context, passwordBloc) {
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
              decoration: BoxDecoration(
                  border: Border.all(),
                  gradient: MyColors.linearGColAppBar,
                  color: (color == null)
                      ? const Color.fromARGB(255, 221, 224, 226)
                      : color,
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                onChanged: onChanged,
                maxLines:
                    (isPassowrd == false && maxLines != null) ? maxLines : 1,
                focusNode: focusNode,
                textInputAction: inputAction,
                controller: controller,
                obscureText: (isPassowrd == true)
                    ? !passwordBloc.isShowPassword
                    : passwordBloc.isShowPassword,
                validator: validate,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText ?? 'Enter Text...',
                  contentPadding: const EdgeInsets.all(10),
                  suffixIcon: (isPassowrd)
                      ? IconButton(
                          onPressed: () {
                            context.read<ShowPasswordBloc>().add(
                                ShowPasswordChangeEvent(
                                    newState:
                                        passwordBloc.isShowPassword == false
                                            ? true
                                            : false));
                          },
                          icon: (passwordBloc.isShowPassword == false)
                              ? const Icon(
                                  Icons.visibility_off,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.blue,
                                ))
                      : null,
                ),
              ));
        }));
  }
}

class ShowPasswordState {
  bool isShowPassword;
  ShowPasswordState({required this.isShowPassword});
}

class ShowPasswordEvent {}

class ShowPasswordChangeEvent extends ShowPasswordEvent {
  bool newState;
  ShowPasswordChangeEvent({required this.newState});
}

class ShowPasswordBloc extends Bloc<ShowPasswordEvent, ShowPasswordState> {
  ShowPasswordBloc() : super(ShowPasswordState(isShowPassword: false)) {
    on<ShowPasswordChangeEvent>((event, emit) {
      emit(ShowPasswordState(isShowPassword: event.newState));
    });
  }
}
