// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library viewport_observer.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:sky/services/viewport/input_event.mojom.dart' as input_event_mojom;


class ViewportObserverOnViewportMetricsChangedParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  int width = 0;
  int height = 0;
  double devicePixelRatio = 0.0;

  ViewportObserverOnViewportMetricsChangedParams() : super(kStructSize);

  static ViewportObserverOnViewportMetricsChangedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewportObserverOnViewportMetricsChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewportObserverOnViewportMetricsChangedParams result = new ViewportObserverOnViewportMetricsChangedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.width = decoder0.decodeInt32(8);
    }
    {
      
      result.height = decoder0.decodeInt32(12);
    }
    {
      
      result.devicePixelRatio = decoder0.decodeFloat(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(width, 8);
    
    encoder0.encodeInt32(height, 12);
    
    encoder0.encodeFloat(devicePixelRatio, 16);
  }
}

class ViewportObserverOnInputEventParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  input_event_mojom.InputEvent event = null;

  ViewportObserverOnInputEventParams() : super(kStructSize);

  static ViewportObserverOnInputEventParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewportObserverOnInputEventParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewportObserverOnInputEventParams result = new ViewportObserverOnInputEventParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.event = input_event_mojom.InputEvent.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(event, 8, false);
  }
}

class ViewportObserverLoadUrlParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String url = null;

  ViewportObserverLoadUrlParams() : super(kStructSize);

  static ViewportObserverLoadUrlParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewportObserverLoadUrlParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewportObserverLoadUrlParams result = new ViewportObserverLoadUrlParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.url = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(url, 8, false);
  }
}
const int kViewportObserver_onViewportMetricsChanged_name = 0;
const int kViewportObserver_onInputEvent_name = 1;
const int kViewportObserver_loadUrl_name = 2;

abstract class ViewportObserver implements core.Listener {
  static const String name = 'sky::ViewportObserver';
  ViewportObserverStub stub;

  ViewportObserver(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ViewportObserverStub(endpoint);

  ViewportObserver.fromHandle(core.MojoHandle handle) :
      stub = new ViewportObserverStub.fromHandle(handle);

  ViewportObserver.fromStub(this.stub);

  ViewportObserver.unbound() :
      stub = new ViewportObserverStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  ViewportObserver get delegate => stub.delegate;
  set delegate(ViewportObserver d) {
    stub.delegate = d;
  }
  void onViewportMetricsChanged(int width, int height, double devicePixelRatio);
  void onInputEvent(input_event_mojom.InputEvent event);
  void loadUrl(String url);

}

class ViewportObserverProxy extends bindings.Proxy implements ViewportObserver {
  ViewportObserverProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ViewportObserverProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ViewportObserverProxy.unbound() : super.unbound();

  String get name => ViewportObserver.name;

  static ViewportObserverProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ViewportObserverProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void onViewportMetricsChanged(int width, int height, double devicePixelRatio) {
    var params = new ViewportObserverOnViewportMetricsChangedParams();
    params.width = width;
    params.height = height;
    params.devicePixelRatio = devicePixelRatio;
    sendMessage(params, kViewportObserver_onViewportMetricsChanged_name);
  }

  void onInputEvent(input_event_mojom.InputEvent event) {
    var params = new ViewportObserverOnInputEventParams();
    params.event = event;
    sendMessage(params, kViewportObserver_onInputEvent_name);
  }

  void loadUrl(String url) {
    var params = new ViewportObserverLoadUrlParams();
    params.url = url;
    sendMessage(params, kViewportObserver_loadUrl_name);
  }

}

class ViewportObserverStub extends bindings.Stub {
  ViewportObserver _delegate = null;

  ViewportObserverStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ViewportObserverStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ViewportObserverStub.unbound() : super.unbound();

  static ViewportObserverStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ViewportObserverStub(endpoint);

  static const String name = ViewportObserver.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kViewportObserver_onViewportMetricsChanged_name:
        var params = ViewportObserverOnViewportMetricsChangedParams.deserialize(
            message.payload);
        _delegate.onViewportMetricsChanged(params.width, params.height, params.devicePixelRatio);
        break;
      case kViewportObserver_onInputEvent_name:
        var params = ViewportObserverOnInputEventParams.deserialize(
            message.payload);
        _delegate.onInputEvent(params.event);
        break;
      case kViewportObserver_loadUrl_name:
        var params = ViewportObserverLoadUrlParams.deserialize(
            message.payload);
        _delegate.loadUrl(params.url);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ViewportObserver get delegate => _delegate;
      set delegate(ViewportObserver d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


