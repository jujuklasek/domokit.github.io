// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library view_manager.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/geometry/public/interfaces/geometry.mojom.dart' as geometry_mojom;
import 'package:mojo/services/input_events/public/interfaces/input_events.mojom.dart' as input_events_mojom;
import 'package:mojo/public/interfaces/application/service_provider.mojom.dart' as service_provider_mojom;
import 'package:mojo/services/native_viewport/public/interfaces/native_viewport.mojom.dart' as native_viewport_mojom;
import 'package:mojo/services/surfaces/public/interfaces/surface_id.mojom.dart' as surface_id_mojom;
import 'package:mojo/services/view_manager/public/interfaces/view_manager_constants.mojom.dart' as view_manager_constants_mojom;

final int ErrorCode_NONE = 0;
final int ErrorCode_VALUE_IN_USE = ErrorCode_NONE + 1;
final int ErrorCode_ILLEGAL_ARGUMENT = ErrorCode_VALUE_IN_USE + 1;


class ViewData extends bindings.Struct {
  static const int kStructSize = 48;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 7);
  int parentId = 0;
  int viewId = 0;
  geometry_mojom.Rect bounds = null;
  Map<String, List<int>> properties = null;
  bool visible = false;
  bool drawn = false;
  native_viewport_mojom.ViewportMetrics viewportMetrics = null;

  ViewData() : super(kStructSize);

  static ViewData deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewData decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewData result = new ViewData();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 7)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.parentId = decoder0.decodeUint32(8);
    }
    {
      
      result.viewId = decoder0.decodeUint32(12);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.bounds = geometry_mojom.Rect.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(24, false);
      {
        decoder1.decodeDataHeaderForMap();
        List<String> keys0;
        List<List<int>> values0;
        {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize, false);
          {
            var si2 = decoder2.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
            keys0 = new List<String>(si2.numElements);
            for (int i2 = 0; i2 < si2.numElements; ++i2) {
              
              keys0[i2] = decoder2.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i2, false);
            }
          }
        }
        {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize, false);
          {
            var si2 = decoder2.decodeDataHeaderForPointerArray(keys0.length);
            values0 = new List<List<int>>(si2.numElements);
            for (int i2 = 0; i2 < si2.numElements; ++i2) {
              
              values0[i2] = decoder2.decodeUint8Array(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i2, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
            }
          }
        }
        result.properties = new Map<String, List<int>>.fromIterables(
            keys0, values0);
      }
    }
    {
      
      result.visible = decoder0.decodeBool(32, 0);
    }
    {
      
      result.drawn = decoder0.decodeBool(32, 1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(40, false);
      result.viewportMetrics = native_viewport_mojom.ViewportMetrics.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(parentId, 8);
    
    encoder0.encodeUint32(viewId, 12);
    
    encoder0.encodeStruct(bounds, 16, false);
    
    if (properties == null) {
      encoder0.encodeNullPointer(24, false);
    } else {
      var encoder1 = encoder0.encoderForMap(24);
      int size0 = properties.length;
      var keys0 = properties.keys.toList();
      var values0 = properties.values.toList();
      
      {
        var encoder2 = encoder1.encodePointerArray(keys0.length, bindings.ArrayDataHeader.kHeaderSize, bindings.kUnspecifiedArrayLength);
        for (int i1 = 0; i1 < keys0.length; ++i1) {
          
          encoder2.encodeString(keys0[i1], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
      
      {
        var encoder2 = encoder1.encodePointerArray(values0.length, bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize, bindings.kUnspecifiedArrayLength);
        for (int i1 = 0; i1 < values0.length; ++i1) {
          
          encoder2.encodeUint8Array(values0[i1], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, bindings.kNothingNullable, bindings.kUnspecifiedArrayLength);
        }
      }
    }
    
    encoder0.encodeBool(visible, 32, 0);
    
    encoder0.encodeBool(drawn, 32, 1);
    
    encoder0.encodeStruct(viewportMetrics, 40, false);
  }
}

class ViewManagerServiceCreateViewParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int viewId = 0;

  ViewManagerServiceCreateViewParams() : super(kStructSize);

  static ViewManagerServiceCreateViewParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceCreateViewParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceCreateViewParams result = new ViewManagerServiceCreateViewParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewId = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
  }
}

class ViewManagerServiceCreateViewResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int errorCode = 0;

  ViewManagerServiceCreateViewResponseParams() : super(kStructSize);

  static ViewManagerServiceCreateViewResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceCreateViewResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceCreateViewResponseParams result = new ViewManagerServiceCreateViewResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.errorCode = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(errorCode, 8);
  }
}

class ViewManagerServiceDeleteViewParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int viewId = 0;

  ViewManagerServiceDeleteViewParams() : super(kStructSize);

  static ViewManagerServiceDeleteViewParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceDeleteViewParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceDeleteViewParams result = new ViewManagerServiceDeleteViewParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewId = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
  }
}

class ViewManagerServiceDeleteViewResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  ViewManagerServiceDeleteViewResponseParams() : super(kStructSize);

  static ViewManagerServiceDeleteViewResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceDeleteViewResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceDeleteViewResponseParams result = new ViewManagerServiceDeleteViewResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }
}

class ViewManagerServiceSetViewBoundsParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int viewId = 0;
  geometry_mojom.Rect bounds = null;

  ViewManagerServiceSetViewBoundsParams() : super(kStructSize);

  static ViewManagerServiceSetViewBoundsParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceSetViewBoundsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceSetViewBoundsParams result = new ViewManagerServiceSetViewBoundsParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewId = decoder0.decodeUint32(8);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.bounds = geometry_mojom.Rect.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
    
    encoder0.encodeStruct(bounds, 16, false);
  }
}

class ViewManagerServiceSetViewBoundsResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  ViewManagerServiceSetViewBoundsResponseParams() : super(kStructSize);

  static ViewManagerServiceSetViewBoundsResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceSetViewBoundsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceSetViewBoundsResponseParams result = new ViewManagerServiceSetViewBoundsResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }
}

class ViewManagerServiceSetViewVisibilityParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int viewId = 0;
  bool visible = false;

  ViewManagerServiceSetViewVisibilityParams() : super(kStructSize);

  static ViewManagerServiceSetViewVisibilityParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceSetViewVisibilityParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceSetViewVisibilityParams result = new ViewManagerServiceSetViewVisibilityParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewId = decoder0.decodeUint32(8);
    }
    {
      
      result.visible = decoder0.decodeBool(12, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
    
    encoder0.encodeBool(visible, 12, 0);
  }
}

class ViewManagerServiceSetViewVisibilityResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  ViewManagerServiceSetViewVisibilityResponseParams() : super(kStructSize);

  static ViewManagerServiceSetViewVisibilityResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceSetViewVisibilityResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceSetViewVisibilityResponseParams result = new ViewManagerServiceSetViewVisibilityResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }
}

class ViewManagerServiceSetViewPropertyParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  int viewId = 0;
  String name = null;
  List<int> value = null;

  ViewManagerServiceSetViewPropertyParams() : super(kStructSize);

  static ViewManagerServiceSetViewPropertyParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceSetViewPropertyParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceSetViewPropertyParams result = new ViewManagerServiceSetViewPropertyParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewId = decoder0.decodeUint32(8);
    }
    {
      
      result.name = decoder0.decodeString(16, false);
    }
    {
      
      result.value = decoder0.decodeUint8Array(24, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
    
    encoder0.encodeString(name, 16, false);
    
    encoder0.encodeUint8Array(value, 24, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
  }
}

class ViewManagerServiceSetViewPropertyResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  ViewManagerServiceSetViewPropertyResponseParams() : super(kStructSize);

  static ViewManagerServiceSetViewPropertyResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceSetViewPropertyResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceSetViewPropertyResponseParams result = new ViewManagerServiceSetViewPropertyResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }
}

class ViewManagerServiceAddViewParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int parent = 0;
  int child = 0;

  ViewManagerServiceAddViewParams() : super(kStructSize);

  static ViewManagerServiceAddViewParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceAddViewParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceAddViewParams result = new ViewManagerServiceAddViewParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.parent = decoder0.decodeUint32(8);
    }
    {
      
      result.child = decoder0.decodeUint32(12);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(parent, 8);
    
    encoder0.encodeUint32(child, 12);
  }
}

class ViewManagerServiceAddViewResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  ViewManagerServiceAddViewResponseParams() : super(kStructSize);

  static ViewManagerServiceAddViewResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceAddViewResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceAddViewResponseParams result = new ViewManagerServiceAddViewResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }
}

class ViewManagerServiceRemoveViewFromParentParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int viewId = 0;

  ViewManagerServiceRemoveViewFromParentParams() : super(kStructSize);

  static ViewManagerServiceRemoveViewFromParentParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceRemoveViewFromParentParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceRemoveViewFromParentParams result = new ViewManagerServiceRemoveViewFromParentParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewId = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
  }
}

class ViewManagerServiceRemoveViewFromParentResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  ViewManagerServiceRemoveViewFromParentResponseParams() : super(kStructSize);

  static ViewManagerServiceRemoveViewFromParentResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceRemoveViewFromParentResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceRemoveViewFromParentResponseParams result = new ViewManagerServiceRemoveViewFromParentResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }
}

class ViewManagerServiceReorderViewParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  int viewId = 0;
  int relativeViewId = 0;
  int direction = 0;

  ViewManagerServiceReorderViewParams() : super(kStructSize);

  static ViewManagerServiceReorderViewParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceReorderViewParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceReorderViewParams result = new ViewManagerServiceReorderViewParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewId = decoder0.decodeUint32(8);
    }
    {
      
      result.relativeViewId = decoder0.decodeUint32(12);
    }
    {
      
      result.direction = decoder0.decodeInt32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
    
    encoder0.encodeUint32(relativeViewId, 12);
    
    encoder0.encodeInt32(direction, 16);
  }
}

class ViewManagerServiceReorderViewResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  ViewManagerServiceReorderViewResponseParams() : super(kStructSize);

  static ViewManagerServiceReorderViewResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceReorderViewResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceReorderViewResponseParams result = new ViewManagerServiceReorderViewResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }
}

class ViewManagerServiceGetViewTreeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int viewId = 0;

  ViewManagerServiceGetViewTreeParams() : super(kStructSize);

  static ViewManagerServiceGetViewTreeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceGetViewTreeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceGetViewTreeParams result = new ViewManagerServiceGetViewTreeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewId = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
  }
}

class ViewManagerServiceGetViewTreeResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  List<ViewData> views = null;

  ViewManagerServiceGetViewTreeResponseParams() : super(kStructSize);

  static ViewManagerServiceGetViewTreeResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceGetViewTreeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceGetViewTreeResponseParams result = new ViewManagerServiceGetViewTreeResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.views = new List<ViewData>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.views[i1] = ViewData.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    if (views == null) {
      encoder0.encodeNullPointer(8, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(views.length, 8, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < views.length; ++i0) {
        
        encoder1.encodeStruct(views[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }
}

class ViewManagerServiceSetViewSurfaceIdParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int viewId = 0;
  surface_id_mojom.SurfaceId surfaceId = null;

  ViewManagerServiceSetViewSurfaceIdParams() : super(kStructSize);

  static ViewManagerServiceSetViewSurfaceIdParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceSetViewSurfaceIdParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceSetViewSurfaceIdParams result = new ViewManagerServiceSetViewSurfaceIdParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewId = decoder0.decodeUint32(8);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.surfaceId = surface_id_mojom.SurfaceId.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
    
    encoder0.encodeStruct(surfaceId, 16, false);
  }
}

class ViewManagerServiceSetViewSurfaceIdResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  ViewManagerServiceSetViewSurfaceIdResponseParams() : super(kStructSize);

  static ViewManagerServiceSetViewSurfaceIdResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceSetViewSurfaceIdResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceSetViewSurfaceIdResponseParams result = new ViewManagerServiceSetViewSurfaceIdResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }
}

class ViewManagerServiceEmbedUrlParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 4);
  String url = null;
  int viewId = 0;
  Object services = null;
  Object exposedServices = null;

  ViewManagerServiceEmbedUrlParams() : super(kStructSize);

  static ViewManagerServiceEmbedUrlParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceEmbedUrlParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceEmbedUrlParams result = new ViewManagerServiceEmbedUrlParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 4)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.url = decoder0.decodeString(8, false);
    }
    {
      
      result.viewId = decoder0.decodeUint32(16);
    }
    {
      
      result.services = decoder0.decodeInterfaceRequest(20, true, service_provider_mojom.ServiceProviderStub.newFromEndpoint);
    }
    {
      
      result.exposedServices = decoder0.decodeServiceInterface(24, true, service_provider_mojom.ServiceProviderProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(url, 8, false);
    
    encoder0.encodeUint32(viewId, 16);
    
    encoder0.encodeInterfaceRequest(services, 20, true);
    
    encoder0.encodeInterface(exposedServices, 24, true);
  }
}

class ViewManagerServiceEmbedUrlResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  ViewManagerServiceEmbedUrlResponseParams() : super(kStructSize);

  static ViewManagerServiceEmbedUrlResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceEmbedUrlResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceEmbedUrlResponseParams result = new ViewManagerServiceEmbedUrlResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }
}

class ViewManagerServiceEmbedParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int viewId = 0;
  Object client = null;

  ViewManagerServiceEmbedParams() : super(kStructSize);

  static ViewManagerServiceEmbedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceEmbedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceEmbedParams result = new ViewManagerServiceEmbedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewId = decoder0.decodeUint32(8);
    }
    {
      
      result.client = decoder0.decodeServiceInterface(12, false, ViewManagerClientProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
    
    encoder0.encodeInterface(client, 12, false);
  }
}

class ViewManagerServiceEmbedResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  ViewManagerServiceEmbedResponseParams() : super(kStructSize);

  static ViewManagerServiceEmbedResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServiceEmbedResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServiceEmbedResponseParams result = new ViewManagerServiceEmbedResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }
}

class ViewManagerServicePerformActionParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int viewId = 0;
  String action = null;

  ViewManagerServicePerformActionParams() : super(kStructSize);

  static ViewManagerServicePerformActionParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServicePerformActionParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServicePerformActionParams result = new ViewManagerServicePerformActionParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewId = decoder0.decodeUint32(8);
    }
    {
      
      result.action = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
    
    encoder0.encodeString(action, 16, false);
  }
}

class ViewManagerServicePerformActionResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  ViewManagerServicePerformActionResponseParams() : super(kStructSize);

  static ViewManagerServicePerformActionResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerServicePerformActionResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerServicePerformActionResponseParams result = new ViewManagerServicePerformActionResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }
}

class ViewManagerClientOnEmbedParams extends bindings.Struct {
  static const int kStructSize = 48;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 7);
  int connectionId = 0;
  Object viewManagerService = null;
  String embedderUrl = null;
  ViewData root = null;
  Object services = null;
  Object exposedServices = null;
  core.MojoMessagePipeEndpoint windowManagerPipe = null;

  ViewManagerClientOnEmbedParams() : super(kStructSize);

  static ViewManagerClientOnEmbedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnEmbedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnEmbedParams result = new ViewManagerClientOnEmbedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 7)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.connectionId = decoder0.decodeUint16(8);
    }
    {
      
      result.viewManagerService = decoder0.decodeServiceInterface(12, true, ViewManagerServiceProxy.newFromEndpoint);
    }
    {
      
      result.embedderUrl = decoder0.decodeString(16, false);
    }
    {
      
      var decoder1 = decoder0.decodePointer(24, false);
      result.root = ViewData.decode(decoder1);
    }
    {
      
      result.services = decoder0.decodeInterfaceRequest(32, true, service_provider_mojom.ServiceProviderStub.newFromEndpoint);
    }
    {
      
      result.exposedServices = decoder0.decodeServiceInterface(36, true, service_provider_mojom.ServiceProviderProxy.newFromEndpoint);
    }
    {
      
      result.windowManagerPipe = decoder0.decodeMessagePipeHandle(40, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint16(connectionId, 8);
    
    encoder0.encodeInterface(viewManagerService, 12, true);
    
    encoder0.encodeString(embedderUrl, 16, false);
    
    encoder0.encodeStruct(root, 24, false);
    
    encoder0.encodeInterfaceRequest(services, 32, true);
    
    encoder0.encodeInterface(exposedServices, 36, true);
    
    encoder0.encodeMessagePipeHandle(windowManagerPipe, 40, false);
  }
}

class ViewManagerClientOnEmbeddedAppDisconnectedParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int view = 0;

  ViewManagerClientOnEmbeddedAppDisconnectedParams() : super(kStructSize);

  static ViewManagerClientOnEmbeddedAppDisconnectedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnEmbeddedAppDisconnectedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnEmbeddedAppDisconnectedParams result = new ViewManagerClientOnEmbeddedAppDisconnectedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.view = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(view, 8);
  }
}

class ViewManagerClientOnViewBoundsChangedParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  int view = 0;
  geometry_mojom.Rect oldBounds = null;
  geometry_mojom.Rect newBounds = null;

  ViewManagerClientOnViewBoundsChangedParams() : super(kStructSize);

  static ViewManagerClientOnViewBoundsChangedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnViewBoundsChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnViewBoundsChangedParams result = new ViewManagerClientOnViewBoundsChangedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.view = decoder0.decodeUint32(8);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.oldBounds = geometry_mojom.Rect.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(24, false);
      result.newBounds = geometry_mojom.Rect.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(view, 8);
    
    encoder0.encodeStruct(oldBounds, 16, false);
    
    encoder0.encodeStruct(newBounds, 24, false);
  }
}

class ViewManagerClientOnViewViewportMetricsChangedParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  native_viewport_mojom.ViewportMetrics oldMetrics = null;
  native_viewport_mojom.ViewportMetrics newMetrics = null;

  ViewManagerClientOnViewViewportMetricsChangedParams() : super(kStructSize);

  static ViewManagerClientOnViewViewportMetricsChangedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnViewViewportMetricsChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnViewViewportMetricsChangedParams result = new ViewManagerClientOnViewViewportMetricsChangedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.oldMetrics = native_viewport_mojom.ViewportMetrics.decode(decoder1);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.newMetrics = native_viewport_mojom.ViewportMetrics.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(oldMetrics, 8, false);
    
    encoder0.encodeStruct(newMetrics, 16, false);
  }
}

