import 'package:flutter/material.dart';
import 'package:fuse/util/common_utils.dart';

class NavBarMobile extends StatefulWidget {
  final List<NavIteams> navItems;

  final int? selectedIndex;

  final Duration? duration;
  final Function(int) onSelect;

  const NavBarMobile({
    Key? key,
    required this.navItems,
    required this.onSelect,
    this.selectedIndex,
    this.duration,
  }) : super(key: key);

  @override
  _NavBarMobileState createState() => _NavBarMobileState();
}

class NavIteams {
  final IconData icon;
  final String? lable;

  NavIteams({
    required this.icon,
    this.lable,
  });
}

class _NavBarMobileState extends State<NavBarMobile> {
  Size size = const Size(150, 80);
  int selectedIndex = 0;
  Duration dur = const Duration(milliseconds: 300);

  @override
  void initState() {
    selectedIndex = widget.selectedIndex ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 65,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 3),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: BottomNavigationBar(
            items: List.generate(
              widget.navItems.length,
              (index) => BottomNavigationBarItem(
                icon: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 8, right: 3, left: 3),
                      child: Center(
                          child: Icon(
                        widget.navItems.elementAt(index).icon,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: AnimatedContainer(
                        duration: dur,
                        height: (index == selectedIndex) ? 6 : 0,
                        decoration: BoxDecoration(
                            color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                      ),
                    )
                  ],
                ),
                label: widget.navItems.elementAt(index).lable,
              ),
            ),
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              notMounted(mounted, setState);
              widget.onSelect(index);
            },
          )

          // Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: List.generate(
          //         widget.navItems.length,
          //         (index) => Expanded(
          //               child: Stack(
          //                 children: [
          //                   InkWell(
          //                     onTap: () {
          //                       selectedIndex = index;
          //                       notMounted(mounted, setState);
          //                     },
          //                     child: Padding(
          //                       padding: const EdgeInsets.only(top: 5, right: 3, left: 3),
          //                       child: Column(
          //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                         children: [
          //                           Center(
          //                               child: Icon(
          //                             widget.navItems.elementAt(index).icon,
          //                             color: widget.itemsColor ?? Colors.black,
          //                           )),
          //                           if (widget.showAllLables)
          //                             MyText(
          //                               widget.navItems.elementAt(index).lable ?? "",
          //                               maxLines: 1,
          //                               softWrap: true,
          //                               overflow: TextOverflow.ellipsis,
          //                               color: widget.itemsColor ?? Colors.black,
          //                             ),
          //                           if (!widget.showAllLables && index == selectedIndex)
          //                             MyText(
          //                               widget.navItems.elementAt(index).lable ?? "",
          //                               maxLines: 1,
          //                               softWrap: true,
          //                               overflow: TextOverflow.ellipsis,
          //                               color: widget.itemsColor ?? Colors.black,
          //                             )
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding: const EdgeInsets.symmetric(horizontal: 5),
          //                     child: AnimatedContainer(
          //                       duration: dur,
          //                       height: (index == selectedIndex) ? 6 : 0,
          //                       decoration: BoxDecoration(
          //                           color: widget.selectorColor ?? Colors.black,
          //                           borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
          //                     ),
          //                   )
          //                 ],
          //               ),
          //             ))),

          ),
    );
  }
}
