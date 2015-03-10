// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library inspector.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class InspectorServiceInjectParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  InspectorServiceInjectParams() : super(kStructSize);

  static InspectorServiceInjectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static InspectorServiceInjectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    InspectorServiceInjectParams result = new InspectorServiceInjectParams();

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

  String toString() {
    return "InspectorServiceInjectParams("")";
  }
}
const int kInspectorService_inject_name = 0;

const String InspectorServiceName =
      'sky::InspectorService';

abstract class InspectorService {
  void inject();

}


class InspectorServiceProxyImpl extends bindings.Proxy {
  InspectorServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  InspectorServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  InspectorServiceProxyImpl.unbound() : super.unbound();

  static InspectorServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorServiceProxyImpl.fromEndpoint(endpoint);

  String get name => InspectorServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "InspectorServiceProxyImpl($superString)";
  }
}


class _InspectorServiceProxyCalls implements InspectorService {
  InspectorServiceProxyImpl _proxyImpl;

  _InspectorServiceProxyCalls(this._proxyImpl);
    void inject() {
      assert(_proxyImpl.isBound);
      var params = new InspectorServiceInjectParams();
      _proxyImpl.sendMessage(params, kInspectorService_inject_name);
    }
  
}


class InspectorServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  InspectorService ptr;
  final String name = InspectorServiceName;

  InspectorServiceProxy(InspectorServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _InspectorServiceProxyCalls(proxyImpl);

  InspectorServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new InspectorServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _InspectorServiceProxyCalls(impl);
  }

  InspectorServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new InspectorServiceProxyImpl.fromHandle(handle) {
    ptr = new _InspectorServiceProxyCalls(impl);
  }

  InspectorServiceProxy.unbound() :
      impl = new InspectorServiceProxyImpl.unbound() {
    ptr = new _InspectorServiceProxyCalls(impl);
  }

  static InspectorServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorServiceProxy.fromEndpoint(endpoint);

  void close() => impl.close();

  String toString() {
    return "InspectorServiceProxy($impl)";
  }
}


class InspectorServiceStub extends bindings.Stub {
  InspectorService _impl = null;

  InspectorServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  InspectorServiceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  InspectorServiceStub.unbound() : super.unbound();

  static InspectorServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorServiceStub.fromEndpoint(endpoint);

  static const String name = InspectorServiceName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kInspectorService_inject_name:
        var params = InspectorServiceInjectParams.deserialize(
            message.payload);
        _impl.inject();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  InspectorService get impl => _impl;
      set impl(InspectorService d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "InspectorServiceStub($superString)";
  }
}


