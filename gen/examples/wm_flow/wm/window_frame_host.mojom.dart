// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library window_frame_host.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class WindowFrameHostActivateWindowParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  WindowFrameHostActivateWindowParams() : super(kVersions.last.size);

  static WindowFrameHostActivateWindowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowFrameHostActivateWindowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowFrameHostActivateWindowParams result = new WindowFrameHostActivateWindowParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "WindowFrameHostActivateWindowParams("")";
  }
}

class WindowFrameHostCloseWindowParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  WindowFrameHostCloseWindowParams() : super(kVersions.last.size);

  static WindowFrameHostCloseWindowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowFrameHostCloseWindowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowFrameHostCloseWindowParams result = new WindowFrameHostCloseWindowParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "WindowFrameHostCloseWindowParams("")";
  }
}

class WindowFrameHostSetCaptureParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  bool frameHasCapture = false;

  WindowFrameHostSetCaptureParams() : super(kVersions.last.size);

  static WindowFrameHostSetCaptureParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowFrameHostSetCaptureParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowFrameHostSetCaptureParams result = new WindowFrameHostSetCaptureParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    if (mainDataHeader.version >= 0) {
      
      result.frameHasCapture = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeBool(frameHasCapture, 8, 0);
  }

  String toString() {
    return "WindowFrameHostSetCaptureParams("
           "frameHasCapture: $frameHasCapture" ")";
  }
}

class WindowFrameHostToggleMaximizeParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  WindowFrameHostToggleMaximizeParams() : super(kVersions.last.size);

  static WindowFrameHostToggleMaximizeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static WindowFrameHostToggleMaximizeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    WindowFrameHostToggleMaximizeParams result = new WindowFrameHostToggleMaximizeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "WindowFrameHostToggleMaximizeParams("")";
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
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

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

  String toString() {
    var superString = super.toString();
    return "WindowFrameHostProxyImpl($superString)";
  }
}


class _WindowFrameHostProxyCalls implements WindowFrameHost {
  WindowFrameHostProxyImpl _proxyImpl;

  _WindowFrameHostProxyCalls(this._proxyImpl);
    void activateWindow() {
      assert(_proxyImpl.isBound);
      var params = new WindowFrameHostActivateWindowParams();
      _proxyImpl.sendMessage(params, kWindowFrameHost_activateWindow_name);
    }
  
    void closeWindow() {
      assert(_proxyImpl.isBound);
      var params = new WindowFrameHostCloseWindowParams();
      _proxyImpl.sendMessage(params, kWindowFrameHost_closeWindow_name);
    }
  
    void setCapture(bool frameHasCapture) {
      assert(_proxyImpl.isBound);
      var params = new WindowFrameHostSetCaptureParams();
      params.frameHasCapture = frameHasCapture;
      _proxyImpl.sendMessage(params, kWindowFrameHost_setCapture_name);
    }
  
    void toggleMaximize() {
      assert(_proxyImpl.isBound);
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

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  String toString() {
    return "WindowFrameHostProxy($impl)";
  }
}


class WindowFrameHostStub extends bindings.Stub {
  WindowFrameHost _impl = null;

  WindowFrameHostStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  WindowFrameHostStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  WindowFrameHostStub.unbound() : super.unbound();

  static WindowFrameHostStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new WindowFrameHostStub.fromEndpoint(endpoint);

  static const String name = WindowFrameHostName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kWindowFrameHost_activateWindow_name:
        var params = WindowFrameHostActivateWindowParams.deserialize(
            message.payload);
        _impl.activateWindow();
        break;
      case kWindowFrameHost_closeWindow_name:
        var params = WindowFrameHostCloseWindowParams.deserialize(
            message.payload);
        _impl.closeWindow();
        break;
      case kWindowFrameHost_setCapture_name:
        var params = WindowFrameHostSetCaptureParams.deserialize(
            message.payload);
        _impl.setCapture(params.frameHasCapture);
        break;
      case kWindowFrameHost_toggleMaximize_name:
        var params = WindowFrameHostToggleMaximizeParams.deserialize(
            message.payload);
        _impl.toggleMaximize();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  WindowFrameHost get impl => _impl;
      set impl(WindowFrameHost d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "WindowFrameHostStub($superString)";
  }
}


