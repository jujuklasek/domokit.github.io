// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library native_viewport.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/geometry/public/interfaces/geometry.mojom.dart' as geometry_mojom;
import 'package:mojo/services/gpu/public/interfaces/command_buffer.mojom.dart' as command_buffer_mojom;
import 'package:mojo/services/input_events/public/interfaces/input_events.mojom.dart' as input_events_mojom;
import 'package:mojo/services/surfaces/public/interfaces/surface_id.mojom.dart' as surface_id_mojom;


class ViewportMetrics extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  geometry_mojom.Size size = null;
  double devicePixelRatio = 1.0;

  ViewportMetrics() : super(kStructSize);

  static ViewportMetrics deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewportMetrics decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewportMetrics result = new ViewportMetrics();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.size = geometry_mojom.Size.decode(decoder1);
    }
    {
      
      result.devicePixelRatio = decoder0.decodeFloat(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(size, 8, false);
    
    encoder0.encodeFloat(devicePixelRatio, 16);
  }
}

class NativeViewportCreateParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  geometry_mojom.Size size = null;

  NativeViewportCreateParams() : super(kStructSize);

  static NativeViewportCreateParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NativeViewportCreateParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NativeViewportCreateParams result = new NativeViewportCreateParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.size = geometry_mojom.Size.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(size, 8, false);
  }
}

class NativeViewportCreateResponseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int nativeViewportId = 0;
  ViewportMetrics metrics = null;

  NativeViewportCreateResponseParams() : super(kStructSize);

  static NativeViewportCreateResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NativeViewportCreateResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NativeViewportCreateResponseParams result = new NativeViewportCreateResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.nativeViewportId = decoder0.decodeUint64(8);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, false);
      result.metrics = ViewportMetrics.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint64(nativeViewportId, 8);
    
    encoder0.encodeStruct(metrics, 16, false);
  }
}

class NativeViewportShowParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  NativeViewportShowParams() : super(kStructSize);

  static NativeViewportShowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NativeViewportShowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NativeViewportShowParams result = new NativeViewportShowParams();

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

class NativeViewportHideParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  NativeViewportHideParams() : super(kStructSize);

  static NativeViewportHideParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NativeViewportHideParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NativeViewportHideParams result = new NativeViewportHideParams();

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

class NativeViewportCloseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  NativeViewportCloseParams() : super(kStructSize);

  static NativeViewportCloseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NativeViewportCloseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NativeViewportCloseParams result = new NativeViewportCloseParams();

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

class NativeViewportSetSizeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  geometry_mojom.Size size = null;

  NativeViewportSetSizeParams() : super(kStructSize);

  static NativeViewportSetSizeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NativeViewportSetSizeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NativeViewportSetSizeParams result = new NativeViewportSetSizeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.size = geometry_mojom.Size.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(size, 8, false);
  }
}

class NativeViewportSubmittedFrameParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  surface_id_mojom.SurfaceId surfaceId = null;

  NativeViewportSubmittedFrameParams() : super(kStructSize);

  static NativeViewportSubmittedFrameParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NativeViewportSubmittedFrameParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NativeViewportSubmittedFrameParams result = new NativeViewportSubmittedFrameParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.surfaceId = surface_id_mojom.SurfaceId.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(surfaceId, 8, false);
  }
}

class NativeViewportSetEventDispatcherParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object dispatcher = null;

  NativeViewportSetEventDispatcherParams() : super(kStructSize);

  static NativeViewportSetEventDispatcherParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NativeViewportSetEventDispatcherParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NativeViewportSetEventDispatcherParams result = new NativeViewportSetEventDispatcherParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.dispatcher = decoder0.decodeServiceInterface(8, false, NativeViewportEventDispatcherProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(dispatcher, 8, false);
  }
}

class NativeViewportRequestMetricsParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  NativeViewportRequestMetricsParams() : super(kStructSize);

  static NativeViewportRequestMetricsParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NativeViewportRequestMetricsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NativeViewportRequestMetricsParams result = new NativeViewportRequestMetricsParams();

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

class NativeViewportRequestMetricsResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  ViewportMetrics metrics = null;

  NativeViewportRequestMetricsResponseParams() : super(kStructSize);

  static NativeViewportRequestMetricsResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NativeViewportRequestMetricsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NativeViewportRequestMetricsResponseParams result = new NativeViewportRequestMetricsResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.metrics = ViewportMetrics.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(metrics, 8, false);
  }
}

class NativeViewportEventDispatcherOnEventParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  input_events_mojom.Event event = null;

  NativeViewportEventDispatcherOnEventParams() : super(kStructSize);

  static NativeViewportEventDispatcherOnEventParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NativeViewportEventDispatcherOnEventParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NativeViewportEventDispatcherOnEventParams result = new NativeViewportEventDispatcherOnEventParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.event = input_events_mojom.Event.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(event, 8, false);
  }
}

class NativeViewportEventDispatcherOnEventResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  NativeViewportEventDispatcherOnEventResponseParams() : super(kStructSize);

  static NativeViewportEventDispatcherOnEventResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NativeViewportEventDispatcherOnEventResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NativeViewportEventDispatcherOnEventResponseParams result = new NativeViewportEventDispatcherOnEventResponseParams();

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
const int kNativeViewport_create_name = 0;
const int kNativeViewport_show_name = 1;
const int kNativeViewport_hide_name = 2;
const int kNativeViewport_close_name = 3;
const int kNativeViewport_setSize_name = 4;
const int kNativeViewport_submittedFrame_name = 5;
const int kNativeViewport_setEventDispatcher_name = 6;
const int kNativeViewport_requestMetrics_name = 7;

abstract class NativeViewport implements core.Listener {
  static const String name = 'mojo::NativeViewport';
  NativeViewportStub stub;

  NativeViewport(core.MojoMessagePipeEndpoint endpoint) :
      stub = new NativeViewportStub(endpoint);

  NativeViewport.fromHandle(core.MojoHandle handle) :
      stub = new NativeViewportStub.fromHandle(handle);

  NativeViewport.fromStub(this.stub);

  NativeViewport.unbound() :
      stub = new NativeViewportStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  NativeViewport get delegate => stub.delegate;
  set delegate(NativeViewport d) {
    stub.delegate = d;
  }
  Future<NativeViewportCreateResponseParams> create(geometry_mojom.Size size,[Function responseFactory = null]);
  void show();
  void hide();
  void close();
  void setSize(geometry_mojom.Size size);
  void submittedFrame(surface_id_mojom.SurfaceId surfaceId);
  void setEventDispatcher(Object dispatcher);
  Future<NativeViewportRequestMetricsResponseParams> requestMetrics([Function responseFactory = null]);

}

class NativeViewportProxy extends bindings.Proxy implements NativeViewport {
  NativeViewportProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  NativeViewportProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NativeViewportProxy.unbound() : super.unbound();

  String get name => NativeViewport.name;

