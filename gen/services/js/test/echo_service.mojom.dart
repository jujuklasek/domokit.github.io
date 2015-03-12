// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library echo_service.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;


class EchoServiceEchoStringParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String value = null;

  EchoServiceEchoStringParams() : super(kStructSize);

  static EchoServiceEchoStringParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EchoServiceEchoStringParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoServiceEchoStringParams result = new EchoServiceEchoStringParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.value = decoder0.decodeString(8, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(value, 8, true);
  }

  String toString() {
    return "EchoServiceEchoStringParams("
           "value: $value" ")";
  }
}

class EchoServiceEchoStringResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String value = null;

  EchoServiceEchoStringResponseParams() : super(kStructSize);

  static EchoServiceEchoStringResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EchoServiceEchoStringResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoServiceEchoStringResponseParams result = new EchoServiceEchoStringResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.value = decoder0.decodeString(8, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(value, 8, true);
  }

  String toString() {
    return "EchoServiceEchoStringResponseParams("
           "value: $value" ")";
  }
}

class EchoServiceShareEchoServiceParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  EchoServiceShareEchoServiceParams() : super(kStructSize);

  static EchoServiceShareEchoServiceParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EchoServiceShareEchoServiceParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoServiceShareEchoServiceParams result = new EchoServiceShareEchoServiceParams();

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
    return "EchoServiceShareEchoServiceParams("")";
  }
}

class EchoServiceShareEchoServiceResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool ok = false;

  EchoServiceShareEchoServiceResponseParams() : super(kStructSize);

  static EchoServiceShareEchoServiceResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EchoServiceShareEchoServiceResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoServiceShareEchoServiceResponseParams result = new EchoServiceShareEchoServiceResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.ok = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(ok, 8, 0);
  }

  String toString() {
    return "EchoServiceShareEchoServiceResponseParams("
           "ok: $ok" ")";
  }
}

class EchoServiceQuitParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  EchoServiceQuitParams() : super(kStructSize);

  static EchoServiceQuitParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EchoServiceQuitParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoServiceQuitParams result = new EchoServiceQuitParams();

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
    return "EchoServiceQuitParams("")";
  }
}
const int kEchoService_echoString_name = 0;
const int kEchoService_shareEchoService_name = 1;
const int kEchoService_quit_name = 2;

const String EchoServiceName =
      'mojo::EchoService';

abstract class EchoService {
  Future<EchoServiceEchoStringResponseParams> echoString(String value,[Function responseFactory = null]);
  Future<EchoServiceShareEchoServiceResponseParams> shareEchoService([Function responseFactory = null]);
  void quit();

}


class EchoServiceProxyImpl extends bindings.Proxy {
  EchoServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  EchoServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EchoServiceProxyImpl.unbound() : super.unbound();

  static EchoServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EchoServiceProxyImpl.fromEndpoint(endpoint);

  String get name => EchoServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kEchoService_echoString_name:
        var r = EchoServiceEchoStringResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kEchoService_shareEchoService_name:
        var r = EchoServiceShareEchoServiceResponseParams.deserialize(
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
    return "EchoServiceProxyImpl($superString)";
  }
}


class _EchoServiceProxyCalls implements EchoService {
  EchoServiceProxyImpl _proxyImpl;

  _EchoServiceProxyCalls(this._proxyImpl);
    Future<EchoServiceEchoStringResponseParams> echoString(String value,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new EchoServiceEchoStringParams();
      params.value = value;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kEchoService_echoString_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<EchoServiceShareEchoServiceResponseParams> shareEchoService([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new EchoServiceShareEchoServiceParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kEchoService_shareEchoService_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void quit() {
      assert(_proxyImpl.isBound);
      var params = new EchoServiceQuitParams();
      _proxyImpl.sendMessage(params, kEchoService_quit_name);
    }
  
}


class EchoServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  EchoService ptr;
  final String name = EchoServiceName;

  EchoServiceProxy(EchoServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _EchoServiceProxyCalls(proxyImpl);

  EchoServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new EchoServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _EchoServiceProxyCalls(impl);
  }

  EchoServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new EchoServiceProxyImpl.fromHandle(handle) {
    ptr = new _EchoServiceProxyCalls(impl);
  }

  EchoServiceProxy.unbound() :
      impl = new EchoServiceProxyImpl.unbound() {
    ptr = new _EchoServiceProxyCalls(impl);
  }

  static EchoServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EchoServiceProxy.fromEndpoint(endpoint);

  Future close() => impl.close();

  String toString() {
    return "EchoServiceProxy($impl)";
  }
}


class EchoServiceStub extends bindings.Stub {
  EchoService _impl = null;

  EchoServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  EchoServiceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  EchoServiceStub.unbound() : super.unbound();

  static EchoServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EchoServiceStub.fromEndpoint(endpoint);

  static const String name = EchoServiceName;


  EchoServiceEchoStringResponseParams _EchoServiceEchoStringResponseParamsFactory(String value) {
    var result = new EchoServiceEchoStringResponseParams();
    result.value = value;
    return result;
  }
  EchoServiceShareEchoServiceResponseParams _EchoServiceShareEchoServiceResponseParamsFactory(bool ok) {
    var result = new EchoServiceShareEchoServiceResponseParams();
    result.ok = ok;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kEchoService_echoString_name:
        var params = EchoServiceEchoStringParams.deserialize(
            message.payload);
        return _impl.echoString(params.value,_EchoServiceEchoStringResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kEchoService_echoString_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kEchoService_shareEchoService_name:
        var params = EchoServiceShareEchoServiceParams.deserialize(
            message.payload);
        return _impl.shareEchoService(_EchoServiceShareEchoServiceResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kEchoService_shareEchoService_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kEchoService_quit_name:
        var params = EchoServiceQuitParams.deserialize(
            message.payload);
        _impl.quit();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  EchoService get impl => _impl;
      set impl(EchoService d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "EchoServiceStub($superString)";
  }
}


