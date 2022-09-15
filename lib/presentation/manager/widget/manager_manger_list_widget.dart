import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/manager_bloc/list_widget_bloc/list_widget_bloc.dart';
import '../../../bloc/manager_bloc/list_widget_bloc/list_widget_event.dart';
import '../../../bloc/manager_bloc/list_widget_bloc/list_widget_state.dart';

class ManagerManagerListWidget extends StatelessWidget {
  ManagerManagerListWidget({Key? key}) : super(key: key);

  String email = '';
  String password = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ListWidgetBloc>(context).add(GetSelectedUserEvent(role: 'manager'));
    return BlocBuilder<ListWidgetBloc,ListWidgetState>(builder: (context,state){
      if(state is ListWidgetInitial){
        return const CircularProgressIndicator();
      }
      else if(state is GetSelectedUsers){
        return Container(
          margin: const EdgeInsets.all(40),
          child: ListView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width - 600,
                    child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Manager',
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ), // icon is 48px widget.
                          ),
                        )
                    ),),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: (){
                          BlocProvider.of<ListWidgetBloc>(context).add(AddButtonEvent());
                        }, child: const Text('Add')),
                        TextButton(onPressed: (){}, child: const Text('Remove')),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 4 / 5,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 30,
                ),
                itemCount: state.user.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 1,
                            color: Colors.black12,
                            offset: Offset(0, 3)),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.black12,
                        child: ClipRRect(
                          child: Image.network('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                        ),
                      ),
                      Text(
                        state.user[index]['name'],
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      const Text('Flutter Developer'),
                      Container(
                        alignment: Alignment.center,
                        // color: Colors.black12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.location_on_outlined,
                              size: 15,
                            ),
                            Text('Pune')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
      else if(state is AddButtonState){
        return Center(
          child: Container(
            width: 400,
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                const Text('Add Employee',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Name',
                  ),
                  onChanged: (value){
                    name = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter E-mail',
                  ),
                  onChanged: (value){
                    email = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Password',
                  ),
                  onChanged: (value){
                    password = value;
                  },
                ),
                Row(
                  children: [
                    TextButton(onPressed: (){
                      // BlocProvider.of<ListWidgetBloc>(context).add();
                    }, child: const Text('Back'),),
                    TextButton(onPressed: (){
                      BlocProvider.of<ListWidgetBloc>(context).add(AddButton2Event(email: email, password: password, role: 'manager', name: name));
                    }, child: const Text('Submit'),),
                  ],
                ),
              ],
            ),
          ),
        );
      }
      else if(state is SuccessfullyAddedEmployee){
        BlocProvider.of<ListWidgetBloc>(context).add(GetSelectedUserEvent(role: 'manager'));
        return const Text('Added');
      }
      else{
        return const Center(child: Text('Unable to fetch data'),);
      }
    });
  }
}
