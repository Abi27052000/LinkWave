import 'package:flutter/material.dart';

class BottomChatField extends StatefulWidget {
  const BottomChatField({
    super.key,
  });

  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField> {
  bool isShowSendButton = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: (val) {
              if (val.isNotEmpty) {
                setState(() {
                  isShowSendButton = true;
                });
              } else {
                setState(() {
                  isShowSendButton = false;
                });
              }
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.emoji_emotions,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.gif,
                            color: Colors.black,
                            size: 35,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                suffixIcon: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.attach_file,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                hintText: 'Enter the message.',
                hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
                contentPadding: const EdgeInsets.all(10)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Icon(
            isShowSendButton ? Icons.send : Icons.mic,
          ),
        )
      ],
    );
  }
}
