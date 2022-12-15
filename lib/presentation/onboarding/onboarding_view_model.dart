import 'package:flutter_application_sample/presentation/base/base_view_model.dart';

class OnboardingViewModel extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs {
  // stream controller

  //inputs
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
}

// inputs mean the orders that our view model will receive from our view
abstract class OnboardingViewModelInputs {
  void goNext(); // when user clicks on right arrow or swipe right
  void goPrevious(); // when user clicks on left arrow or swipe left
  void onPageChanged(int index);
}

// outputs mean data or results that will be sent from our view model to our view
abstract class OnboardingViewModelOutputs {
  // will be inplement it later
}