class ViewManagerClientOnViewHierarchyChangedParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 4);
  int view = 0;
  int newParent = 0;
  int oldParent = 0;
  List<ViewData> views = null;

  ViewManagerClientOnViewHierarchyChangedParams() : super(kStructSize);

  static ViewManagerClientOnViewHierarchyChangedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnViewHierarchyChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnViewHierarchyChangedParams result = new ViewManagerClientOnViewHierarchyChangedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 4)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.view = decoder0.decodeUint32(8);
    }
    {
      
      result.newParent = decoder0.decodeUint32(12);
    }
    {
      
      result.oldParent = decoder0.decodeUint32(16);
    }
    {
      
      var decoder1 = decoder0.decodePointer(24, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.views = new List<ViewData>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.views[i1] = ViewData.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(view, 8);
    
    encoder0.encodeUint32(newParent, 12);
    
    encoder0.encodeUint32(oldParent, 16);
    
    if (views == null) {
      encoder0.encodeNullPointer(24, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(views.length, 24, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < views.length; ++i0) {
        
        encoder1.encodeStruct(views[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }
}

class ViewManagerClientOnViewReorderedParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  int viewId = 0;
  int relativeViewId = 0;
  int direction = 0;

  ViewManagerClientOnViewReorderedParams() : super(kStructSize);

  static ViewManagerClientOnViewReorderedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnViewReorderedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnViewReorderedParams result = new ViewManagerClientOnViewReorderedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewId = decoder0.decodeUint32(8);
    }
    {
      
      result.relativeViewId = decoder0.decodeUint32(12);
    }
    {
      
      result.direction = decoder0.decodeInt32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
    
    encoder0.encodeUint32(relativeViewId, 12);
    
    encoder0.encodeInt32(direction, 16);
  }
}

class ViewManagerClientOnViewDeletedParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int view = 0;

  ViewManagerClientOnViewDeletedParams() : super(kStructSize);

  static ViewManagerClientOnViewDeletedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnViewDeletedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnViewDeletedParams result = new ViewManagerClientOnViewDeletedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.view = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(view, 8);
  }
}

class ViewManagerClientOnViewVisibilityChangedParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int view = 0;
  bool visible = false;

  ViewManagerClientOnViewVisibilityChangedParams() : super(kStructSize);

  static ViewManagerClientOnViewVisibilityChangedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnViewVisibilityChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnViewVisibilityChangedParams result = new ViewManagerClientOnViewVisibilityChangedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.view = decoder0.decodeUint32(8);
    }
    {
      
      result.visible = decoder0.decodeBool(12, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(view, 8);
    
    encoder0.encodeBool(visible, 12, 0);
  }
}

class ViewManagerClientOnViewDrawnStateChangedParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int view = 0;
  bool drawn = false;

  ViewManagerClientOnViewDrawnStateChangedParams() : super(kStructSize);

  static ViewManagerClientOnViewDrawnStateChangedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnViewDrawnStateChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnViewDrawnStateChangedParams result = new ViewManagerClientOnViewDrawnStateChangedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.view = decoder0.decodeUint32(8);
    }
    {
      
      result.drawn = decoder0.decodeBool(12, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(view, 8);
    
    encoder0.encodeBool(drawn, 12, 0);
  }
}

class ViewManagerClientOnViewSharedPropertyChangedParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  int view = 0;
  String name = null;
  List<int> newData = null;

  ViewManagerClientOnViewSharedPropertyChangedParams() : super(kStructSize);

  static ViewManagerClientOnViewSharedPropertyChangedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnViewSharedPropertyChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnViewSharedPropertyChangedParams result = new ViewManagerClientOnViewSharedPropertyChangedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.view = decoder0.decodeUint32(8);
    }
    {
      
      result.name = decoder0.decodeString(16, false);
    }
    {
      
      result.newData = decoder0.decodeUint8Array(24, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(view, 8);
    
    encoder0.encodeString(name, 16, false);
    
    encoder0.encodeUint8Array(newData, 24, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
  }
}

class ViewManagerClientOnViewInputEventParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int view = 0;
  input_events_mojom.Event event = null;

  ViewManagerClientOnViewInputEventParams() : super(kStructSize);

  static ViewManagerClientOnViewInputEventParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnViewInputEventParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnViewInputEventParams result = new ViewManagerClientOnViewInputEventParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.view = decoder0.decodeUint32(8);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.event = input_events_mojom.Event.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(view, 8);
    
    encoder0.encodeStruct(event, 16, false);
  }
}

class ViewManagerClientOnViewInputEventResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  ViewManagerClientOnViewInputEventResponseParams() : super(kStructSize);

  static ViewManagerClientOnViewInputEventResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnViewInputEventResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnViewInputEventResponseParams result = new ViewManagerClientOnViewInputEventResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kDefaultStructInfo);
  }
}

class ViewManagerClientOnPerformActionParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int viewId = 0;
  String action = null;

  ViewManagerClientOnPerformActionParams() : super(kStructSize);

  static ViewManagerClientOnPerformActionParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnPerformActionParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnPerformActionParams result = new ViewManagerClientOnPerformActionParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewId = decoder0.decodeUint32(8);
    }
    {
      
      result.action = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
    
    encoder0.encodeString(action, 16, false);
  }
}

class ViewManagerClientOnPerformActionResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  ViewManagerClientOnPerformActionResponseParams() : super(kStructSize);

  static ViewManagerClientOnPerformActionResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewManagerClientOnPerformActionResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewManagerClientOnPerformActionResponseParams result = new ViewManagerClientOnPerformActionResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.success = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(success, 8, 0);
  }
}
const int kViewManagerService_createView_name = 0;
const int kViewManagerService_deleteView_name = 1;
const int kViewManagerService_setViewBounds_name = 2;
const int kViewManagerService_setViewVisibility_name = 3;
const int kViewManagerService_setViewProperty_name = 4;
const int kViewManagerService_addView_name = 5;
const int kViewManagerService_removeViewFromParent_name = 6;
const int kViewManagerService_reorderView_name = 7;
const int kViewManagerService_getViewTree_name = 8;
const int kViewManagerService_setViewSurfaceId_name = 9;
const int kViewManagerService_embedUrl_name = 10;
const int kViewManagerService_embed_name = 11;
const int kViewManagerService_performAction_name = 12;

abstract class ViewManagerService implements core.Listener {
  static const String name = 'mojo::ViewManagerService';
  ViewManagerServiceStub stub;

