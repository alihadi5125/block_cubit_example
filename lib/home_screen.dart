import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/cubits/home_page_controller_cubit.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: PageView(
          controller: controller,
          onPageChanged: (x) {
            context.read<HomePageControllerCubit>()
                .changePageIndex(index: x);
          },
          children: [
            Container(
              color: Colors.yellow,
              child: const Center(
                child: Text("Home"),
              ),
            ),
            Container(
              color: Colors.lightBlueAccent,
              child: const Center(
                child: Text("Profile"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.blue,
        child:
        BlocBuilder<HomePageControllerCubit, int>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        controller.jumpToPage(0);
                        context.read<HomePageControllerCubit>()
                            .changePageIndex(index: 0);
                      },
                      child: Text("Home",
                        style: TextStyle(
                          color: state == 0 ? Colors.white : Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        controller.jumpToPage(1);
                        context.read<HomePageControllerCubit>()
                            .changePageIndex(index: 1);
                      },
                      child: Text("Profile",
                        style: TextStyle(
                          color: state == 1 ? Colors.white : Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
