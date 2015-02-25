// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library window_manager.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;
import 'package:mojo/services/input_events/public/interfaces/input_events.mojom.dart' as input_events_mojom;
import 'package:mojo/public/interfaces/application/service_provider.mojom.dart' as service_provider_mojom;


class WindowManagerEmbedParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  String url = null;
  Object services = null;
  Object exposedServices = null;

  WindowManagerEmbedParams() : super(kStructSize);

  static WindowManagerEmbedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerEmbedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerEmbedParams result = new WindowManagerEmbedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.url = decoder0.decodeString(8, false);
    }
    {
      
      result.services = decoder0.decodeInterfaceRequest(16, true, service_provider_mojom.ServiceProviderStub.newFromEndpoint);
    }
    {
      
      result.exposedServices = decoder0.decodeServiceInterface(20, true, service_provider_mojom.ServiceProviderProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(url, 8, false);
    
    encoder0.encodeInterfaceRequest(services, 16, true);
    
    encoder0.encodeInterface(exposedServices, 20, true);
  }
}

class WindowManagerSetCaptureParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int viewId = 0;

  WindowManagerSetCaptureParams() : super(kStructSize);

  static WindowManagerSetCaptureParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerSetCaptureParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerSetCaptureParams result = new WindowManagerSetCaptureParams();

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

class WindowManagerSetCaptureResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  WindowManagerSetCaptureResponseParams() : super(kStructSize);

  static WindowManagerSetCaptureResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerSetCaptureResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerSetCaptureResponseParams result = new WindowManagerSetCaptureResponseParams();

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

class WindowManagerFocusWindowParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int viewId = 0;

  WindowManagerFocusWindowParams() : super(kStructSize);

  static WindowManagerFocusWindowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerFocusWindowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerFocusWindowParams result = new WindowManagerFocusWindowParams();

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

class WindowManagerFocusWindowResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  WindowManagerFocusWindowResponseParams() : super(kStructSize);

  static WindowManagerFocusWindowResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerFocusWindowResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerFocusWindowResponseParams result = new WindowManagerFocusWindowResponseParams();

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

class WindowManagerActivateWindowParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int viewId = 0;

  WindowManagerActivateWindowParams() : super(kStructSize);

  static WindowManagerActivateWindowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerActivateWindowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerActivateWindowParams result = new WindowManagerActivateWindowParams();

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

class WindowManagerActivateWindowResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool success = false;

  WindowManagerActivateWindowResponseParams() : super(kStructSize);

  static WindowManagerActivateWindowResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerActivateWindowResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerActivateWindowResponseParams result = new WindowManagerActivateWindowResponseParams();

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

class WindowManagerGetFocusedAndActiveViewsParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object observer = null;

  WindowManagerGetFocusedAndActiveViewsParams() : super(kStructSize);

  static WindowManagerGetFocusedAndActiveViewsParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerGetFocusedAndActiveViewsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerGetFocusedAndActiveViewsParams result = new WindowManagerGetFocusedAndActiveViewsParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.observer = decoder0.decodeServiceInterface(8, true, WindowManagerObserverProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(observer, 8, true);
  }
}

class WindowManagerGetFocusedAndActiveViewsResponseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  int captureViewId = 0;
  int focusedViewId = 0;
  int activeViewId = 0;

  WindowManagerGetFocusedAndActiveViewsResponseParams() : super(kStructSize);

  static WindowManagerGetFocusedAndActiveViewsResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerGetFocusedAndActiveViewsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerGetFocusedAndActiveViewsResponseParams result = new WindowManagerGetFocusedAndActiveViewsResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 3)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.captureViewId = decoder0.decodeUint32(8);
    }
    {
      
      result.focusedViewId = decoder0.decodeUint32(12);
    }
    {
      
      result.activeViewId = decoder0.decodeUint32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(captureViewId, 8);
    
    encoder0.encodeUint32(focusedViewId, 12);
    
    encoder0.encodeUint32(activeViewId, 16);
  }
}

class WindowManagerObserverOnCaptureChangedParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int captureViewId = 0;

  WindowManagerObserverOnCaptureChangedParams() : super(kStructSize);

  static WindowManagerObserverOnCaptureChangedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerObserverOnCaptureChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerObserverOnCaptureChangedParams result = new WindowManagerObserverOnCaptureChangedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.captureViewId = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(captureViewId, 8);
  }
}

class WindowManagerObserverOnFocusChangedParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int focusedViewId = 0;

  WindowManagerObserverOnFocusChangedParams() : super(kStructSize);

  static WindowManagerObserverOnFocusChangedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerObserverOnFocusChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerObserverOnFocusChangedParams result = new WindowManagerObserverOnFocusChangedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.focusedViewId = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(focusedViewId, 8);
  }
}

