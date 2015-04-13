// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../animation/generators.dart';
import '../animation/mechanics.dart';
import '../animation/scroll_behavior.dart';
import '../fn.dart';
import '../theme/view-configuration.dart' as config;
import 'dart:math' as math;
import 'dart:sky' as sky;

const double _kMillisecondsPerSecond = 1000.0;

double _velocityForFlingGesture(sky.GestureEvent event) {
  return math.max(-config.kMaxFlingVelocity, math.min(config.kMaxFlingVelocity,
      -event.velocityY)) / _kMillisecondsPerSecond;
}

abstract class Scrollable extends Component {
  ScrollBehavior scrollBehavior;
  double get scrollOffset => _scrollOffset;

  double _scrollOffset = 0.0;
  Simulation _simulation;

  Scrollable({Object key, this.scrollBehavior}) : super(key: key) {
    onDidUnmount(_stopSimulation);
  }

  UINode buildContent();

  UINode build() {
    return new EventListenerNode(
      buildContent(),
      onPointerDown: _handlePointerDown,
      onPointerUp: _handlePointerUpOrCancel,
      onPointerCancel: _handlePointerUpOrCancel,
      onGestureFlingStart: _handleFlingStart,
      onGestureFlingCancel: _handleFlingCancel,
      onGestureScrollUpdate: _handleScrollUpdate,
      onWheel: _handleWheel
    );
  }

  bool scrollTo(double newScrollOffset) {
    if (newScrollOffset == _scrollOffset)
      return false;
    setState(() {
      _scrollOffset = newScrollOffset;
    });
    return true;
  }

  bool scrollBy(double scrollDelta) {
    var newScrollOffset = scrollBehavior.applyCurve(_scrollOffset, scrollDelta);
    return scrollTo(newScrollOffset);
  }

  void _stopSimulation() {
    if (_simulation == null)
      return;
    _simulation.cancel();
    _simulation = null;
  }

  void _startSimulation(Particle particle) {
    _stopSimulation();
    _simulation = scrollBehavior.release(particle);
    if (_simulation == null)
      return;
    _simulation.onTick.listen((_) {
      setState(() {
        _scrollOffset = particle.position;
      });
    });
  }

  Particle _createParticle([double velocity = 0.0]) {
    return new Particle(position: _scrollOffset, velocity: velocity);
  }

  void _handlePointerDown(_) {
    _stopSimulation();
  }

  void _handlePointerUpOrCancel(_) {
    if (_simulation == null)
      _startSimulation(_createParticle());
  }

  void _handleScrollUpdate(sky.GestureEvent event) {
    scrollBy(-event.dy);
  }

  void _handleFlingStart(sky.GestureEvent event) {
    _startSimulation(_createParticle(_velocityForFlingGesture(event)));
  }

  void _handleFlingCancel(sky.GestureEvent event) {
    _startSimulation(_createParticle());
  }

  void _handleWheel(sky.WheelEvent event) {
    scrollBy(-event.offsetY);
  }
}