  ViewManagerService(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ViewManagerServiceStub(endpoint);

  ViewManagerService.fromHandle(core.MojoHandle handle) :
      stub = new ViewManagerServiceStub.fromHandle(handle);

  ViewManagerService.fromStub(this.stub);

  ViewManagerService.unbound() :
      stub = new ViewManagerServiceStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  ViewManagerService get delegate => stub.delegate;
  set delegate(ViewManagerService d) {
    stub.delegate = d;
  }
  Future<ViewManagerServiceCreateViewResponseParams> createView(int viewId,[Function responseFactory = null]);
  Future<ViewManagerServiceDeleteViewResponseParams> deleteView(int viewId,[Function responseFactory = null]);
  Future<ViewManagerServiceSetViewBoundsResponseParams> setViewBounds(int viewId,geometry_mojom.Rect bounds,[Function responseFactory = null]);
  Future<ViewManagerServiceSetViewVisibilityResponseParams> setViewVisibility(int viewId,bool visible,[Function responseFactory = null]);
  Future<ViewManagerServiceSetViewPropertyResponseParams> setViewProperty(int viewId,String name,List<int> value,[Function responseFactory = null]);
  Future<ViewManagerServiceAddViewResponseParams> addView(int parent,int child,[Function responseFactory = null]);
  Future<ViewManagerServiceRemoveViewFromParentResponseParams> removeViewFromParent(int viewId,[Function responseFactory = null]);
  Future<ViewManagerServiceReorderViewResponseParams> reorderView(int viewId,int relativeViewId,int direction,[Function responseFactory = null]);
  Future<ViewManagerServiceGetViewTreeResponseParams> getViewTree(int viewId,[Function responseFactory = null]);
  Future<ViewManagerServiceSetViewSurfaceIdResponseParams> setViewSurfaceId(int viewId,surface_id_mojom.SurfaceId surfaceId,[Function responseFactory = null]);
  Future<ViewManagerServiceEmbedUrlResponseParams> embedUrl(String url,int viewId,Object services,Object exposedServices,[Function responseFactory = null]);
  Future<ViewManagerServiceEmbedResponseParams> embed(int viewId,Object client,[Function responseFactory = null]);
  Future<ViewManagerServicePerformActionResponseParams> performAction(int viewId,String action,[Function responseFactory = null]);

}

class ViewManagerServiceProxy extends bindings.Proxy implements ViewManagerService {
  ViewManagerServiceProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ViewManagerServiceProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ViewManagerServiceProxy.unbound() : super.unbound();

  String get name => ViewManagerService.name;

