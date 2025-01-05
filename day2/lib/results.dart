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
              size: 30,
            ),
          ),
          Container(
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
                                'assets/images/' +
                                    ((index % 2 == 0)
                                        ? 'synevologo'
                                        : 'abbott') +
                                    '.png',
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
                                'assets/images/' +
                                    ((index % 2 == 0)
                                        ? 'synevologo'
                                        : 'abbott') +
                                    '.png',
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
}