class WindowManagerObserverOnActiveWindowChangedParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int focusedViewId = 0;

  WindowManagerObserverOnActiveWindowChangedParams() : super(kStructSize);

  static WindowManagerObserverOnActiveWindowChangedParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowManagerObserverOnActiveWindowChangedParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowManagerObserverOnActiveWindowChangedParams result = new WindowManagerObserverOnActiveWindowChangedParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.focusedViewId = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(focusedViewId, 8);
  }
}
const int kWindowManager_embed_name = 0;
const int kWindowManager_setCapture_name = 1;
const int kWindowManager_focusWindow_name = 2;
const int kWindowManager_activateWindow_name = 3;
const int kWindowManager_getFocusedAndActiveViews_name = 4;

abstract class WindowManager implements core.Listener {
  static const String name = 'mojo::WindowManager';
  WindowManagerStub stub;

  WindowManager(core.MojoMessagePipeEndpoint endpoint) :
      stub = new WindowManagerStub(endpoint);

  WindowManager.fromHandle(core.MojoHandle handle) :
      stub = new WindowManagerStub.fromHandle(handle);

  WindowManager.fromStub(this.stub);

  WindowManager.unbound() :
      stub = new WindowManagerStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  WindowManager get delegate => stub.delegate;
  set delegate(WindowManager d) {
    stub.delegate = d;
  }
  void embed(String url, Object services, Object exposedServices);
  Future<WindowManagerSetCaptureResponseParams> setCapture(int viewId,[Function responseFactory = null]);
  Future<WindowManagerFocusWindowResponseParams> focusWindow(int viewId,[Function responseFactory = null]);
  Future<WindowManagerActivateWindowResponseParams> activateWindow(int viewId,[Function responseFactory = null]);
  Future<WindowManagerGetFocusedAndActiveViewsResponseParams> getFocusedAndActiveViews(Object observer,[Function responseFactory = null]);

}

class WindowManagerProxy extends bindings.Proxy implements WindowManager {
  WindowManagerProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WindowManagerProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WindowManagerProxy.unbound() : super.unbound();

  String get name => WindowManager.name;