  static ViewManagerServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ViewManagerServiceProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kViewManagerService_createView_name:
        var r = ViewManagerServiceCreateViewResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kViewManagerService_deleteView_name:
        var r = ViewManagerServiceDeleteViewResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kViewManagerService_setViewBounds_name:
        var r = ViewManagerServiceSetViewBoundsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kViewManagerService_setViewVisibility_name:
        var r = ViewManagerServiceSetViewVisibilityResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kViewManagerService_setViewProperty_name:
        var r = ViewManagerServiceSetViewPropertyResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kViewManagerService_addView_name:
        var r = ViewManagerServiceAddViewResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kViewManagerService_removeViewFromParent_name:
        var r = ViewManagerServiceRemoveViewFromParentResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kViewManagerService_reorderView_name:
        var r = ViewManagerServiceReorderViewResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kViewManagerService_getViewTree_name:
        var r = ViewManagerServiceGetViewTreeResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kViewManagerService_setViewSurfaceId_name:
        var r = ViewManagerServiceSetViewSurfaceIdResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kViewManagerService_embedUrl_name:
        var r = ViewManagerServiceEmbedUrlResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kViewManagerService_embed_name:
        var r = ViewManagerServiceEmbedResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kViewManagerService_performAction_name:
        var r = ViewManagerServicePerformActionResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  Future<ViewManagerServiceCreateViewResponseParams> createView(int viewId,[Function responseFactory = null]) {
    var params = new ViewManagerServiceCreateViewParams();
    params.viewId = viewId;
    return sendMessageWithRequestId(
        params,
        kViewManagerService_createView_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ViewManagerServiceDeleteViewResponseParams> deleteView(int viewId,[Function responseFactory = null]) {
    var params = new ViewManagerServiceDeleteViewParams();
    params.viewId = viewId;
    return sendMessageWithRequestId(
        params,
        kViewManagerService_deleteView_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ViewManagerServiceSetViewBoundsResponseParams> setViewBounds(int viewId,geometry_mojom.Rect bounds,[Function responseFactory = null]) {
    var params = new ViewManagerServiceSetViewBoundsParams();
    params.viewId = viewId;
    params.bounds = bounds;
    return sendMessageWithRequestId(
        params,
        kViewManagerService_setViewBounds_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ViewManagerServiceSetViewVisibilityResponseParams> setViewVisibility(int viewId,bool visible,[Function responseFactory = null]) {
    var params = new ViewManagerServiceSetViewVisibilityParams();
    params.viewId = viewId;
    params.visible = visible;
    return sendMessageWithRequestId(
        params,
        kViewManagerService_setViewVisibility_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ViewManagerServiceSetViewPropertyResponseParams> setViewProperty(int viewId,String name,List<int> value,[Function responseFactory = null]) {
    var params = new ViewManagerServiceSetViewPropertyParams();
    params.viewId = viewId;
    params.name = name;
    params.value = value;
    return sendMessageWithRequestId(
        params,
        kViewManagerService_setViewProperty_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ViewManagerServiceAddViewResponseParams> addView(int parent,int child,[Function responseFactory = null]) {
    var params = new ViewManagerServiceAddViewParams();
    params.parent = parent;
    params.child = child;
    return sendMessageWithRequestId(
        params,
        kViewManagerService_addView_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ViewManagerServiceRemoveViewFromParentResponseParams> removeViewFromParent(int viewId,[Function responseFactory = null]) {
    var params = new ViewManagerServiceRemoveViewFromParentParams();
    params.viewId = viewId;
    return sendMessageWithRequestId(
        params,
        kViewManagerService_removeViewFromParent_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ViewManagerServiceReorderViewResponseParams> reorderView(int viewId,int relativeViewId,int direction,[Function responseFactory = null]) {
    var params = new ViewManagerServiceReorderViewParams();
    params.viewId = viewId;
    params.relativeViewId = relativeViewId;
    params.direction = direction;
    return sendMessageWithRequestId(
        params,
        kViewManagerService_reorderView_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ViewManagerServiceGetViewTreeResponseParams> getViewTree(int viewId,[Function responseFactory = null]) {
    var params = new ViewManagerServiceGetViewTreeParams();
    params.viewId = viewId;
    return sendMessageWithRequestId(
        params,
        kViewManagerService_getViewTree_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ViewManagerServiceSetViewSurfaceIdResponseParams> setViewSurfaceId(int viewId,surface_id_mojom.SurfaceId surfaceId,[Function responseFactory = null]) {
    var params = new ViewManagerServiceSetViewSurfaceIdParams();
    params.viewId = viewId;
    params.surfaceId = surfaceId;
    return sendMessageWithRequestId(
        params,
        kViewManagerService_setViewSurfaceId_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ViewManagerServiceEmbedUrlResponseParams> embedUrl(String url,int viewId,Object services,Object exposedServices,[Function responseFactory = null]) {
    var params = new ViewManagerServiceEmbedUrlParams();
    params.url = url;
    params.viewId = viewId;
    params.services = services;
    params.exposedServices = exposedServices;
    return sendMessageWithRequestId(
        params,
        kViewManagerService_embedUrl_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ViewManagerServiceEmbedResponseParams> embed(int viewId,Object client,[Function responseFactory = null]) {
    var params = new ViewManagerServiceEmbedParams();
    params.viewId = viewId;
    params.client = client;
    return sendMessageWithRequestId(
        params,
        kViewManagerService_embed_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ViewManagerServicePerformActionResponseParams> performAction(int viewId,String action,[Function responseFactory = null]) {
    var params = new ViewManagerServicePerformActionParams();
    params.viewId = viewId;
    params.action = action;
    return sendMessageWithRequestId(
        params,
        kViewManagerService_performAction_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class ViewManagerServiceStub extends bindings.Stub {
  ViewManagerService _delegate = null;

  ViewManagerServiceStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ViewManagerServiceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ViewManagerServiceStub.unbound() : super.unbound();

  static ViewManagerServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ViewManagerServiceStub(endpoint);

  static const String name = ViewManagerService.name;


  ViewManagerServiceCreateViewResponseParams _ViewManagerServiceCreateViewResponseParamsFactory(int errorCode) {
    var result = new ViewManagerServiceCreateViewResponseParams();
    result.errorCode = errorCode;
    return result;
  }
  ViewManagerServiceDeleteViewResponseParams _ViewManagerServiceDeleteViewResponseParamsFactory(bool success) {
    var result = new ViewManagerServiceDeleteViewResponseParams();
    result.success = success;
    return result;
  }
  ViewManagerServiceSetViewBoundsResponseParams _ViewManagerServiceSetViewBoundsResponseParamsFactory(bool success) {
    var result = new ViewManagerServiceSetViewBoundsResponseParams();
    result.success = success;
    return result;
  }
  ViewManagerServiceSetViewVisibilityResponseParams _ViewManagerServiceSetViewVisibilityResponseParamsFactory(bool success) {
    var result = new ViewManagerServiceSetViewVisibilityResponseParams();
    result.success = success;
    return result;
  }
  ViewManagerServiceSetViewPropertyResponseParams _ViewManagerServiceSetViewPropertyResponseParamsFactory(bool success) {
    var result = new ViewManagerServiceSetViewPropertyResponseParams();
    result.success = success;
    return result;
  }
  ViewManagerServiceAddViewResponseParams _ViewManagerServiceAddViewResponseParamsFactory(bool success) {
    var result = new ViewManagerServiceAddViewResponseParams();
    result.success = success;
    return result;
  }
  ViewManagerServiceRemoveViewFromParentResponseParams _ViewManagerServiceRemoveViewFromParentResponseParamsFactory(bool success) {
    var result = new ViewManagerServiceRemoveViewFromParentResponseParams();
    result.success = success;
    return result;
  }
  ViewManagerServiceReorderViewResponseParams _ViewManagerServiceReorderViewResponseParamsFactory(bool success) {
    var result = new ViewManagerServiceReorderViewResponseParams();
    result.success = success;
    return result;
  }
  ViewManagerServiceGetViewTreeResponseParams _ViewManagerServiceGetViewTreeResponseParamsFactory(List<ViewData> views) {
    var result = new ViewManagerServiceGetViewTreeResponseParams();
    result.views = views;
    return result;
  }
  ViewManagerServiceSetViewSurfaceIdResponseParams _ViewManagerServiceSetViewSurfaceIdResponseParamsFactory(bool success) {
    var result = new ViewManagerServiceSetViewSurfaceIdResponseParams();
    result.success = success;
    return result;
  }
  ViewManagerServiceEmbedUrlResponseParams _ViewManagerServiceEmbedUrlResponseParamsFactory(bool success) {
    var result = new ViewManagerServiceEmbedUrlResponseParams();
    result.success = success;
    return result;
  }
  ViewManagerServiceEmbedResponseParams _ViewManagerServiceEmbedResponseParamsFactory(bool success) {
    var result = new ViewManagerServiceEmbedResponseParams();
    result.success = success;
    return result;
  }
  ViewManagerServicePerformActionResponseParams _ViewManagerServicePerformActionResponseParamsFactory(bool success) {
    var result = new ViewManagerServicePerformActionResponseParams();
    result.success = success;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kViewManagerService_createView_name:
        var params = ViewManagerServiceCreateViewParams.deserialize(
            message.payload);
        return _delegate.createView(params.viewId,_ViewManagerServiceCreateViewResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerService_createView_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kViewManagerService_deleteView_name:
        var params = ViewManagerServiceDeleteViewParams.deserialize(
            message.payload);
        return _delegate.deleteView(params.viewId,_ViewManagerServiceDeleteViewResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerService_deleteView_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kViewManagerService_setViewBounds_name:
        var params = ViewManagerServiceSetViewBoundsParams.deserialize(
            message.payload);
        return _delegate.setViewBounds(params.viewId,params.bounds,_ViewManagerServiceSetViewBoundsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerService_setViewBounds_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kViewManagerService_setViewVisibility_name:
        var params = ViewManagerServiceSetViewVisibilityParams.deserialize(
            message.payload);
        return _delegate.setViewVisibility(params.viewId,params.visible,_ViewManagerServiceSetViewVisibilityResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerService_setViewVisibility_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kViewManagerService_setViewProperty_name:
        var params = ViewManagerServiceSetViewPropertyParams.deserialize(
            message.payload);
        return _delegate.setViewProperty(params.viewId,params.name,params.value,_ViewManagerServiceSetViewPropertyResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerService_setViewProperty_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kViewManagerService_addView_name:
        var params = ViewManagerServiceAddViewParams.deserialize(
            message.payload);
        return _delegate.addView(params.parent,params.child,_ViewManagerServiceAddViewResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerService_addView_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kViewManagerService_removeViewFromParent_name:
        var params = ViewManagerServiceRemoveViewFromParentParams.deserialize(
            message.payload);
        return _delegate.removeViewFromParent(params.viewId,_ViewManagerServiceRemoveViewFromParentResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerService_removeViewFromParent_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kViewManagerService_reorderView_name:
        var params = ViewManagerServiceReorderViewParams.deserialize(
            message.payload);
        return _delegate.reorderView(params.viewId,params.relativeViewId,params.direction,_ViewManagerServiceReorderViewResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerService_reorderView_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kViewManagerService_getViewTree_name:
        var params = ViewManagerServiceGetViewTreeParams.deserialize(
            message.payload);
        return _delegate.getViewTree(params.viewId,_ViewManagerServiceGetViewTreeResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerService_getViewTree_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kViewManagerService_setViewSurfaceId_name:
        var params = ViewManagerServiceSetViewSurfaceIdParams.deserialize(
            message.payload);
        return _delegate.setViewSurfaceId(params.viewId,params.surfaceId,_ViewManagerServiceSetViewSurfaceIdResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerService_setViewSurfaceId_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kViewManagerService_embedUrl_name:
        var params = ViewManagerServiceEmbedUrlParams.deserialize(
            message.payload);
        return _delegate.embedUrl(params.url,params.viewId,params.services,params.exposedServices,_ViewManagerServiceEmbedUrlResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerService_embedUrl_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kViewManagerService_embed_name:
        var params = ViewManagerServiceEmbedParams.deserialize(
            message.payload);
        return _delegate.embed(params.viewId,params.client,_ViewManagerServiceEmbedResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerService_embed_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kViewManagerService_performAction_name:
        var params = ViewManagerServicePerformActionParams.deserialize(
            message.payload);
        return _delegate.performAction(params.viewId,params.action,_ViewManagerServicePerformActionResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerService_performAction_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ViewManagerService get delegate => _delegate;
      set delegate(ViewManagerService d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kViewManagerClient_onEmbed_name = 0;
const int kViewManagerClient_onEmbeddedAppDisconnected_name = 1;
const int kViewManagerClient_onViewBoundsChanged_name = 2;
const int kViewManagerClient_onViewViewportMetricsChanged_name = 3;
const int kViewManagerClient_onViewHierarchyChanged_name = 4;
const int kViewManagerClient_onViewReordered_name = 5;
const int kViewManagerClient_onViewDeleted_name = 6;
const int kViewManagerClient_onViewVisibilityChanged_name = 7;
const int kViewManagerClient_onViewDrawnStateChanged_name = 8;
const int kViewManagerClient_onViewSharedPropertyChanged_name = 9;
const int kViewManagerClient_onViewInputEvent_name = 10;
const int kViewManagerClient_onPerformAction_name = 11;

abstract class ViewManagerClient implements core.Listener {
  static const String name = 'mojo::ViewManagerClient';
  ViewManagerClientStub stub;

  ViewManagerClient(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ViewManagerClientStub(endpoint);

  ViewManagerClient.fromHandle(core.MojoHandle handle) :
      stub = new ViewManagerClientStub.fromHandle(handle);

  ViewManagerClient.fromStub(this.stub);

  ViewManagerClient.unbound() :
      stub = new ViewManagerClientStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  ViewManagerClient get delegate => stub.delegate;
  set delegate(ViewManagerClient d) {
    stub.delegate = d;
  }
  void onEmbed(int connectionId, String embedderUrl, ViewData root, Object viewManagerService, Object services, Object exposedServices, core.MojoMessagePipeEndpoint windowManagerPipe);
  void onEmbeddedAppDisconnected(int view);
  void onViewBoundsChanged(int view, geometry_mojom.Rect oldBounds, geometry_mojom.Rect newBounds);
  void onViewViewportMetricsChanged(native_viewport_mojom.ViewportMetrics oldMetrics, native_viewport_mojom.ViewportMetrics newMetrics);
  void onViewHierarchyChanged(int view, int newParent, int oldParent, List<ViewData> views);
  void onViewReordered(int viewId, int relativeViewId, int direction);
  void onViewDeleted(int view);
  void onViewVisibilityChanged(int view, bool visible);
  void onViewDrawnStateChanged(int view, bool drawn);
  void onViewSharedPropertyChanged(int view, String name, List<int> newData);
  Future<ViewManagerClientOnViewInputEventResponseParams> onViewInputEvent(int view,input_events_mojom.Event event,[Function responseFactory = null]);
  Future<ViewManagerClientOnPerformActionResponseParams> onPerformAction(int viewId,String action,[Function responseFactory = null]);

}

class ViewManagerClientProxy extends bindings.Proxy implements ViewManagerClient {
  ViewManagerClientProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ViewManagerClientProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ViewManagerClientProxy.unbound() : super.unbound();

  String get name => ViewManagerClient.name;

  static ViewManagerClientProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ViewManagerClientProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kViewManagerClient_onViewInputEvent_name:
        var r = ViewManagerClientOnViewInputEventResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kViewManagerClient_onPerformAction_name:
        var r = ViewManagerClientOnPerformActionResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void onEmbed(int connectionId, String embedderUrl, ViewData root, Object viewManagerService, Object services, Object exposedServices, core.MojoMessagePipeEndpoint windowManagerPipe) {
    var params = new ViewManagerClientOnEmbedParams();
    params.connectionId = connectionId;
    params.embedderUrl = embedderUrl;
    params.root = root;
    params.viewManagerService = viewManagerService;
    params.services = services;
    params.exposedServices = exposedServices;
    params.windowManagerPipe = windowManagerPipe;
    sendMessage(params, kViewManagerClient_onEmbed_name);
  }

  void onEmbeddedAppDisconnected(int view) {
    var params = new ViewManagerClientOnEmbeddedAppDisconnectedParams();
    params.view = view;
    sendMessage(params, kViewManagerClient_onEmbeddedAppDisconnected_name);
  }

  void onViewBoundsChanged(int view, geometry_mojom.Rect oldBounds, geometry_mojom.Rect newBounds) {
    var params = new ViewManagerClientOnViewBoundsChangedParams();
    params.view = view;
    params.oldBounds = oldBounds;
    params.newBounds = newBounds;
    sendMessage(params, kViewManagerClient_onViewBoundsChanged_name);
  }

  void onViewViewportMetricsChanged(native_viewport_mojom.ViewportMetrics oldMetrics, native_viewport_mojom.ViewportMetrics newMetrics) {
    var params = new ViewManagerClientOnViewViewportMetricsChangedParams();
    params.oldMetrics = oldMetrics;
    params.newMetrics = newMetrics;
    sendMessage(params, kViewManagerClient_onViewViewportMetricsChanged_name);
  }

  void onViewHierarchyChanged(int view, int newParent, int oldParent, List<ViewData> views) {
    var params = new ViewManagerClientOnViewHierarchyChangedParams();
    params.view = view;
    params.newParent = newParent;
    params.oldParent = oldParent;
    params.views = views;
    sendMessage(params, kViewManagerClient_onViewHierarchyChanged_name);
  }

  void onViewReordered(int viewId, int relativeViewId, int direction) {
    var params = new ViewManagerClientOnViewReorderedParams();
    params.viewId = viewId;
    params.relativeViewId = relativeViewId;
    params.direction = direction;
    sendMessage(params, kViewManagerClient_onViewReordered_name);
  }

  void onViewDeleted(int view) {
    var params = new ViewManagerClientOnViewDeletedParams();
    params.view = view;
    sendMessage(params, kViewManagerClient_onViewDeleted_name);
  }

  void onViewVisibilityChanged(int view, bool visible) {
    var params = new ViewManagerClientOnViewVisibilityChangedParams();
    params.view = view;
    params.visible = visible;
    sendMessage(params, kViewManagerClient_onViewVisibilityChanged_name);
  }

  void onViewDrawnStateChanged(int view, bool drawn) {
    var params = new ViewManagerClientOnViewDrawnStateChangedParams();
    params.view = view;
    params.drawn = drawn;
    sendMessage(params, kViewManagerClient_onViewDrawnStateChanged_name);
  }

  void onViewSharedPropertyChanged(int view, String name, List<int> newData) {
    var params = new ViewManagerClientOnViewSharedPropertyChangedParams();
    params.view = view;
    params.name = name;
    params.newData = newData;
    sendMessage(params, kViewManagerClient_onViewSharedPropertyChanged_name);
  }

  Future<ViewManagerClientOnViewInputEventResponseParams> onViewInputEvent(int view,input_events_mojom.Event event,[Function responseFactory = null]) {
    var params = new ViewManagerClientOnViewInputEventParams();
    params.view = view;
    params.event = event;
    return sendMessageWithRequestId(
        params,
        kViewManagerClient_onViewInputEvent_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ViewManagerClientOnPerformActionResponseParams> onPerformAction(int viewId,String action,[Function responseFactory = null]) {
    var params = new ViewManagerClientOnPerformActionParams();
    params.viewId = viewId;
    params.action = action;
    return sendMessageWithRequestId(
        params,
        kViewManagerClient_onPerformAction_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class ViewManagerClientStub extends bindings.Stub {
  ViewManagerClient _delegate = null;

  ViewManagerClientStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ViewManagerClientStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ViewManagerClientStub.unbound() : super.unbound();

  static ViewManagerClientStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ViewManagerClientStub(endpoint);

  static const String name = ViewManagerClient.name;


  ViewManagerClientOnViewInputEventResponseParams _ViewManagerClientOnViewInputEventResponseParamsFactory() {
    var result = new ViewManagerClientOnViewInputEventResponseParams();
    return result;
  }
  ViewManagerClientOnPerformActionResponseParams _ViewManagerClientOnPerformActionResponseParamsFactory(bool success) {
    var result = new ViewManagerClientOnPerformActionResponseParams();
    result.success = success;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kViewManagerClient_onEmbed_name:
        var params = ViewManagerClientOnEmbedParams.deserialize(
            message.payload);
        _delegate.onEmbed(params.connectionId, params.embedderUrl, params.root, params.viewManagerService, params.services, params.exposedServices, params.windowManagerPipe);
        break;
      case kViewManagerClient_onEmbeddedAppDisconnected_name:
        var params = ViewManagerClientOnEmbeddedAppDisconnectedParams.deserialize(
            message.payload);
        _delegate.onEmbeddedAppDisconnected(params.view);
        break;
      case kViewManagerClient_onViewBoundsChanged_name:
        var params = ViewManagerClientOnViewBoundsChangedParams.deserialize(
            message.payload);
        _delegate.onViewBoundsChanged(params.view, params.oldBounds, params.newBounds);
        break;
      case kViewManagerClient_onViewViewportMetricsChanged_name:
        var params = ViewManagerClientOnViewViewportMetricsChangedParams.deserialize(
            message.payload);
        _delegate.onViewViewportMetricsChanged(params.oldMetrics, params.newMetrics);
        break;
      case kViewManagerClient_onViewHierarchyChanged_name:
        var params = ViewManagerClientOnViewHierarchyChangedParams.deserialize(
            message.payload);
        _delegate.onViewHierarchyChanged(params.view, params.newParent, params.oldParent, params.views);
        break;
      case kViewManagerClient_onViewReordered_name:
        var params = ViewManagerClientOnViewReorderedParams.deserialize(
            message.payload);
        _delegate.onViewReordered(params.viewId, params.relativeViewId, params.direction);
        break;
      case kViewManagerClient_onViewDeleted_name:
        var params = ViewManagerClientOnViewDeletedParams.deserialize(
            message.payload);
        _delegate.onViewDeleted(params.view);
        break;
      case kViewManagerClient_onViewVisibilityChanged_name:
        var params = ViewManagerClientOnViewVisibilityChangedParams.deserialize(
            message.payload);
        _delegate.onViewVisibilityChanged(params.view, params.visible);
        break;
      case kViewManagerClient_onViewDrawnStateChanged_name:
        var params = ViewManagerClientOnViewDrawnStateChangedParams.deserialize(
            message.payload);
        _delegate.onViewDrawnStateChanged(params.view, params.drawn);
        break;
      case kViewManagerClient_onViewSharedPropertyChanged_name:
        var params = ViewManagerClientOnViewSharedPropertyChangedParams.deserialize(
            message.payload);
        _delegate.onViewSharedPropertyChanged(params.view, params.name, params.newData);
        break;
      case kViewManagerClient_onViewInputEvent_name:
        var params = ViewManagerClientOnViewInputEventParams.deserialize(
            message.payload);
        return _delegate.onViewInputEvent(params.view,params.event,_ViewManagerClientOnViewInputEventResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerClient_onViewInputEvent_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kViewManagerClient_onPerformAction_name:
        var params = ViewManagerClientOnPerformActionParams.deserialize(
            message.payload);
        return _delegate.onPerformAction(params.viewId,params.action,_ViewManagerClientOnPerformActionResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kViewManagerClient_onPerformAction_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ViewManagerClient get delegate => _delegate;
      set delegate(ViewManagerClient d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




