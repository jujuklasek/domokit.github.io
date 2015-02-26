// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library window_manager_internal.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/geometry/public/interfaces/geometry.mojom.dart' as geometry_mojom;
import 'package:mojo/services/input_events/public/interfaces/input_events.mojom.dart' as input_events_mojom;


class WindowManagerInternalCreateWindowManagerForViewManagerClientParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int connectionId = 0;
  core.MojoMessagePipeEndpoint windowManagerPipe = null;

  WindowManagerInternalCreateWindowManagerForViewManagerClientParams() : super(kStructSize);

  static WindowManagerInternalCreateWindowManagerForViewManagerClientParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerInternalCreateWindowManagerForViewManagerClientParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerInternalCreateWindowManagerForViewManagerClientParams result = new WindowManagerInternalCreateWindowManagerForViewManagerClientParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.connectionId = decoder0.decodeUint16(8);
    }
    {
      
      result.windowManagerPipe = decoder0.decodeMessagePipeHandle(12, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint16(connectionId, 8);
    
    encoder0.encodeMessagePipeHandle(windowManagerPipe, 12, false);
  }
}

class WindowManagerInternalSetViewManagerClientParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  core.MojoMessagePipeEndpoint viewManagerClientRequest = null;

  WindowManagerInternalSetViewManagerClientParams() : super(kStructSize);

  static WindowManagerInternalSetViewManagerClientParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerInternalSetViewManagerClientParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerInternalSetViewManagerClientParams result = new WindowManagerInternalSetViewManagerClientParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.viewManagerClientRequest = decoder0.decodeMessagePipeHandle(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeMessagePipeHandle(viewManagerClientRequest, 8, false);
  }
}

class WindowManagerInternalClientDispatchInputEventToViewParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int viewId = 0;
  input_events_mojom.Event event = null;

  WindowManagerInternalClientDispatchInputEventToViewParams() : super(kStructSize);

  static WindowManagerInternalClientDispatchInputEventToViewParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerInternalClientDispatchInputEventToViewParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerInternalClientDispatchInputEventToViewParams result = new WindowManagerInternalClientDispatchInputEventToViewParams();

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
      result.event = input_events_mojom.Event.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(viewId, 8);
    
    encoder0.encodeStruct(event, 16, false);
  }
}

class WindowManagerInternalClientSetViewportSizeParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  geometry_mojom.Size size = null;

  WindowManagerInternalClientSetViewportSizeParams() : super(kStructSize);

  static WindowManagerInternalClientSetViewportSizeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerInternalClientSetViewportSizeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerInternalClientSetViewportSizeParams result = new WindowManagerInternalClientSetViewportSizeParams();

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

class WindowManagerInternalClientCloneAndAnimateParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int viewId = 0;

  WindowManagerInternalClientCloneAndAnimateParams() : super(kStructSize);

  static WindowManagerInternalClientCloneAndAnimateParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerInternalClientCloneAndAnimateParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerInternalClientCloneAndAnimateParams result = new WindowManagerInternalClientCloneAndAnimateParams();

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
const int kWindowManagerInternal_createWindowManagerForViewManagerClient_name = 0;
const int kWindowManagerInternal_setViewManagerClient_name = 1;

abstract class WindowManagerInternal implements core.Listener {
  static const String name = 'mojo::WindowManagerInternal';
  WindowManagerInternalStub stub;

  WindowManagerInternal(core.MojoMessagePipeEndpoint endpoint) :
      stub = new WindowManagerInternalStub(endpoint);

  WindowManagerInternal.fromHandle(core.MojoHandle handle) :
      stub = new WindowManagerInternalStub.fromHandle(handle);

  WindowManagerInternal.fromStub(this.stub);

  WindowManagerInternal.unbound() :
      stub = new WindowManagerInternalStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  WindowManagerInternal get delegate => stub.delegate;
  set delegate(WindowManagerInternal d) {
    stub.delegate = d;
  }
  void createWindowManagerForViewManagerClient(int connectionId, core.MojoMessagePipeEndpoint windowManagerPipe);
  void setViewManagerClient(core.MojoMessagePipeEndpoint viewManagerClientRequest);

}

class WindowManagerInternalProxy extends bindings.Proxy implements WindowManagerInternal {
  WindowManagerInternalProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WindowManagerInternalProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WindowManagerInternalProxy.unbound() : super.unbound();

  String get name => WindowManagerInternal.name;

  static WindowManagerInternalProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WindowManagerInternalProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void createWindowManagerForViewManagerClient(int connectionId, core.MojoMessagePipeEndpoint windowManagerPipe) {
    var params = new WindowManagerInternalCreateWindowManagerForViewManagerClientParams();
    params.connectionId = connectionId;
    params.windowManagerPipe = windowManagerPipe;
    sendMessage(params, kWindowManagerInternal_createWindowManagerForViewManagerClient_name);
  }

