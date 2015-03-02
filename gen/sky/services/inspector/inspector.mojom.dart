// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library inspector.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class InspectorFrontendSendMessageParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String message = null;

  InspectorFrontendSendMessageParams() : super(kStructSize);

  static InspectorFrontendSendMessageParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static InspectorFrontendSendMessageParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    InspectorFrontendSendMessageParams result = new InspectorFrontendSendMessageParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.message = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(message, 8, false);
  }
}

class InspectorBackendOnConnectParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  InspectorBackendOnConnectParams() : super(kStructSize);

  static InspectorBackendOnConnectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static InspectorBackendOnConnectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    InspectorBackendOnConnectParams result = new InspectorBackendOnConnectParams();

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

class InspectorBackendOnDisconnectParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  InspectorBackendOnDisconnectParams() : super(kStructSize);

  static InspectorBackendOnDisconnectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static InspectorBackendOnDisconnectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    InspectorBackendOnDisconnectParams result = new InspectorBackendOnDisconnectParams();

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

class InspectorBackendOnMessageParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String message = null;

  InspectorBackendOnMessageParams() : super(kStructSize);

  static InspectorBackendOnMessageParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static InspectorBackendOnMessageParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    InspectorBackendOnMessageParams result = new InspectorBackendOnMessageParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.message = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(message, 8, false);
  }
}
const int kInspectorFrontend_sendMessage_name = 0;

const String InspectorFrontendName =
      'sky::InspectorFrontend';

abstract class InspectorFrontend {
  void sendMessage(String message);

}


class InspectorFrontendProxyImpl extends bindings.Proxy {
  InspectorFrontendProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  InspectorFrontendProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  InspectorFrontendProxyImpl.unbound() : super.unbound();

  static InspectorFrontendProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorFrontendProxyImpl.fromEndpoint(endpoint);

  String get name => InspectorFrontendName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
}


class _InspectorFrontendProxyCalls implements InspectorFrontend {
  InspectorFrontendProxyImpl _proxyImpl;

  _InspectorFrontendProxyCalls(this._proxyImpl);
    void sendMessage(String message) {
      var params = new InspectorFrontendSendMessageParams();
      params.message = message;
      _proxyImpl.sendMessage(params, kInspectorFrontend_sendMessage_name);
    }
  
}


class InspectorFrontendProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  InspectorFrontend ptr;
  final String name = InspectorFrontendName;

  InspectorFrontendProxy(InspectorFrontendProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _InspectorFrontendProxyCalls(proxyImpl);

  InspectorFrontendProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new InspectorFrontendProxyImpl.fromEndpoint(endpoint) {
    ptr = new _InspectorFrontendProxyCalls(impl);
  }

  InspectorFrontendProxy.fromHandle(core.MojoHandle handle) :
      impl = new InspectorFrontendProxyImpl.fromHandle(handle) {
    ptr = new _InspectorFrontendProxyCalls(impl);
  }

  InspectorFrontendProxy.unbound() :
      impl = new InspectorFrontendProxyImpl.unbound() {
    ptr = new _InspectorFrontendProxyCalls(impl);
  }

  static InspectorFrontendProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorFrontendProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class InspectorFrontendStub extends bindings.Stub {
  InspectorFrontend _delegate = null;

  InspectorFrontendStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  InspectorFrontendStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  InspectorFrontendStub.unbound() : super.unbound();

  static InspectorFrontendStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorFrontendStub.fromEndpoint(endpoint);

  static const String name = InspectorFrontendName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kInspectorFrontend_sendMessage_name:
        var params = InspectorFrontendSendMessageParams.deserialize(
            message.payload);
        _delegate.sendMessage(params.message);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  InspectorFrontend get delegate => _delegate;
      set delegate(InspectorFrontend d) {
    assert(_delegate == null);
    _delegate = d;
  }
}

const int kInspectorBackend_onConnect_name = 0;
const int kInspectorBackend_onDisconnect_name = 1;
const int kInspectorBackend_onMessage_name = 2;

const String InspectorBackendName =
      'sky::InspectorBackend';

abstract class InspectorBackend {
  void onConnect();
  void onDisconnect();
  void onMessage(String message);

}


class InspectorBackendProxyImpl extends bindings.Proxy {
  InspectorBackendProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  InspectorBackendProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  InspectorBackendProxyImpl.unbound() : super.unbound();

  static InspectorBackendProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorBackendProxyImpl.fromEndpoint(endpoint);

  String get name => InspectorBackendName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
}


class _InspectorBackendProxyCalls implements InspectorBackend {
  InspectorBackendProxyImpl _proxyImpl;

  _InspectorBackendProxyCalls(this._proxyImpl);
    void onConnect() {
      var params = new InspectorBackendOnConnectParams();
      _proxyImpl.sendMessage(params, kInspectorBackend_onConnect_name);
    }
  
    void onDisconnect() {
      var params = new InspectorBackendOnDisconnectParams();
      _proxyImpl.sendMessage(params, kInspectorBackend_onDisconnect_name);
    }
  
    void onMessage(String message) {
      var params = new InspectorBackendOnMessageParams();
      params.message = message;
      _proxyImpl.sendMessage(params, kInspectorBackend_onMessage_name);
    }
  
}


class InspectorBackendProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  InspectorBackend ptr;
  final String name = InspectorBackendName;

  InspectorBackendProxy(InspectorBackendProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _InspectorBackendProxyCalls(proxyImpl);

  InspectorBackendProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new InspectorBackendProxyImpl.fromEndpoint(endpoint) {
    ptr = new _InspectorBackendProxyCalls(impl);
  }

  InspectorBackendProxy.fromHandle(core.MojoHandle handle) :
      impl = new InspectorBackendProxyImpl.fromHandle(handle) {
    ptr = new _InspectorBackendProxyCalls(impl);
  }

  InspectorBackendProxy.unbound() :
      impl = new InspectorBackendProxyImpl.unbound() {
    ptr = new _InspectorBackendProxyCalls(impl);
  }

  static InspectorBackendProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorBackendProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class InspectorBackendStub extends bindings.Stub {
  InspectorBackend _delegate = null;

  InspectorBackendStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  InspectorBackendStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  InspectorBackendStub.unbound() : super.unbound();

  static InspectorBackendStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new InspectorBackendStub.fromEndpoint(endpoint);

  static const String name = InspectorBackendName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kInspectorBackend_onConnect_name:
        var params = InspectorBackendOnConnectParams.deserialize(
            message.payload);
        _delegate.onConnect();
        break;
      case kInspectorBackend_onDisconnect_name:
        var params = InspectorBackendOnDisconnectParams.deserialize(
            message.payload);
        _delegate.onDisconnect();
        break;
      case kInspectorBackend_onMessage_name:
        var params = InspectorBackendOnMessageParams.deserialize(
            message.payload);
        _delegate.onMessage(params.message);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  InspectorBackend get delegate => _delegate;
      set delegate(InspectorBackend d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


