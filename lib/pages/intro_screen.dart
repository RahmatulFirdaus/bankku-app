import 'package:flutter/material.dart';
import 'package:id_camp_final_project/model/intro_model.dart';
import 'package:id_camp_final_project/pages/login_page/sign_in.dart';

class IntroScreenpage extends StatefulWidget {
  const IntroScreenpage({super.key});

  @override
  State<IntroScreenpage> createState() => _IntroScreenpageState();
}

class _IntroScreenpageState extends State<IntroScreenpage> {
  late final PageController _pageController;
  List<Intromodel> introModel = [];
  var indexNow = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    introModel = Intromodel.getIntroModel();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPress() {
    if (indexNow < introModel.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutQuint,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Signinpage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.blue.shade50,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth:
                        constraints.maxWidth > 600 ? 500 : double.infinity,
                  ),
                  child: _buildContent(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        const SizedBox(height: 32),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => indexNow = index),
            itemCount: introModel.length,
            itemBuilder: (context, index) => _buildPage(introModel[index]),
          ),
        ),
        _buildPageIndicator(),
        _buildNextButton(),
      ],
    );
  }

  Widget _buildPage(Intromodel model) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 32),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset(
                model.linkGambar,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              model.judul,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              model.deskripsi,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Container(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          introModel.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: indexNow == index ? 24 : 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: indexNow == index
                  ? Colors.blue
                  : Colors.blue.withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    final isLastPage = indexNow == introModel.length - 1;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: ElevatedButton(
        onPressed: _onNextPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          minimumSize: const Size(double.infinity, 56),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isLastPage ? "Mulai" : "Selanjutnya",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            if (!isLastPage) ...[
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_rounded, size: 20),
            ],
          ],
        ),
      ),
    );
  }
}