  static WindowManagerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WindowManagerProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kWindowManager_setCapture_name:
        var r = WindowManagerSetCaptureResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kWindowManager_focusWindow_name:
        var r = WindowManagerFocusWindowResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kWindowManager_activateWindow_name:
        var r = WindowManagerActivateWindowResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kWindowManager_getFocusedAndActiveViews_name:
        var r = WindowManagerGetFocusedAndActiveViewsResponseParams.deserialize(
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
  void embed(String url, Object services, Object exposedServices) {
    var params = new WindowManagerEmbedParams();
    params.url = url;
    params.services = services;
    params.exposedServices = exposedServices;
    sendMessage(params, kWindowManager_embed_name);
  }

  Future<WindowManagerSetCaptureResponseParams> setCapture(int viewId,[Function responseFactory = null]) {
    var params = new WindowManagerSetCaptureParams();
    params.viewId = viewId;
    return sendMessageWithRequestId(
        params,
        kWindowManager_setCapture_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<WindowManagerFocusWindowResponseParams> focusWindow(int viewId,[Function responseFactory = null]) {
    var params = new WindowManagerFocusWindowParams();
    params.viewId = viewId;
    return sendMessageWithRequestId(
        params,
        kWindowManager_focusWindow_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<WindowManagerActivateWindowResponseParams> activateWindow(int viewId,[Function responseFactory = null]) {
    var params = new WindowManagerActivateWindowParams();
    params.viewId = viewId;
    return sendMessageWithRequestId(
        params,
        kWindowManager_activateWindow_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<WindowManagerGetFocusedAndActiveViewsResponseParams> getFocusedAndActiveViews(Object observer,[Function responseFactory = null]) {
    var params = new WindowManagerGetFocusedAndActiveViewsParams();
    params.observer = observer;
    return sendMessageWithRequestId(
        params,
        kWindowManager_getFocusedAndActiveViews_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class WindowManagerStub extends bindings.Stub {
  WindowManager _delegate = null;

  WindowManagerStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WindowManagerStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WindowManagerStub.unbound() : super.unbound();

  static WindowManagerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WindowManagerStub(endpoint);

  static const String name = WindowManager.name;


  WindowManagerSetCaptureResponseParams _WindowManagerSetCaptureResponseParamsFactory(bool success) {
    var result = new WindowManagerSetCaptureResponseParams();
    result.success = success;
    return result;
  }
  WindowManagerFocusWindowResponseParams _WindowManagerFocusWindowResponseParamsFactory(bool success) {
    var result = new WindowManagerFocusWindowResponseParams();
    result.success = success;
    return result;
  }
  WindowManagerActivateWindowResponseParams _WindowManagerActivateWindowResponseParamsFactory(bool success) {
    var result = new WindowManagerActivateWindowResponseParams();
    result.success = success;
    return result;
  }
  WindowManagerGetFocusedAndActiveViewsResponseParams _WindowManagerGetFocusedAndActiveViewsResponseParamsFactory(int captureViewId, int focusedViewId, int activeViewId) {
    var result = new WindowManagerGetFocusedAndActiveViewsResponseParams();
    result.captureViewId = captureViewId;
    result.focusedViewId = focusedViewId;
    result.activeViewId = activeViewId;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kWindowManager_embed_name:
        var params = WindowManagerEmbedParams.deserialize(
            message.payload);
        _delegate.embed(params.url, params.services, params.exposedServices);
        break;
      case kWindowManager_setCapture_name:
        var params = WindowManagerSetCaptureParams.deserialize(
            message.payload);
        return _delegate.setCapture(params.viewId,_WindowManagerSetCaptureResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kWindowManager_setCapture_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kWindowManager_focusWindow_name:
        var params = WindowManagerFocusWindowParams.deserialize(
            message.payload);
        return _delegate.focusWindow(params.viewId,_WindowManagerFocusWindowResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kWindowManager_focusWindow_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kWindowManager_activateWindow_name:
        var params = WindowManagerActivateWindowParams.deserialize(
            message.payload);
        return _delegate.activateWindow(params.viewId,_WindowManagerActivateWindowResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kWindowManager_activateWindow_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kWindowManager_getFocusedAndActiveViews_name:
        var params = WindowManagerGetFocusedAndActiveViewsParams.deserialize(
            message.payload);
        return _delegate.getFocusedAndActiveViews(params.observer,_WindowManagerGetFocusedAndActiveViewsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kWindowManager_getFocusedAndActiveViews_name,
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

  WindowManager get delegate => _delegate;
      set delegate(WindowManager d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kWindowManagerObserver_onCaptureChanged_name = 0;
const int kWindowManagerObserver_onFocusChanged_name = 1;
const int kWindowManagerObserver_onActiveWindowChanged_name = 2;

abstract class WindowManagerObserver implements core.Listener {
  static const String name = 'mojo::WindowManagerObserver';
  WindowManagerObserverStub stub;

  WindowManagerObserver(core.MojoMessagePipeEndpoint endpoint) :
      stub = new WindowManagerObserverStub(endpoint);

  WindowManagerObserver.fromHandle(core.MojoHandle handle) :
      stub = new WindowManagerObserverStub.fromHandle(handle);

  WindowManagerObserver.fromStub(this.stub);

  WindowManagerObserver.unbound() :
      stub = new WindowManagerObserverStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  WindowManagerObserver get delegate => stub.delegate;
  set delegate(WindowManagerObserver d) {
    stub.delegate = d;
  }
  void onCaptureChanged(int captureViewId);
  void onFocusChanged(int focusedViewId);
  void onActiveWindowChanged(int focusedViewId);

}

class WindowManagerObserverProxy extends bindings.Proxy implements WindowManagerObserver {
  WindowManagerObserverProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WindowManagerObserverProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WindowManagerObserverProxy.unbound() : super.unbound();

  String get name => WindowManagerObserver.name;

  static WindowManagerObserverProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WindowManagerObserverProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void onCaptureChanged(int captureViewId) {
    var params = new WindowManagerObserverOnCaptureChangedParams();
    params.captureViewId = captureViewId;
    sendMessage(params, kWindowManagerObserver_onCaptureChanged_name);
  }

  void onFocusChanged(int focusedViewId) {
    var params = new WindowManagerObserverOnFocusChangedParams();
    params.focusedViewId = focusedViewId;
    sendMessage(params, kWindowManagerObserver_onFocusChanged_name);
  }

  void onActiveWindowChanged(int focusedViewId) {
    var params = new WindowManagerObserverOnActiveWindowChangedParams();
    params.focusedViewId = focusedViewId;
    sendMessage(params, kWindowManagerObserver_onActiveWindowChanged_name);
  }

}

class WindowManagerObserverStub extends bindings.Stub {
  WindowManagerObserver _delegate = null;

  WindowManagerObserverStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WindowManagerObserverStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WindowManagerObserverStub.unbound() : super.unbound();

  static WindowManagerObserverStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WindowManagerObserverStub(endpoint);

  static const String name = WindowManagerObserver.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kWindowManagerObserver_onCaptureChanged_name:
        var params = WindowManagerObserverOnCaptureChangedParams.deserialize(
            message.payload);
        _delegate.onCaptureChanged(params.captureViewId);
        break;
      case kWindowManagerObserver_onFocusChanged_name:
        var params = WindowManagerObserverOnFocusChangedParams.deserialize(
            message.payload);
        _delegate.onFocusChanged(params.focusedViewId);
        break;
      case kWindowManagerObserver_onActiveWindowChanged_name:
        var params = WindowManagerObserverOnActiveWindowChangedParams.deserialize(
            message.payload);
        _delegate.onActiveWindowChanged(params.focusedViewId);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  WindowManagerObserver get delegate => _delegate;
      set delegate(WindowManagerObserver d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



