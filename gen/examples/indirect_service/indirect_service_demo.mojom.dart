// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library indirect_service_demo.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;


class IntegerServiceIncrementParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  IntegerServiceIncrementParams() : super(kStructSize);

  static IntegerServiceIncrementParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IntegerServiceIncrementParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IntegerServiceIncrementParams result = new IntegerServiceIncrementParams();

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
    return "IntegerServiceIncrementParams("")";
  }
}

class IntegerServiceIncrementResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int value = 0;

  IntegerServiceIncrementResponseParams() : super(kStructSize);

  static IntegerServiceIncrementResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IntegerServiceIncrementResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IntegerServiceIncrementResponseParams result = new IntegerServiceIncrementResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.value = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(value, 8);
  }

  String toString() {
    return "IntegerServiceIncrementResponseParams("
           "value: $value" ")";
  }
}

class IndirectIntegerServiceSetParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  Object service = null;

  IndirectIntegerServiceSetParams() : super(kStructSize);

  static IndirectIntegerServiceSetParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IndirectIntegerServiceSetParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IndirectIntegerServiceSetParams result = new IndirectIntegerServiceSetParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.service = decoder0.decodeServiceInterface(8, true, IntegerServiceProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(service, 8, true);
  }

  String toString() {
    return "IndirectIntegerServiceSetParams("
           "service: $service" ")";
  }
}

class IndirectIntegerServiceGetParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  Object service = null;

  IndirectIntegerServiceGetParams() : super(kStructSize);

  static IndirectIntegerServiceGetParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IndirectIntegerServiceGetParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IndirectIntegerServiceGetParams result = new IndirectIntegerServiceGetParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.service = decoder0.decodeInterfaceRequest(8, true, IntegerServiceStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(service, 8, true);
  }

  String toString() {
    return "IndirectIntegerServiceGetParams("
           "service: $service" ")";
  }
}
const int kIntegerService_increment_name = 0;

const String IntegerServiceName =
      'mojo::examples::IntegerService';

abstract class IntegerService {
  Future<IntegerServiceIncrementResponseParams> increment([Function responseFactory = null]);

}


class IntegerServiceProxyImpl extends bindings.Proxy {
  IntegerServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  IntegerServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IntegerServiceProxyImpl.unbound() : super.unbound();

  static IntegerServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IntegerServiceProxyImpl.fromEndpoint(endpoint);

  String get name => IntegerServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kIntegerService_increment_name:
        var r = IntegerServiceIncrementResponseParams.deserialize(
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

  String toString() {
    var superString = super.toString();
    return "IntegerServiceProxyImpl($superString)";
  }
}


class _IntegerServiceProxyCalls implements IntegerService {
  IntegerServiceProxyImpl _proxyImpl;

