// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library window_frame_host.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class WindowFrameHostActivateWindowParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  WindowFrameHostActivateWindowParams() : super(kStructSize);

  static WindowFrameHostActivateWindowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowFrameHostActivateWindowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowFrameHostActivateWindowParams result = new WindowFrameHostActivateWindowParams();

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

class WindowFrameHostCloseWindowParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  WindowFrameHostCloseWindowParams() : super(kStructSize);

  static WindowFrameHostCloseWindowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowFrameHostCloseWindowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowFrameHostCloseWindowParams result = new WindowFrameHostCloseWindowParams();

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

class WindowFrameHostSetCaptureParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool frameHasCapture = false;

  WindowFrameHostSetCaptureParams() : super(kStructSize);

  static WindowFrameHostSetCaptureParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowFrameHostSetCaptureParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowFrameHostSetCaptureParams result = new WindowFrameHostSetCaptureParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.frameHasCapture = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(frameHasCapture, 8, 0);
  }
}

class WindowFrameHostToggleMaximizeParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  WindowFrameHostToggleMaximizeParams() : super(kStructSize);

  static WindowFrameHostToggleMaximizeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowFrameHostToggleMaximizeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowFrameHostToggleMaximizeParams result = new WindowFrameHostToggleMaximizeParams();

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
const int kWindowFrameHost_activateWindow_name = 0;
const int kWindowFrameHost_closeWindow_name = 1;
const int kWindowFrameHost_setCapture_name = 2;
const int kWindowFrameHost_toggleMaximize_name = 3;

const String WindowFrameHostName =
      'examples::WindowFrameHost';

abstract class WindowFrameHost {
  void activateWindow();
  void closeWindow();
  void setCapture(bool frameHasCapture);
  void toggleMaximize();

}


class WindowFrameHostProxyImpl extends bindings.Proxy {
  WindowFrameHostProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  WindowFrameHostProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WindowFrameHostProxyImpl.unbound() : super.unbound();

  static WindowFrameHostProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WindowFrameHostProxyImpl.fromEndpoint(endpoint);

  String get name => WindowFrameHostName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
}


class _WindowFrameHostProxyCalls implements WindowFrameHost {
  WindowFrameHostProxyImpl _proxyImpl;

  _WindowFrameHostProxyCalls(this._proxyImpl);
    void activateWindow() {
      var params = new WindowFrameHostActivateWindowParams();
      _proxyImpl.sendMessage(params, kWindowFrameHost_activateWindow_name);
    }
  
    void closeWindow() {
      var params = new WindowFrameHostCloseWindowParams();
      _proxyImpl.sendMessage(params, kWindowFrameHost_closeWindow_name);
    }
  
    void setCapture(bool frameHasCapture) {
      var params = new WindowFrameHostSetCaptureParams();
      params.frameHasCapture = frameHasCapture;
      _proxyImpl.sendMessage(params, kWindowFrameHost_setCapture_name);
    }
  
    void toggleMaximize() {
      var params = new WindowFrameHostToggleMaximizeParams();
      _proxyImpl.sendMessage(params, kWindowFrameHost_toggleMaximize_name);
    }
  
}


class WindowFrameHostProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  WindowFrameHost ptr;
  final String name = WindowFrameHostName;

  WindowFrameHostProxy(WindowFrameHostProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _WindowFrameHostProxyCalls(proxyImpl);

  WindowFrameHostProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new WindowFrameHostProxyImpl.fromEndpoint(endpoint) {
    ptr = new _WindowFrameHostProxyCalls(impl);
  }

  WindowFrameHostProxy.fromHandle(core.MojoHandle handle) :
      impl = new WindowFrameHostProxyImpl.fromHandle(handle) {
    ptr = new _WindowFrameHostProxyCalls(impl);
  }

  WindowFrameHostProxy.unbound() :
      impl = new WindowFrameHostProxyImpl.unbound() {
    ptr = new _WindowFrameHostProxyCalls(impl);
  }

  static WindowFrameHostProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WindowFrameHostProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class WindowFrameHostStub extends bindings.Stub {
  WindowFrameHost _delegate = null;

  WindowFrameHostStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  WindowFrameHostStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  WindowFrameHostStub.unbound() : super.unbound();

  static WindowFrameHostStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WindowFrameHostStub.fromEndpoint(endpoint);

  static const String name = WindowFrameHostName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kWindowFrameHost_activateWindow_name:
        var params = WindowFrameHostActivateWindowParams.deserialize(
            message.payload);
        _delegate.activateWindow();
        break;
      case kWindowFrameHost_closeWindow_name:
        var params = WindowFrameHostCloseWindowParams.deserialize(
            message.payload);
        _delegate.closeWindow();
        break;
      case kWindowFrameHost_setCapture_name:
        var params = WindowFrameHostSetCaptureParams.deserialize(
            message.payload);
        _delegate.setCapture(params.frameHasCapture);
        break;
      case kWindowFrameHost_toggleMaximize_name:
        var params = WindowFrameHostToggleMaximizeParams.deserialize(
            message.payload);
        _delegate.toggleMaximize();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  WindowFrameHost get delegate => _delegate;
      set delegate(WindowFrameHost d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


