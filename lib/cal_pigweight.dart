class Pig{
  static const price = 112.50;
  double _weight = 0;
  double _length = 0;
  double _girth = 0;

  double get lowWeight{
    return _weight-(0.3);
  }

  double get highWeight{
    return _weight+(0.3);
  }

  double get lowPrice{
    return price*lowPrice;
  }

  double get highPrice{
    return price*highPrice;
  }

  void Calculate(double l, double g){
    _length = l;
    _girth = g;
    _weight = _girth*_girth*_length*69.3;

  }
}