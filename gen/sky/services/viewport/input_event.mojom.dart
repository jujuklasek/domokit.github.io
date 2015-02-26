// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library input_event.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;

final int EventType_UNKNOWN = 0;
final int EventType_POINTER_DOWN = EventType_UNKNOWN + 1;
final int EventType_POINTER_UP = EventType_POINTER_DOWN + 1;
final int EventType_POINTER_MOVE = EventType_POINTER_UP + 1;
final int EventType_POINTER_CANCEL = EventType_POINTER_MOVE + 1;

final int PointerKind_TOUCH = 0;


class PointerData extends bindings.Struct {
  static const int kStructSize = 80;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 17);
  int pointer = 0;
  int kind = 0;
  double x = 0.0;
  double y = 0.0;
  int buttons = 0;
  double pressure = 0.0;
  double pressureMin = 0.0;
  double pressureMax = 0.0;
  double distance = 0.0;
  double distanceMin = 0.0;
  double distanceMax = 0.0;
  double radiusMajor = 0.0;
  double radiusMinor = 0.0;
  double radiusMin = 0.0;
  double radiusMax = 0.0;
  double orientation = 0.0;
  double tilt = 0.0;

  PointerData() : super(kStructSize);

  static PointerData deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static PointerData decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    PointerData result = new PointerData();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 17)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.pointer = decoder0.decodeInt32(8);
    }
    {
      
      result.kind = decoder0.decodeInt32(12);
    }
    {
      
      result.x = decoder0.decodeFloat(16);
    }
    {
      
      result.y = decoder0.decodeFloat(20);
    }
    {
      
      result.buttons = decoder0.decodeInt32(24);
    }
    {
      
      result.pressure = decoder0.decodeFloat(28);
    }
    {
      
      result.pressureMin = decoder0.decodeFloat(32);
    }
    {
      
      result.pressureMax = decoder0.decodeFloat(36);
    }
    {
      
      result.distance = decoder0.decodeFloat(40);
    }
    {
      
      result.distanceMin = decoder0.decodeFloat(44);
    }
    {
      
      result.distanceMax = decoder0.decodeFloat(48);
    }
    {
      
      result.radiusMajor = decoder0.decodeFloat(52);
    }
    {
      
      result.radiusMinor = decoder0.decodeFloat(56);
    }
    {
      
      result.radiusMin = decoder0.decodeFloat(60);
    }
    {
      
      result.radiusMax = decoder0.decodeFloat(64);
    }
    {
      
      result.orientation = decoder0.decodeFloat(68);
    }
    {
      
      result.tilt = decoder0.decodeFloat(72);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(pointer, 8);
    
    encoder0.encodeInt32(kind, 12);
    
    encoder0.encodeFloat(x, 16);
    
    encoder0.encodeFloat(y, 20);
    
    encoder0.encodeInt32(buttons, 24);
    
    encoder0.encodeFloat(pressure, 28);
    
    encoder0.encodeFloat(pressureMin, 32);
    
    encoder0.encodeFloat(pressureMax, 36);
    
    encoder0.encodeFloat(distance, 40);
    
    encoder0.encodeFloat(distanceMin, 44);
    
    encoder0.encodeFloat(distanceMax, 48);
    
    encoder0.encodeFloat(radiusMajor, 52);
    
    encoder0.encodeFloat(radiusMinor, 56);
    
    encoder0.encodeFloat(radiusMin, 60);
    
    encoder0.encodeFloat(radiusMax, 64);
    
    encoder0.encodeFloat(orientation, 68);
    
    encoder0.encodeFloat(tilt, 72);
  }
}

class InputEvent extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  int type = 0;
  int timeStamp = 0;
  PointerData pointerData = null;

  InputEvent() : super(kStructSize);

  static InputEvent deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static InputEvent decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    InputEvent result = new InputEvent();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.type = decoder0.decodeInt32(8);
    }
    {
      
      result.timeStamp = decoder0.decodeInt64(16);
    }
    {
      
      var decoder1 = decoder0.decodePointer(24, true);
      result.pointerData = PointerData.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(type, 8);
    
    encoder0.encodeInt64(timeStamp, 16);
    
    encoder0.encodeStruct(pointerData, 24, true);
  }
}

