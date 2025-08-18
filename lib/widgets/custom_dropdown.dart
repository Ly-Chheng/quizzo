import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';

class CustomDropDown<T> extends StatefulWidget {
  final List<CustDropdownMenuItem> items;
  final Function onChanged;
  final String hintText;
  final double borderRadius;
  final double maxListHeight;
  final double borderWidth;
  final int defaultSelectedIndex;
  final bool enabled;
  final bool? isBorder;
  final bool? isBorderDropMenu;
  final bool? isOnlyText;
  final TextStyle? hintStyle;

  const CustomDropDown({
    super.key,
    required this.items,
    required this.onChanged,
    this.hintText = "",
    this.borderRadius = 15,
    this.borderWidth = 1,
    this.maxListHeight = 300,
    this.defaultSelectedIndex = -1,
    this.enabled = true,
    this.isBorder = true,
    this.isBorderDropMenu = true,
    this.isOnlyText = false,
    this.hintStyle,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown>
    with WidgetsBindingObserver {
  bool _isOpen = false, _isAnyItemSelected = false, _isReverse = false;
  late OverlayEntry _overlayEntry;
  late RenderBox? _renderBox;
  Widget? _itemSelected;
  late Offset dropDownOffset;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          dropDownOffset = getOffset();
        });
      }
      if (widget.defaultSelectedIndex > -1 &&
          widget.defaultSelectedIndex < widget.items.length) {
        setState(() {
          _isAnyItemSelected = true;
          _itemSelected = widget.items[widget.defaultSelectedIndex];
          widget.onChanged(widget.items[widget.defaultSelectedIndex].value);
        });
      }
    });
  }

  void _addOverlay() {
    if (mounted) {
      setState(() {
        _isOpen = true;
      });
    }

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry);
  }

  void _removeOverlay() {
    if (mounted) {
      setState(() {
        _isOpen = false;
      });
      _overlayEntry.remove();
    }
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    _renderBox = context.findRenderObject() as RenderBox?;
    var size = _renderBox!.size;
    dropDownOffset = getOffset();
    return OverlayEntry(
      maintainState: false,
      builder: (context) => Align(
        alignment: Alignment.center,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: dropDownOffset,
          child: SizedBox(
            height: widget.maxListHeight,
            width: size.width,
            child: Column(
              mainAxisAlignment:
                  _isReverse ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: widget.maxListHeight,
                      maxWidth: size.width,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: Get.isDarkMode
                          ? []
                          : [
                              BoxShadow(
                                color: const Color(0xff767676).withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(2, 2),
                              )
                            ],
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      clipBehavior: Clip.antiAlias,
                      child: ListView(
                          clipBehavior: Clip.antiAlias,
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: [
                            ...widget.items.map(
                              (item) => GestureDetector(
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(
                                    left: 15,
                                    bottom: context.isPhone ? 10 : 15,
                                    top: context.isPhone ? 10 : 15,
                                    right: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    border: widget.isBorder == true
                                        ? Border(
                                            bottom: BorderSide(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              width: 0.3,
                                            ),
                                          )
                                        : const Border(),
                                  ),
                                  child: item.child,
                                ),
                                onTap: () {
                                  if (mounted) {
                                    setState(() {
                                      _isAnyItemSelected = true;
                                      _itemSelected = item.child;
                                      _removeOverlay();
                                      widget.onChanged(item.value);
                                    });
                                  }
                                },
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Offset getOffset() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    double y = renderBox!.localToGlobal(Offset.zero).dy;
    double spaceAvailable = _getAvailableSpace(y + renderBox.size.height);
    if (spaceAvailable > widget.maxListHeight) {
      _isReverse = false;
      return Offset(0, renderBox.size.height);
    } else {
      _isReverse = true;
      return Offset(
          0,
          renderBox.size.height -
              (widget.maxListHeight + renderBox.size.height));
    }
  }

  double _getAvailableSpace(double offsetY) {
    double safePaddingTop = MediaQuery.of(context).padding.top;
    double safePaddingBottom = MediaQuery.of(context).padding.bottom;

    double screenHeight =
        MediaQuery.of(context).size.height - safePaddingBottom - safePaddingTop;

    return screenHeight - offsetY;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: widget.enabled
            ? () {
                _isOpen ? _removeOverlay() : _addOverlay();
              }
            : null,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: context.isPhone ? 4 : 5,
                    child: _isAnyItemSelected
                        ? _itemSelected!
                        : Text(
                            widget.hintText,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: widget.hintStyle ??
                                TextStyle(
                                  fontSize: context.isPhone ? 16 : 18,
                                  fontFamily: AppFontStyle().fontebold,
                                  color: AppColor().greyText,
                                ),
                          ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: context.isPhone ? 28 : 30,
                      color: Theme.of(context).hoverColor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: AppColor().primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class CustDropdownMenuItem<T> extends StatelessWidget {
  final T value;
  final Widget child;

  const CustDropdownMenuItem({
    super.key,
    required this.value,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
