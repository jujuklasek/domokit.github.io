// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library example_service.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class ExampleServicePingParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int pingValue = 0;

  ExampleServicePingParams() : super(kStructSize);

  static ExampleServicePingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ExampleServicePingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ExampleServicePingParams result = new ExampleServicePingParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.pingValue = decoder0.decodeUint16(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint16(pingValue, 8);
  }
}

class ExampleServicePingResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int pongValue = 0;

  ExampleServicePingResponseParams() : super(kStructSize);

  static ExampleServicePingResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ExampleServicePingResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ExampleServicePingResponseParams result = new ExampleServicePingResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.pongValue = decoder0.decodeUint16(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeUint16(pongValue, 8);
  }
}
const int kExampleService_ping_name = 0;

const String ExampleServiceName =
      'mojo::ExampleService';

abstract class ExampleService {
  Future<ExampleServicePingResponseParams> ping(int pingValue,[Function responseFactory = null]);

}


class ExampleServiceProxyImpl extends bindings.Proxy {
  ExampleServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ExampleServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ExampleServiceProxyImpl.unbound() : super.unbound();

  static ExampleServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ExampleServiceProxyImpl.fromEndpoint(endpoint);

  String get name => ExampleServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kExampleService_ping_name:
        var r = ExampleServicePingResponseParams.deserialize(
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
}


class _ExampleServiceProxyCalls implements ExampleService {
  ExampleServiceProxyImpl _proxyImpl;

  _ExampleServiceProxyCalls(this._proxyImpl);
    Future<ExampleServicePingResponseParams> ping(int pingValue,[Function responseFactory = null]) {
      var params = new ExampleServicePingParams();
      params.pingValue = pingValue;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kExampleService_ping_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class ExampleServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ExampleService ptr;
  final String name = ExampleServiceName;

  ExampleServiceProxy(ExampleServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ExampleServiceProxyCalls(proxyImpl);

  ExampleServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ExampleServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ExampleServiceProxyCalls(impl);
  }

  ExampleServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new ExampleServiceProxyImpl.fromHandle(handle) {
    ptr = new _ExampleServiceProxyCalls(impl);
  }

  ExampleServiceProxy.unbound() :
      impl = new ExampleServiceProxyImpl.unbound() {
    ptr = new _ExampleServiceProxyCalls(impl);
  }

  static ExampleServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ExampleServiceProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class ExampleServiceStub extends bindings.Stub {
  ExampleService _delegate = null;

  ExampleServiceStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  ExampleServiceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ExampleServiceStub.unbound() : super.unbound();

  static ExampleServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ExampleServiceStub.fromEndpoint(endpoint);

  static const String name = ExampleServiceName;


  ExampleServicePingResponseParams _ExampleServicePingResponseParamsFactory(int pongValue) {
    var result = new ExampleServicePingResponseParams();
    result.pongValue = pongValue;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kExampleService_ping_name:
        var params = ExampleServicePingParams.deserialize(
            message.payload);
        return _delegate.ping(params.pingValue,_ExampleServicePingResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kExampleService_ping_name,
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

  ExampleService get delegate => _delegate;
      set delegate(ExampleService d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


