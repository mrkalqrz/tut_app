abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOuputs {
  // shared varialables and function that will be used through any new model.

}

abstract class BaseViewModelInputs {
  void start(); // will be called while init. of view model
  void dispose(); // will be called when view model dies.
}

abstract class BaseViewModelOuputs {}
