import 'package:flutter/material.dart';

class PrivacypolicyPage extends StatelessWidget {
  const PrivacypolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms and Conditions"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1.1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque efficitur augue a mi condimentum tincidunt. Morbi tempor hendrerit consectetur. Donec ut purus euismod, sollicitudin orci luctus, sodales mi. Morbi ornare dapibus nulla, at euismod risus ultricies et. In vitae malesuada metus. Sed mattis, urna ac facilisis tristique, elit dui suscipit massa, eu varius justo magna luctus erat. Vestibulum dictum lectus quam, sed imperdiet ipsum tempus eu. Nunc auctor faucibus ipsum pulvinar egestas. Mauris elementum tristique quam, vel semper nisi sodales eget. Mauris massa erat, ultrices id sapien in, pellentesque tristique nisl. Aliquam non felis tristique, imperdiet est non, dignissim velit. Nunc iaculis rhoncus dolor in porta. Nullam eget mollis nisl.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                "1.2 Vivamus dapibus magna a luctus blandit. Mauris sed euismod tellus. Nulla rutrum venenatis erat, vel auctor sapien lobortis quis. Ut venenatis lectus a dui pulvinar ultricies. Duis rhoncus ac enim quis euismod. In sed tincidunt arcu. Vestibulum est velit, imperdiet non neque id, bibendum laoreet nisi. Pellentesque sit amet maximus mauris. Integer iaculis velit at luctus pulvinar. Nulla elementum eros at egestas viverra. Duis eu mi eget sapien convallis porttitor. Vestibulum cursus lacus urna, quis consectetur est aliquam ac. In elementum viverra est at sollicitudin. Vivamus ac odio ac dui vulputate ornare. Nunc non sagittis ligula. Suspendisse congue mollis libero non varius.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                "1.2 Vivamus dapibus magna a luctus blandit. Mauris sed euismod tellus. Nulla rutrum venenatis erat, vel auctor sapien lobortis quis. Ut venenatis lectus a dui pulvinar ultricies. Duis rhoncus ac enim quis euismod. In sed tincidunt arcu. Vestibulum est velit, imperdiet non neque id, bibendum laoreet nisi. Pellentesque sit amet maximus mauris. Integer iaculis velit at luctus pulvinar. Nulla elementum eros at egestas viverra. Duis eu mi eget sapien convallis porttitor. Vestibulum cursus lacus urna, quis consectetur est aliquam ac. In elementum viverra est at sollicitudin. Vivamus ac odio ac dui vulputate ornare. Nunc non sagittis ligula. Suspendisse congue mollis libero non varius.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
