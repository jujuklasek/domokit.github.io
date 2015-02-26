// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library viewport_parameter_listener.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class ViewportParameterListenerOnVSyncParametersUpdatedParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int timebase = 0;
  int interval = 0;

  ViewportParameterListenerOnVSyncParametersUpdatedParams() : super(kStructSize);

  static ViewportParameterListenerOnVSyncParametersUpdatedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ViewportParameterListenerOnVSyncParametersUpdatedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ViewportParameterListenerOnVSyncParametersUpdatedParams result = new ViewportParameterListenerOnVSyncParametersUpdatedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.timebase = decoder0.decodeInt64(8);
    }
    {
      
      result.interval = decoder0.decodeInt64(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt64(timebase, 8);
    
    encoder0.encodeInt64(interval, 16);
  }
}
const int kViewportParameterListener_onVSyncParametersUpdated_name = 0;

abstract class ViewportParameterListener implements core.Listener {
  static const String name = 'mojo::ViewportParameterListener';
  ViewportParameterListenerStub stub;

  ViewportParameterListener(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ViewportParameterListenerStub(endpoint);

  ViewportParameterListener.fromHandle(core.MojoHandle handle) :
      stub = new ViewportParameterListenerStub.fromHandle(handle);

  ViewportParameterListener.fromStub(this.stub);

  ViewportParameterListener.unbound() :
      stub = new ViewportParameterListenerStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  ViewportParameterListener get delegate => stub.delegate;
  set delegate(ViewportParameterListener d) {
    stub.delegate = d;
  }
  void onVSyncParametersUpdated(int timebase, int interval);

}

class ViewportParameterListenerProxy extends bindings.Proxy implements ViewportParameterListener {
  ViewportParameterListenerProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ViewportParameterListenerProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ViewportParameterListenerProxy.unbound() : super.unbound();

  String get name => ViewportParameterListener.name;

  static ViewportParameterListenerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ViewportParameterListenerProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void onVSyncParametersUpdated(int timebase, int interval) {
    var params = new ViewportParameterListenerOnVSyncParametersUpdatedParams();
    params.timebase = timebase;
    params.interval = interval;
    sendMessage(params, kViewportParameterListener_onVSyncParametersUpdated_name);
  }

}

class ViewportParameterListenerStub extends bindings.Stub {
  ViewportParameterListener _delegate = null;

  ViewportParameterListenerStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ViewportParameterListenerStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ViewportParameterListenerStub.unbound() : super.unbound();

  static ViewportParameterListenerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ViewportParameterListenerStub(endpoint);

  static const String name = ViewportParameterListener.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kViewportParameterListener_onVSyncParametersUpdated_name:
        var params = ViewportParameterListenerOnVSyncParametersUpdatedParams.deserialize(
            message.payload);
        _delegate.onVSyncParametersUpdated(params.timebase, params.interval);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ViewportParameterListener get delegate => _delegate;
      set delegate(ViewportParameterListener d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


