import 'package:flutter/material.dart';
import 'package:flutter_daangn/common/common.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nav/dialog/dialog.dart';

class SelectImageSourceDialog extends DialogWidget<ImageSource> {
  SelectImageSourceDialog({super.key});

  @override
  DialogState<SelectImageSourceDialog> createState() => _SelectImageSourceDialogState();
}

class _SelectImageSourceDialogState extends DialogState<SelectImageSourceDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 300,
          ),
          decoration: BoxDecoration(
            color: context.backgroundColor,
            borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Tap(
                onTap: () {
                  widget.hide(ImageSource.camera);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.camera_alt_outlined, color: Colors.white,),
                    width8,
                    '카메라'.text.color(Colors.white).make()
                  ],
                ).p(24),
              ),
              Line().pSymmetric(h: 20),
              Tap(
                onTap: () {
                  widget.hide(ImageSource.gallery);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.photo_outlined, color: Colors.white,),
                    width8,
                    '갤러리'.text.color(Colors.white).make()
                  ],
                ).p(24),
              )
            ],
          ),

        ),
      ),
    );
  }
}