  static NativeViewportProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NativeViewportProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kNativeViewport_create_name:
        var r = NativeViewportCreateResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kNativeViewport_requestMetrics_name:
        var r = NativeViewportRequestMetricsResponseParams.deserialize(
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
  Future<NativeViewportCreateResponseParams> create(geometry_mojom.Size size,[Function responseFactory = null]) {
    var params = new NativeViewportCreateParams();
    params.size = size;
    return sendMessageWithRequestId(
        params,
        kNativeViewport_create_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  void show() {
    var params = new NativeViewportShowParams();
    sendMessage(params, kNativeViewport_show_name);
  }

  void hide() {
    var params = new NativeViewportHideParams();
    sendMessage(params, kNativeViewport_hide_name);
  }

  void close() {
    var params = new NativeViewportCloseParams();
    sendMessage(params, kNativeViewport_close_name);
  }

  void setSize(geometry_mojom.Size size) {
    var params = new NativeViewportSetSizeParams();
    params.size = size;
    sendMessage(params, kNativeViewport_setSize_name);
  }

  void submittedFrame(surface_id_mojom.SurfaceId surfaceId) {
    var params = new NativeViewportSubmittedFrameParams();
    params.surfaceId = surfaceId;
    sendMessage(params, kNativeViewport_submittedFrame_name);
  }

  void setEventDispatcher(Object dispatcher) {
    var params = new NativeViewportSetEventDispatcherParams();
    params.dispatcher = dispatcher;
    sendMessage(params, kNativeViewport_setEventDispatcher_name);
  }

  Future<NativeViewportRequestMetricsResponseParams> requestMetrics([Function responseFactory = null]) {
    var params = new NativeViewportRequestMetricsParams();
    return sendMessageWithRequestId(
        params,
        kNativeViewport_requestMetrics_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class NativeViewportStub extends bindings.Stub {
  NativeViewport _delegate = null;

  NativeViewportStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  NativeViewportStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NativeViewportStub.unbound() : super.unbound();

  static NativeViewportStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NativeViewportStub(endpoint);

  static const String name = NativeViewport.name;


  NativeViewportCreateResponseParams _NativeViewportCreateResponseParamsFactory(int nativeViewportId, ViewportMetrics metrics) {
    var result = new NativeViewportCreateResponseParams();
    result.nativeViewportId = nativeViewportId;
    result.metrics = metrics;
    return result;
  }
  NativeViewportRequestMetricsResponseParams _NativeViewportRequestMetricsResponseParamsFactory(ViewportMetrics metrics) {
    var result = new NativeViewportRequestMetricsResponseParams();
    result.metrics = metrics;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kNativeViewport_create_name:
        var params = NativeViewportCreateParams.deserialize(
            message.payload);
        return _delegate.create(params.size,_NativeViewportCreateResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kNativeViewport_create_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kNativeViewport_show_name:
        var params = NativeViewportShowParams.deserialize(
            message.payload);
        _delegate.show();
        break;
      case kNativeViewport_hide_name:
        var params = NativeViewportHideParams.deserialize(
            message.payload);
        _delegate.hide();
        break;
      case kNativeViewport_close_name:
        var params = NativeViewportCloseParams.deserialize(
            message.payload);
        _delegate.close();
        break;
      case kNativeViewport_setSize_name:
        var params = NativeViewportSetSizeParams.deserialize(
            message.payload);
        _delegate.setSize(params.size);
        break;
      case kNativeViewport_submittedFrame_name:
        var params = NativeViewportSubmittedFrameParams.deserialize(
            message.payload);
        _delegate.submittedFrame(params.surfaceId);
        break;
      case kNativeViewport_setEventDispatcher_name:
        var params = NativeViewportSetEventDispatcherParams.deserialize(
            message.payload);
        _delegate.setEventDispatcher(params.dispatcher);
        break;
      case kNativeViewport_requestMetrics_name:
        var params = NativeViewportRequestMetricsParams.deserialize(
            message.payload);
        return _delegate.requestMetrics(_NativeViewportRequestMetricsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kNativeViewport_requestMetrics_name,
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

  NativeViewport get delegate => _delegate;
      set delegate(NativeViewport d) {
    assert(_delegate == null);
    _delegate = d;
  }
}

const int kNativeViewportEventDispatcher_onEvent_name = 0;

abstract class NativeViewportEventDispatcher implements core.Listener {
  static const String name = 'mojo::NativeViewportEventDispatcher';
  NativeViewportEventDispatcherStub stub;

  NativeViewportEventDispatcher(core.MojoMessagePipeEndpoint endpoint) :
      stub = new NativeViewportEventDispatcherStub(endpoint);

  NativeViewportEventDispatcher.fromHandle(core.MojoHandle handle) :
      stub = new NativeViewportEventDispatcherStub.fromHandle(handle);

  NativeViewportEventDispatcher.fromStub(this.stub);

  NativeViewportEventDispatcher.unbound() :
      stub = new NativeViewportEventDispatcherStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  NativeViewportEventDispatcher get delegate => stub.delegate;
  set delegate(NativeViewportEventDispatcher d) {
    stub.delegate = d;
  }
  Future<NativeViewportEventDispatcherOnEventResponseParams> onEvent(input_events_mojom.Event event,[Function responseFactory = null]);

}

class NativeViewportEventDispatcherProxy extends bindings.Proxy implements NativeViewportEventDispatcher {
  NativeViewportEventDispatcherProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  NativeViewportEventDispatcherProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NativeViewportEventDispatcherProxy.unbound() : super.unbound();

  String get name => NativeViewportEventDispatcher.name;

  static NativeViewportEventDispatcherProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NativeViewportEventDispatcherProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kNativeViewportEventDispatcher_onEvent_name:
        var r = NativeViewportEventDispatcherOnEventResponseParams.deserialize(
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
  Future<NativeViewportEventDispatcherOnEventResponseParams> onEvent(input_events_mojom.Event event,[Function responseFactory = null]) {
    var params = new NativeViewportEventDispatcherOnEventParams();
    params.event = event;
    return sendMessageWithRequestId(
        params,
        kNativeViewportEventDispatcher_onEvent_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class NativeViewportEventDispatcherStub extends bindings.Stub {
  NativeViewportEventDispatcher _delegate = null;

  NativeViewportEventDispatcherStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  NativeViewportEventDispatcherStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NativeViewportEventDispatcherStub.unbound() : super.unbound();

  static NativeViewportEventDispatcherStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NativeViewportEventDispatcherStub(endpoint);

  static const String name = NativeViewportEventDispatcher.name;


  NativeViewportEventDispatcherOnEventResponseParams _NativeViewportEventDispatcherOnEventResponseParamsFactory() {
    var result = new NativeViewportEventDispatcherOnEventResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kNativeViewportEventDispatcher_onEvent_name:
        var params = NativeViewportEventDispatcherOnEventParams.deserialize(
            message.payload);
        return _delegate.onEvent(params.event,_NativeViewportEventDispatcherOnEventResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kNativeViewportEventDispatcher_onEvent_name,
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

  NativeViewportEventDispatcher get delegate => _delegate;
      set delegate(NativeViewportEventDispatcher d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


