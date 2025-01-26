import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String? _selectedValue = 'Show Latest First';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Results',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.withAlpha(40),
            child: Icon(
              CupertinoIcons.search,
              color: Colors.black,
              size: 25,
            ),
          ),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              showModalBottomSheet(
                isDismissible: true,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: true,
                context: context,
                builder: (context) => DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 0.6,
                  minChildSize: 0.4,
                  maxChildSize: 0.9,
                  builder: (context, scrollController) =>
                      _buildAddBottomSheet(scrollController),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
        bottom: TabBar(
          splashFactory: NoSplash.splashFactory,
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.transparent,
          indicatorWeight: 0,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs: const [
            Tab(text: '    All Results     '),
            Tab(text: '      X-Ray       '),
            Tab(text: '       Blood      '),
            Tab(text: '       Covid-19       '),
            Tab(text: '       Sugar       '),
          ],
          indicator: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25),
            shape: BoxShape.rectangle,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(40),
                            borderRadius: BorderRadius.circular(15)),
                        child: DropdownButton<String>(
                          padding: EdgeInsets.all(5),
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.black,
                          value: _selectedValue,
                          icon: Icon(CupertinoIcons.chevron_down),
                          items: [
                            'Show Relvent first',
                            'Show Latest First',
                            'Show Oldest First'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        showModalBottomSheet(
                          isDismissible: true,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: true,
                          context: context,
                          builder: (context) => DraggableScrollableSheet(
                            expand: false,
                            initialChildSize: 0.75,
                            minChildSize: 0.5,
                            maxChildSize: 0.9,
                            builder: (context, scrollController) =>
                                _buildFilterBottomSheet(scrollController),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(40),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Text(
                              'Filters',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            CircleAvatar(
                              maxRadius: 12,
                              backgroundColor: Colors.deepOrange,
                              child: Text(
                                '3',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      // height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(40),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            spacing: 10,
                            children: [
                              Flexible(
                                child: Text(
                                  (index % 2 == 0)
                                      ? 'Blood Test.pdf'
                                      : 'Arm X-Ray.pdf',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Image.asset(
                                'assets/images/${(index % 2 == 0) ? 'synevologo' : 'abbott'}.png',
                                height: 20,
                              )
                            ],
                          ),
                        ),
                        subtitle: Row(
                          spacing: 10,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.deepOrange,
                              ),
                              child: Center(
                                child: Text(
                                  'New',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                            Text(
                              '27.09.2024',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ],
                        ),
                        trailing: Icon(
                          CupertinoIcons.ellipsis_vertical,
                          color: Colors.grey,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(40),
                            borderRadius: BorderRadius.circular(15)),
                        child: DropdownButton<String>(
                          padding: EdgeInsets.all(5),
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.black,
                          value: _selectedValue,
                          icon: Icon(CupertinoIcons.chevron_down),
                          items: [
                            'Show Relvent first',
                            'Show Latest First',
                            'Show Oldest First'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(40),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Text(
                            'Filters',
                            style: TextStyle(fontSize: 15),
                          ),
                          CircleAvatar(
                            maxRadius: 12,
                            backgroundColor: Colors.deepOrange,
                            child: Text(
                              '1',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      // height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(40),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            spacing: 10,
                            children: [
                              Flexible(
                                child: Text(
                                  (index % 2 == 0)
                                      ? 'Knee X-Ray.pdf'
                                      : 'Arm X-Ray.pdf',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Image.asset(
                                'assets/images/${(index % 2 == 0) ? 'synevologo' : 'abbott'}.png',
                                height: 20,
                              )
                            ],
                          ),
                        ),
                        subtitle: Row(
                          spacing: 10,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.deepOrange,
                              ),
                              child: Center(
                                child: Text(
                                  'New',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                            Text(
                              '27.09.2024',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ],
                        ),
                        trailing: Icon(
                          CupertinoIcons.ellipsis_vertical,
                          color: Colors.grey,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(child: Text('Blood TabBarView')),
          Center(child: Text('Covid-19 TabBarView')),
          Center(child: Text('Sugar TabBarView')),
        ],
      ),
    );
  }

  _buildFilterBottomSheet(ScrollController scrollController) => Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.withAlpha(150),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Row(
                    children: [
                      Text(
                        'Filters',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey.withAlpha(40),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            CupertinoIcons.xmark,
                            color: Colors.black,
                            size: 25,
                          ),
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Clinics & Labs',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
                              width: 120,
                              margin: EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withAlpha(100)),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/${(index % 2 == 0) ? 'abbott' : 'synevologo'}.png',
                                  height: 20,
                                ),
                              ),
                            ),
                            trailing: Transform.scale(
                              scale: 1.5,
                              child: Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                child: Checkbox(
                                  splashRadius: 15,
                                  side: BorderSide(
                                      color: Colors.grey.withAlpha(100)),
                                  activeColor: Colors.deepOrange,
                                  checkColor: Colors.white,
                                  value: (index == 0),
                                  onChanged: (newValue) {},
                                ),
                              ),
                            ),
                          )),
                  Divider(),
                  Row(
                    children: [
                      Text(
                        'Results Date',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      Spacer(),
                      Text(
                        '21 Jan 2025',
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  Divider(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'File Format',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) => ListTile(
                            contentPadding: EdgeInsets.zero,

                            // leading:       Icon(
                            //   Icons.file_copy_rounded,
                            //   color: Colors.black,
                            //   size: 20,
                            // ),
                            title: Row(
                              spacing: 5,
                              children: [
                                Icon(
                                  Icons.file_copy_rounded,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                Text(
                                  (index % 2 == 0) ? 'pdf' : 'txt',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            trailing: Transform.scale(
                              scale: 1.5,
                              child: Theme(
                                data: ThemeData(
                                  checkboxTheme: CheckboxThemeData(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                child: Checkbox(
                                  splashRadius: 15,
                                  side: BorderSide(
                                      color: Colors.grey.withAlpha(100)),
                                  activeColor: Colors.deepOrange,
                                  checkColor: Colors.white,
                                  value: (index == 0),
                                  onChanged: (newValue) {},
                                ),
                              ),
                            ),
                          )),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        overlayColor: WidgetStateColor.transparent),
                    child: Text(
                      'Clear All',
                      style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          splashFactory: NoSplash.splashFactory),
                      child: Text(
                        'Apply (3)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      );

  _buildAddBottomSheet(ScrollController scrollController) => Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(150),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Row(
              children: [
                Text(
                  'Add Results',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.withAlpha(40),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      CupertinoIcons.xmark,
                      color: Colors.black,
                      size: 25,
                    ),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Synchronize with any Indian Clinic or Lab',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Search for Clinic or Lab',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                  fillColor: Colors.grey.withAlpha(40),
                  filled: true,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: Icon(
                    CupertinoIcons.search,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 80,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: 100,
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withAlpha(100)),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Center(
                          child: Image.asset(
                            'assets/images/${(index % 3 == 0) ? 'abbott' : 'synevologo'}.png',
                            height: 30,
                          ),
                        ),
                      )),
            ),
          ],
        ),
      );
}
