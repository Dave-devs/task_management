import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/common/app_colors/app_colors.dart';
import '../../add_todo_page/ui/add_todo_page.dart';
import '../../common/app_const/app_constant.dart';
import '../../common/widgets/reusable_text.dart';
import '../../search_todo_page/ui/search_todo_page.dart';
import '../widgets/todo_item_tile.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage>  with TickerProviderStateMixin{
  late final TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBGC,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddTodoPage())
          );
        },
        mini: true,
        child: Icon(Icons.add, color: AppColors.kWhiteColor,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      appBar: AppBar(
          // backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Column(
              children: [
                // SizedBox(height: 10.h,),
                Container(
                    width: 350.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: AppColors.kGreyC,
                        borderRadius: BorderRadius.all(Radius.circular(AppConst.kR))
                    ),
                    child: TextField(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SearchTodoPage())
                        );
                      },
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      minLines: 1,
                      maxLines: 1,
                      style: appStyle(14, FontWeight.w300, AppColors.kBlackColor),
                      decoration: InputDecoration(
                          hintText: 'Search for todos...',
                          hintStyle: appStyle(14, FontWeight.w400, Colors.grey),
                          prefixIcon: const Icon(Icons.search, size: 20, color: Colors.grey,)
                      ),
                    )
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ReusableText(
                        text: 'Todos',
                        style: appStyle(24, FontWeight.w600, AppColors.kBlackColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h,),
                TabBar(
                  tabs: const [
                    Tab(
                      child: ReusableText(text: 'All Todos',),
                    ),
                    Tab(
                      child: ReusableText(text: 'In-Progress',),
                    ),
                    Tab(
                      child: ReusableText(text: 'Completed',),
                    ),
                  ],
                  controller: tabController,
                  labelColor: AppColors.kPC,
                  labelStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                  unselectedLabelColor: AppColors.kBlackColor,
                ),
              ],
            ),
          )
      ),



      body: TabBarView(
        controller: tabController,
        children: [
          //For All Todos....................................
          ListView(
            children: [
              TodoItemTile(
                icon1: Icons.event,
                itemColor: AppColors.kTodoC,
                text: 'Test the app',
                time: '11:37 AM',
              ),

              TodoItemTile(
                icon1: Icons.event,
                itemColor: AppColors.kTodoC,
                text: 'Test the app',
                time: '11:37 AM',
              ),
            ],
          ),

          //For In-progress Todos....................................
          ListView(
            children: [
              TodoItemTile(
                icon1: Icons.event,
                itemColor: AppColors.kIPC,
                text: 'Test the app',
                time: '11:37 AM',
              ),

              TodoItemTile(
                icon1: Icons.event,
                itemColor: AppColors.kIPC,
                text: 'Test the app',
                time: '11:37 AM',
              ),

            ],
          ),

          //For Completed Todos....................................
          ListView(
            children: [
              TodoItemTile(
                icon1: Icons.event,
                itemColor: AppColors.kDC,
                text: 'Test the app',
                time: '11:37 AM',
              ),

              TodoItemTile(
                icon1: Icons.event,
                itemColor: AppColors.kDC,
                text: 'Test the app',
                time: '11:37 AM',
              ),

            ],
          ),
        ],
      ),
    );
  }
}
