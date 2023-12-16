import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10
          )
        ]
      ),

      padding: const EdgeInsets.all(15),

      child: Row(
        children: [
          Expanded(child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(24)
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: const Offset(0, 0),
                  blurRadius: 8
                )
              ]
            ),
            child: TextField(
              autofocus: false,
              onSubmitted: (val) {},
              onChanged: (val) {},
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 16,
                ),
                fillColor: Colors.white,
                filled: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none
                ),
                hintText: "Search...",
                hintStyle: const TextStyle(fontSize: 15),
                prefixIcon: const Icon(Icons.search_outlined)
              ),
            ),
          )),
          const SizedBox(width: 10,),
          Container(height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 8
              )
            ]
          ),
          padding: const EdgeInsets.all(12),
            child: const Icon(Icons.filter_alt,color: Colors.grey,),
          ),
          const SizedBox(width: 10,),

          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -13, end: -3),
            badgeContent: const Text('1',style: TextStyle(color: Colors.white),),
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              padding: const EdgeInsets.all(5),
              badgeColor: Colors.redAccent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(height: 46,
              width: 46,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 8
                    )
                  ]
              ),
              padding: const EdgeInsets.all(12),
              child: const Icon(Icons.shopping_cart,color: Colors.grey,),
            ),
          )],
      ),
    );
  }
}