  void setViewManagerClient(core.MojoMessagePipeEndpoint viewManagerClientRequest) {
    var params = new WindowManagerInternalSetViewManagerClientParams();
    params.viewManagerClientRequest = viewManagerClientRequest;
    sendMessage(params, kWindowManagerInternal_setViewManagerClient_name);
  }

}

class WindowManagerInternalStub extends bindings.Stub {
  WindowManagerInternal _delegate = null;

  WindowManagerInternalStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WindowManagerInternalStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WindowManagerInternalStub.unbound() : super.unbound();

  static WindowManagerInternalStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WindowManagerInternalStub(endpoint);

  static const String name = WindowManagerInternal.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kWindowManagerInternal_createWindowManagerForViewManagerClient_name:
        var params = WindowManagerInternalCreateWindowManagerForViewManagerClientParams.deserialize(
            message.payload);
        _delegate.createWindowManagerForViewManagerClient(params.connectionId, params.windowManagerPipe);
        break;
      case kWindowManagerInternal_setViewManagerClient_name:
        var params = WindowManagerInternalSetViewManagerClientParams.deserialize(
            message.payload);
        _delegate.setViewManagerClient(params.viewManagerClientRequest);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  WindowManagerInternal get delegate => _delegate;
      set delegate(WindowManagerInternal d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kWindowManagerInternalClient_dispatchInputEventToView_name = 0;
const int kWindowManagerInternalClient_setViewportSize_name = 1;
const int kWindowManagerInternalClient_cloneAndAnimate_name = 2;

abstract class WindowManagerInternalClient implements core.Listener {
  static const String name = 'mojo::WindowManagerInternalClient';
  WindowManagerInternalClientStub stub;

  WindowManagerInternalClient(core.MojoMessagePipeEndpoint endpoint) :
      stub = new WindowManagerInternalClientStub(endpoint);

  WindowManagerInternalClient.fromHandle(core.MojoHandle handle) :
      stub = new WindowManagerInternalClientStub.fromHandle(handle);

  WindowManagerInternalClient.fromStub(this.stub);

  WindowManagerInternalClient.unbound() :
      stub = new WindowManagerInternalClientStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  WindowManagerInternalClient get delegate => stub.delegate;
  set delegate(WindowManagerInternalClient d) {
    stub.delegate = d;
  }
  void dispatchInputEventToView(int viewId, input_events_mojom.Event event);
  void setViewportSize(geometry_mojom.Size size);
  void cloneAndAnimate(int viewId);

}

class WindowManagerInternalClientProxy extends bindings.Proxy implements WindowManagerInternalClient {
  WindowManagerInternalClientProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WindowManagerInternalClientProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WindowManagerInternalClientProxy.unbound() : super.unbound();

  String get name => WindowManagerInternalClient.name;

  static WindowManagerInternalClientProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WindowManagerInternalClientProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void dispatchInputEventToView(int viewId, input_events_mojom.Event event) {
    var params = new WindowManagerInternalClientDispatchInputEventToViewParams();
    params.viewId = viewId;
    params.event = event;
    sendMessage(params, kWindowManagerInternalClient_dispatchInputEventToView_name);
  }

  void setViewportSize(geometry_mojom.Size size) {
    var params = new WindowManagerInternalClientSetViewportSizeParams();
    params.size = size;
    sendMessage(params, kWindowManagerInternalClient_setViewportSize_name);
  }

  void cloneAndAnimate(int viewId) {
    var params = new WindowManagerInternalClientCloneAndAnimateParams();
    params.viewId = viewId;
    sendMessage(params, kWindowManagerInternalClient_cloneAndAnimate_name);
  }

}

class WindowManagerInternalClientStub extends bindings.Stub {
  WindowManagerInternalClient _delegate = null;

  WindowManagerInternalClientStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WindowManagerInternalClientStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WindowManagerInternalClientStub.unbound() : super.unbound();

  static WindowManagerInternalClientStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WindowManagerInternalClientStub(endpoint);

  static const String name = WindowManagerInternalClient.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kWindowManagerInternalClient_dispatchInputEventToView_name:
        var params = WindowManagerInternalClientDispatchInputEventToViewParams.deserialize(
            message.payload);
        _delegate.dispatchInputEventToView(params.viewId, params.event);
        break;
      case kWindowManagerInternalClient_setViewportSize_name:
        var params = WindowManagerInternalClientSetViewportSizeParams.deserialize(
            message.payload);
        _delegate.setViewportSize(params.size);
        break;
      case kWindowManagerInternalClient_cloneAndAnimate_name:
        var params = WindowManagerInternalClientCloneAndAnimateParams.deserialize(
            message.payload);
        _delegate.cloneAndAnimate(params.viewId);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  WindowManagerInternalClient get delegate => _delegate;
      set delegate(WindowManagerInternalClient d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




