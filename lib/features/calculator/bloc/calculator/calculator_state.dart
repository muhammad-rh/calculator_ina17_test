part of 'calculator_bloc.dart';

sealed class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object> get props => [];
}

class CalculatorLoading extends CalculatorState {
  const CalculatorLoading();
}

// class CalculatorDone extends CalculatorState {
//   const CalculatorDone(List<ArticleEntity> articles) : super(articles: articles);
// }
