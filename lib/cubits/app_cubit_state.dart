import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
import 'package:hiking_travel/pages/models/data_model.dart';

abstract class CubitSate extends Equatable {}

class InitialState extends CubitSate {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitSate {
  @override
  List<Object> get props => [];
}

// for loading data state from json

class LoadingState extends CubitSate {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitSate {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

// create a new function in cubit app / app cubit.

class DetailState extends CubitSate {
  DetailState(this.place);
  final DataModel place;
  @override
  List<Object> get props => [place];
}