  _IntegerServiceProxyCalls(this._proxyImpl);
    Future<IntegerServiceIncrementResponseParams> increment([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new IntegerServiceIncrementParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kIntegerService_increment_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class IntegerServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  IntegerService ptr;
  final String name = IntegerServiceName;

  IntegerServiceProxy(IntegerServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _IntegerServiceProxyCalls(proxyImpl);

  IntegerServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new IntegerServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _IntegerServiceProxyCalls(impl);
  }

  IntegerServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new IntegerServiceProxyImpl.fromHandle(handle) {
    ptr = new _IntegerServiceProxyCalls(impl);
  }

  IntegerServiceProxy.unbound() :
      impl = new IntegerServiceProxyImpl.unbound() {
    ptr = new _IntegerServiceProxyCalls(impl);
  }

  static IntegerServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IntegerServiceProxy.fromEndpoint(endpoint);

  Future close() => impl.close();

  String toString() {
    return "IntegerServiceProxy($impl)";
  }
}


class IntegerServiceStub extends bindings.Stub {
  IntegerService _impl = null;

  IntegerServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  IntegerServiceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  IntegerServiceStub.unbound() : super.unbound();

  static IntegerServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IntegerServiceStub.fromEndpoint(endpoint);

  static const String name = IntegerServiceName;


  IntegerServiceIncrementResponseParams _IntegerServiceIncrementResponseParamsFactory(int value) {
    var result = new IntegerServiceIncrementResponseParams();
    result.value = value;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kIntegerService_increment_name:
        var params = IntegerServiceIncrementParams.deserialize(
            message.payload);
        return _impl.increment(_IntegerServiceIncrementResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kIntegerService_increment_name,
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

  IntegerService get impl => _impl;
      set impl(IntegerService d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "IntegerServiceStub($superString)";
  }
}

const int kIndirectIntegerService_set_name = 0;
const int kIndirectIntegerService_get_name = 1;

const String IndirectIntegerServiceName =
      'mojo::examples::IndirectIntegerService';

abstract class IndirectIntegerService {
  void set(Object service);
  void get(Object service);

}


class IndirectIntegerServiceProxyImpl extends bindings.Proxy {
  IndirectIntegerServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  IndirectIntegerServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IndirectIntegerServiceProxyImpl.unbound() : super.unbound();

  static IndirectIntegerServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IndirectIntegerServiceProxyImpl.fromEndpoint(endpoint);

  String get name => IndirectIntegerServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "IndirectIntegerServiceProxyImpl($superString)";
  }
}


class _IndirectIntegerServiceProxyCalls implements IndirectIntegerService {
  IndirectIntegerServiceProxyImpl _proxyImpl;

  _IndirectIntegerServiceProxyCalls(this._proxyImpl);
    void set(Object service) {
      assert(_proxyImpl.isBound);
      var params = new IndirectIntegerServiceSetParams();
      params.service = service;
      _proxyImpl.sendMessage(params, kIndirectIntegerService_set_name);
    }
  
    void get(Object service) {
      assert(_proxyImpl.isBound);
      var params = new IndirectIntegerServiceGetParams();
      params.service = service;
      _proxyImpl.sendMessage(params, kIndirectIntegerService_get_name);
    }
  
}


class IndirectIntegerServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  IndirectIntegerService ptr;
  final String name = IndirectIntegerServiceName;

  IndirectIntegerServiceProxy(IndirectIntegerServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _IndirectIntegerServiceProxyCalls(proxyImpl);

  IndirectIntegerServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new IndirectIntegerServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _IndirectIntegerServiceProxyCalls(impl);
  }

  IndirectIntegerServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new IndirectIntegerServiceProxyImpl.fromHandle(handle) {
    ptr = new _IndirectIntegerServiceProxyCalls(impl);
  }

  IndirectIntegerServiceProxy.unbound() :
      impl = new IndirectIntegerServiceProxyImpl.unbound() {
    ptr = new _IndirectIntegerServiceProxyCalls(impl);
  }

  static IndirectIntegerServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IndirectIntegerServiceProxy.fromEndpoint(endpoint);

  Future close() => impl.close();

  String toString() {
    return "IndirectIntegerServiceProxy($impl)";
  }
}


class IndirectIntegerServiceStub extends bindings.Stub {
  IndirectIntegerService _impl = null;

  IndirectIntegerServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  IndirectIntegerServiceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  IndirectIntegerServiceStub.unbound() : super.unbound();

  static IndirectIntegerServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IndirectIntegerServiceStub.fromEndpoint(endpoint);

  static const String name = IndirectIntegerServiceName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kIndirectIntegerService_set_name:
        var params = IndirectIntegerServiceSetParams.deserialize(
            message.payload);
        _impl.set(params.service);
        break;
      case kIndirectIntegerService_get_name:
        var params = IndirectIntegerServiceGetParams.deserialize(
            message.payload);
        _impl.get(params.service);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  IndirectIntegerService get impl => _impl;
      set impl(IndirectIntegerService d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "IndirectIntegerServiceStub($superString)";
  }
}


