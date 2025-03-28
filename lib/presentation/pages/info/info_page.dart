import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:penta_core/penta_core.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Info')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Attributes', style: context.ext.theme.textTheme.titleLarge),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Icons Attribution',
                    style: context.ext.theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  Html(
                    data: '''
                  <ul>
                  <li><a href="https://www.flaticon.com/free-animated-icons/breakfast" title="breakfast animated icons">Breakfast animated icons created by Freepik - Flaticon</a></li>
                  <li><a href="https://www.flaticon.com/free-animated-icons/pasta" title="pasta animated icons">Pasta animated icons created by Freepik - Flaticon</a></li>
                  <li><a href="https://www.flaticon.com/free-animated-icons/dish" title="dish animated icons">Dish animated icons created by Freepik - Flaticon</a></li>
                  <li><a href="https://www.flaticon.com/free-animated-icons/nachos" title="nachos animated icons">Nachos animated icons created by Freepik - Flaticon</a></li>
                  <li><a href="https://www.flaticon.com/free-animated-icons/recipe" title="recipe animated icons">Recipe animated icons created by Freepik - Flaticon</a></li>
                  </ul>
                ''',
                    style: {
                      'a': Style(
                        color: Colors.blue,
                        fontSize: FontSize(14),
                        fontWeight: FontWeight.w500,
                        textDecoration: TextDecoration.none,
                      ),
                      'ul': Style(
                        padding: HtmlPaddings.all(0),
                        margin: Margins.all(0),
                      ),
                      'li': Style(margin: Margins.only(bottom: 5)),
                    },
                    onLinkTap: (url, attributes, element) {
                      if (url != null) {
                        launchUrl(
                          Uri.parse(url),
                          mode: LaunchMode.inAppBrowserView,
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
