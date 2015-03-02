// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library window_manager.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/services/geometry/public/interfaces/geometry.mojom.dart' as geometry_mojom;


class IWindowManagerCloseWindowParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int nodeId = 0;

  IWindowManagerCloseWindowParams() : super(kStructSize);

  static IWindowManagerCloseWindowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IWindowManagerCloseWindowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IWindowManagerCloseWindowParams result = new IWindowManagerCloseWindowParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.nodeId = decoder0.decodeUint32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint32(nodeId, 8);
  }
}
const int kIWindowManager_closeWindow_name = 0;

const String IWindowManagerName =
      'mojo::IWindowManager';

abstract class IWindowManager {
  void closeWindow(int nodeId);

}


class IWindowManagerProxyImpl extends bindings.Proxy {
  IWindowManagerProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  IWindowManagerProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IWindowManagerProxyImpl.unbound() : super.unbound();

  static IWindowManagerProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IWindowManagerProxyImpl.fromEndpoint(endpoint);

  String get name => IWindowManagerName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
}


class _IWindowManagerProxyCalls implements IWindowManager {
  IWindowManagerProxyImpl _proxyImpl;

  _IWindowManagerProxyCalls(this._proxyImpl);
    void closeWindow(int nodeId) {
      var params = new IWindowManagerCloseWindowParams();
      params.nodeId = nodeId;
      _proxyImpl.sendMessage(params, kIWindowManager_closeWindow_name);
    }
  
}


class IWindowManagerProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  IWindowManager ptr;
  final String name = IWindowManagerName;

  IWindowManagerProxy(IWindowManagerProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _IWindowManagerProxyCalls(proxyImpl);

  IWindowManagerProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new IWindowManagerProxyImpl.fromEndpoint(endpoint) {
    ptr = new _IWindowManagerProxyCalls(impl);
  }

  IWindowManagerProxy.fromHandle(core.MojoHandle handle) :
      impl = new IWindowManagerProxyImpl.fromHandle(handle) {
    ptr = new _IWindowManagerProxyCalls(impl);
  }

  IWindowManagerProxy.unbound() :
      impl = new IWindowManagerProxyImpl.unbound() {
    ptr = new _IWindowManagerProxyCalls(impl);
  }

  static IWindowManagerProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IWindowManagerProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class IWindowManagerStub extends bindings.Stub {
  IWindowManager _delegate = null;

  IWindowManagerStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  IWindowManagerStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IWindowManagerStub.unbound() : super.unbound();

  static IWindowManagerStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IWindowManagerStub.fromEndpoint(endpoint);

  static const String name = IWindowManagerName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kIWindowManager_closeWindow_name:
        var params = IWindowManagerCloseWindowParams.deserialize(
            message.payload);
        _delegate.closeWindow(params.nodeId);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  IWindowManager get delegate => _delegate;
      set delegate(IWindowManager d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


