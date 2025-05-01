import 'package:flutter/material.dart';

class Constants {
  // Private constructor to prevent instantiation
  const Constants._();

  // Animation Durations
  static const bubbleAnimation = Duration(milliseconds: 400);
  static const carouselAutoPlay = Duration(seconds: 5);
  static const textAnimation = Duration(milliseconds: 300);
  static const minLoadingTime = Duration(milliseconds: 1000);
  static const animationSpeed = Duration(milliseconds: 100);
  static const typingSpeed = Duration(milliseconds: 200);
  static const opacityDuration = Duration(seconds: 1);

  // UI Constants
  static const double borderWidth = 0.7;
  static const double titleFontSize = 36.0;

  // Carousel constants
  static const carouselScrollSpeed = 0.5;
  static const carouselAnimationDuration = Duration(seconds: 1);
  static const skillItemHoverDuration = Duration(milliseconds: 150);
  static const skillItemHoverCurve = Curves.linear;
}
