import 'package:flutter/material.dart';
import 'package:iot_smart_home/core/constants/asset_path.dart';

class ControlLighScreen extends StatelessWidget {
  final bool isLightTurnOn;
  const ControlLighScreen({Key? key, this.isLightTurnOn = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 19,
                  top: 7,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 19,
                        top: 7,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back_outlined),
                          ),
                          Stack(
                            children: [
                              Text(
                                'Living\nRoom',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontSize: 45,
                                      color: const Color(0xFFBDBDBD)
                                          .withOpacity(0.5),
                                    ),
                              ),
                              Text(
                                'Living\nRoom',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          Text(
                            'Power',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Switch.adaptive(
                            inactiveThumbColor: const Color(0xFFE4E4E4),
                            inactiveTrackColor: Colors.white,
                            activeColor: Colors.white,
                            activeTrackColor: const Color(0xFF464646),
                            value: true,
                            onChanged: (value) {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    AssetPath.imageLamp,
                    height: 180,
                    width: 140,
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    AssetPath.imageLampLightOrange,
                    height: 190,
                    width: 140,
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
