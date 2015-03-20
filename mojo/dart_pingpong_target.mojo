#!mojo mojo:dart_content_handler
PK     TlF:ĕI}  }  	   main.dart// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:mojo.application';
import 'dart:mojo.bindings';
import 'dart:mojo.core';

import 'package:services/dart/test/pingpong_service.mojom.dart';

class PingPongServiceImpl implements PingPongService {
  PingPongServiceStub _stub;
  Application _application;
  PingPongClientProxy _pingPongClient;

  PingPongServiceImpl(this._application, MojoMessagePipeEndpoint endpoint) {
    _stub = new PingPongServiceStub.fromEndpoint(endpoint, this);
  }

  void setClient(ProxyBase proxyBase) {
    assert(_pingPongClient == null);
    _pingPongClient = proxyBase;
  }

  void ping(int pingValue) => _pingPongClient.ptr.pong(pingValue + 1);

  // These methods are unimplemented; they merely throw on invocation.
  Future<PingPongServicePingTargetUrlResponseParams> pingTargetUrl(
          String url, int count, [Function responseFactory]) =>
      throw "Unimplemented";
  Future<PingPongServicePingTargetServiceResponseParams> pingTargetService(
          Object service, int count, [Function responseFactory]) =>
      throw "Unimplemented";
  void getPingPongService(Object service) => throw "Unimplemented";

  void quit() {
    if (_pingPongClient != null) {
      _pingPongClient.close();
      _pingPongClient = null;
    }
    _stub.close();
  }
}

class PingPongApplication extends Application {
  PingPongApplication.fromHandle(MojoHandle handle) : super.fromHandle(handle);

  @override
  void acceptConnection(String requestorUrl, String resolvedUrl,
      ApplicationConnection connection) {
    connection.provideService(PingPongServiceName,
        (endpoint) => new PingPongServiceImpl(this, endpoint));
    // Close the application when the first connection goes down.
    connection.onError = closeApplication;
  }

  Future closeApplication() async {
    await close();
    assert(MojoHandle.reportLeakedHandles());
  }
}

main(List args) {
  MojoHandle appHandle = new MojoHandle(args[0]);
  String url = args[1];
  new PingPongApplication.fromHandle(appHandle);
}
PK     8[tF�`L��a  �a  .   services/dart/test/pingpong_service.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library pingpong_service.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;


class PingPongServiceSetClientParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  Object client = null;

  PingPongServiceSetClientParams() : super(kStructSize);

  static PingPongServiceSetClientParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static PingPongServiceSetClientParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    PingPongServiceSetClientParams result = new PingPongServiceSetClientParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.client = decoder0.decodeServiceInterface(8, false, PingPongClientProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(client, 8, false);
  }

  String toString() {
    return "PingPongServiceSetClientParams("
           "client: $client" ")";
  }
}

class PingPongServicePingParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int pingValue = 0;

  PingPongServicePingParams() : super(kStructSize);

  static PingPongServicePingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static PingPongServicePingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    PingPongServicePingParams result = new PingPongServicePingParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
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

  String toString() {
    return "PingPongServicePingParams("
           "pingValue: $pingValue" ")";
  }
}

class PingPongServicePingTargetUrlParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  String url = null;
  int count = 0;

  PingPongServicePingTargetUrlParams() : super(kStructSize);

  static PingPongServicePingTargetUrlParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static PingPongServicePingTargetUrlParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    PingPongServicePingTargetUrlParams result = new PingPongServicePingTargetUrlParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.url = decoder0.decodeString(8, false);
    }
    {
      
      result.count = decoder0.decodeUint16(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(url, 8, false);
    
    encoder0.encodeUint16(count, 16);
  }

  String toString() {
    return "PingPongServicePingTargetUrlParams("
           "url: $url" ", "
           "count: $count" ")";
  }
}

class PingPongServicePingTargetUrlResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  bool ok = false;

  PingPongServicePingTargetUrlResponseParams() : super(kStructSize);

  static PingPongServicePingTargetUrlResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static PingPongServicePingTargetUrlResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    PingPongServicePingTargetUrlResponseParams result = new PingPongServicePingTargetUrlResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
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
    return "PingPongServicePingTargetUrlResponseParams("
           "ok: $ok" ")";
  }
}

class PingPongServicePingTargetServiceParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  Object service = null;
  int count = 0;

  PingPongServicePingTargetServiceParams() : super(kStructSize);

  static PingPongServicePingTargetServiceParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static PingPongServicePingTargetServiceParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    PingPongServicePingTargetServiceParams result = new PingPongServicePingTargetServiceParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.service = decoder0.decodeServiceInterface(8, false, PingPongServiceProxy.newFromEndpoint);
    }
    {
      
      result.count = decoder0.decodeUint16(12);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(service, 8, false);
    
    encoder0.encodeUint16(count, 12);
  }

  String toString() {
    return "PingPongServicePingTargetServiceParams("
           "service: $service" ", "
           "count: $count" ")";
  }
}

class PingPongServicePingTargetServiceResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  bool ok = false;

  PingPongServicePingTargetServiceResponseParams() : super(kStructSize);

  static PingPongServicePingTargetServiceResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static PingPongServicePingTargetServiceResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    PingPongServicePingTargetServiceResponseParams result = new PingPongServicePingTargetServiceResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
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
    return "PingPongServicePingTargetServiceResponseParams("
           "ok: $ok" ")";
  }
}

class PingPongServiceGetPingPongServiceParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  Object service = null;

  PingPongServiceGetPingPongServiceParams() : super(kStructSize);

  static PingPongServiceGetPingPongServiceParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static PingPongServiceGetPingPongServiceParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    PingPongServiceGetPingPongServiceParams result = new PingPongServiceGetPingPongServiceParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.service = decoder0.decodeInterfaceRequest(8, false, PingPongServiceStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(service, 8, false);
  }

  String toString() {
    return "PingPongServiceGetPingPongServiceParams("
           "service: $service" ")";
  }
}

class PingPongServiceQuitParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  PingPongServiceQuitParams() : super(kStructSize);

  static PingPongServiceQuitParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static PingPongServiceQuitParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    PingPongServiceQuitParams result = new PingPongServiceQuitParams();

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
    return "PingPongServiceQuitParams("")";
  }
}

class PingPongClientPongParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  int pongValue = 0;

  PingPongClientPongParams() : super(kStructSize);

  static PingPongClientPongParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static PingPongClientPongParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    PingPongClientPongParams result = new PingPongClientPongParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
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

  String toString() {
    return "PingPongClientPongParams("
           "pongValue: $pongValue" ")";
  }
}
const int kPingPongService_setClient_name = 0;
const int kPingPongService_ping_name = 1;
const int kPingPongService_pingTargetUrl_name = 2;
const int kPingPongService_pingTargetService_name = 3;
const int kPingPongService_getPingPongService_name = 4;
const int kPingPongService_quit_name = 5;

const String PingPongServiceName =
      'dart::PingPongService';

abstract class PingPongService {
  void setClient(Object client);
  void ping(int pingValue);
  Future<PingPongServicePingTargetUrlResponseParams> pingTargetUrl(String url,int count,[Function responseFactory = null]);
  Future<PingPongServicePingTargetServiceResponseParams> pingTargetService(Object service,int count,[Function responseFactory = null]);
  void getPingPongService(Object service);
  void quit();

}


class PingPongServiceProxyImpl extends bindings.Proxy {
  PingPongServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  PingPongServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  PingPongServiceProxyImpl.unbound() : super.unbound();

  static PingPongServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new PingPongServiceProxyImpl.fromEndpoint(endpoint);

  String get name => PingPongServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kPingPongService_pingTargetUrl_name:
        var r = PingPongServicePingTargetUrlResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      case kPingPongService_pingTargetService_name:
        var r = PingPongServicePingTargetServiceResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "PingPongServiceProxyImpl($superString)";
  }
}


class _PingPongServiceProxyCalls implements PingPongService {
  PingPongServiceProxyImpl _proxyImpl;

  _PingPongServiceProxyCalls(this._proxyImpl);
    void setClient(Object client) {
      assert(_proxyImpl.isBound);
      var params = new PingPongServiceSetClientParams();
      params.client = client;
      _proxyImpl.sendMessage(params, kPingPongService_setClient_name);
    }
  
    void ping(int pingValue) {
      assert(_proxyImpl.isBound);
      var params = new PingPongServicePingParams();
      params.pingValue = pingValue;
      _proxyImpl.sendMessage(params, kPingPongService_ping_name);
    }
  
    Future<PingPongServicePingTargetUrlResponseParams> pingTargetUrl(String url,int count,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new PingPongServicePingTargetUrlParams();
      params.url = url;
      params.count = count;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kPingPongService_pingTargetUrl_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<PingPongServicePingTargetServiceResponseParams> pingTargetService(Object service,int count,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new PingPongServicePingTargetServiceParams();
      params.service = service;
      params.count = count;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kPingPongService_pingTargetService_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void getPingPongService(Object service) {
      assert(_proxyImpl.isBound);
      var params = new PingPongServiceGetPingPongServiceParams();
      params.service = service;
      _proxyImpl.sendMessage(params, kPingPongService_getPingPongService_name);
    }
  
    void quit() {
      assert(_proxyImpl.isBound);
      var params = new PingPongServiceQuitParams();
      _proxyImpl.sendMessage(params, kPingPongService_quit_name);
    }
  
}


class PingPongServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  PingPongService ptr;
  final String name = PingPongServiceName;

  PingPongServiceProxy(PingPongServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _PingPongServiceProxyCalls(proxyImpl);

  PingPongServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new PingPongServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _PingPongServiceProxyCalls(impl);
  }

  PingPongServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new PingPongServiceProxyImpl.fromHandle(handle) {
    ptr = new _PingPongServiceProxyCalls(impl);
  }

  PingPongServiceProxy.unbound() :
      impl = new PingPongServiceProxyImpl.unbound() {
    ptr = new _PingPongServiceProxyCalls(impl);
  }

  static PingPongServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new PingPongServiceProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "PingPongServiceProxy($impl)";
  }
}


class PingPongServiceStub extends bindings.Stub {
  PingPongService _impl = null;

  PingPongServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  PingPongServiceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  PingPongServiceStub.unbound() : super.unbound();

  static PingPongServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new PingPongServiceStub.fromEndpoint(endpoint);

  static const String name = PingPongServiceName;


  PingPongServicePingTargetUrlResponseParams _PingPongServicePingTargetUrlResponseParamsFactory(bool ok) {
    var result = new PingPongServicePingTargetUrlResponseParams();
    result.ok = ok;
    return result;
  }
  PingPongServicePingTargetServiceResponseParams _PingPongServicePingTargetServiceResponseParamsFactory(bool ok) {
    var result = new PingPongServicePingTargetServiceResponseParams();
    result.ok = ok;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kPingPongService_setClient_name:
        var params = PingPongServiceSetClientParams.deserialize(
            message.payload);
        _impl.setClient(params.client);
        break;
      case kPingPongService_ping_name:
        var params = PingPongServicePingParams.deserialize(
            message.payload);
        _impl.ping(params.pingValue);
        break;
      case kPingPongService_pingTargetUrl_name:
        var params = PingPongServicePingTargetUrlParams.deserialize(
            message.payload);
        return _impl.pingTargetUrl(params.url,params.count,_PingPongServicePingTargetUrlResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kPingPongService_pingTargetUrl_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kPingPongService_pingTargetService_name:
        var params = PingPongServicePingTargetServiceParams.deserialize(
            message.payload);
        return _impl.pingTargetService(params.service,params.count,_PingPongServicePingTargetServiceResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kPingPongService_pingTargetService_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kPingPongService_getPingPongService_name:
        var params = PingPongServiceGetPingPongServiceParams.deserialize(
            message.payload);
        _impl.getPingPongService(params.service);
        break;
      case kPingPongService_quit_name:
        var params = PingPongServiceQuitParams.deserialize(
            message.payload);
        _impl.quit();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  PingPongService get impl => _impl;
      set impl(PingPongService d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "PingPongServiceStub($superString)";
  }
}

const int kPingPongClient_pong_name = 0;

const String PingPongClientName =
      'dart::PingPongClient';

abstract class PingPongClient {
  void pong(int pongValue);

}


class PingPongClientProxyImpl extends bindings.Proxy {
  PingPongClientProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  PingPongClientProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  PingPongClientProxyImpl.unbound() : super.unbound();

  static PingPongClientProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new PingPongClientProxyImpl.fromEndpoint(endpoint);

  String get name => PingPongClientName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "PingPongClientProxyImpl($superString)";
  }
}


class _PingPongClientProxyCalls implements PingPongClient {
  PingPongClientProxyImpl _proxyImpl;

  _PingPongClientProxyCalls(this._proxyImpl);
    void pong(int pongValue) {
      assert(_proxyImpl.isBound);
      var params = new PingPongClientPongParams();
      params.pongValue = pongValue;
      _proxyImpl.sendMessage(params, kPingPongClient_pong_name);
    }
  
}


class PingPongClientProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  PingPongClient ptr;
  final String name = PingPongClientName;

  PingPongClientProxy(PingPongClientProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _PingPongClientProxyCalls(proxyImpl);

  PingPongClientProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new PingPongClientProxyImpl.fromEndpoint(endpoint) {
    ptr = new _PingPongClientProxyCalls(impl);
  }

  PingPongClientProxy.fromHandle(core.MojoHandle handle) :
      impl = new PingPongClientProxyImpl.fromHandle(handle) {
    ptr = new _PingPongClientProxyCalls(impl);
  }

  PingPongClientProxy.unbound() :
      impl = new PingPongClientProxyImpl.unbound() {
    ptr = new _PingPongClientProxyCalls(impl);
  }

  static PingPongClientProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new PingPongClientProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "PingPongClientProxy($impl)";
  }
}


class PingPongClientStub extends bindings.Stub {
  PingPongClient _impl = null;

  PingPongClientStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  PingPongClientStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  PingPongClientStub.unbound() : super.unbound();

  static PingPongClientStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new PingPongClientStub.fromEndpoint(endpoint);

  static const String name = PingPongClientName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kPingPongClient_pong_name:
        var params = PingPongClientPongParams.deserialize(
            message.payload);
        _impl.pong(params.pongValue);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  PingPongClient get impl => _impl;
      set impl(PingPongClient d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "PingPongClientStub($superString)";
  }
}


PK     8[tF'@x+  +  9   mojo/public/interfaces/application/application.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library application.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;
import 'package:mojo/public/interfaces/application/service_provider.mojom.dart' as service_provider_mojom;
import 'package:mojo/public/interfaces/application/shell.mojom.dart' as shell_mojom;


class ApplicationInitializeParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  Object shell = null;
  List<String> args = null;
  String url = null;

  ApplicationInitializeParams() : super(kStructSize);

  static ApplicationInitializeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ApplicationInitializeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ApplicationInitializeParams result = new ApplicationInitializeParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.shell = decoder0.decodeServiceInterface(8, false, shell_mojom.ShellProxy.newFromEndpoint);
    }
    {
      
      var decoder1 = decoder0.decodePointer(16, true);
      if (decoder1 == null) {
        result.args = null;
      } else {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.args = new List<String>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          result.args[i1] = decoder1.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    {
      
      result.url = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(shell, 8, false);
    
    if (args == null) {
      encoder0.encodeNullPointer(16, true);
    } else {
      var encoder1 = encoder0.encodePointerArray(args.length, 16, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < args.length; ++i0) {
        
        encoder1.encodeString(args[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
    
    encoder0.encodeString(url, 24, false);
  }

  String toString() {
    return "ApplicationInitializeParams("
           "shell: $shell" ", "
           "args: $args" ", "
           "url: $url" ")";
  }
}

class ApplicationAcceptConnectionParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  String requestorUrl = null;
  Object services = null;
  Object exposedServices = null;
  String resolvedUrl = null;

  ApplicationAcceptConnectionParams() : super(kStructSize);

  static ApplicationAcceptConnectionParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ApplicationAcceptConnectionParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ApplicationAcceptConnectionParams result = new ApplicationAcceptConnectionParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.requestorUrl = decoder0.decodeString(8, false);
    }
    {
      
      result.services = decoder0.decodeInterfaceRequest(16, true, service_provider_mojom.ServiceProviderStub.newFromEndpoint);
    }
    {
      
      result.exposedServices = decoder0.decodeServiceInterface(20, true, service_provider_mojom.ServiceProviderProxy.newFromEndpoint);
    }
    {
      
      result.resolvedUrl = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(requestorUrl, 8, false);
    
    encoder0.encodeInterfaceRequest(services, 16, true);
    
    encoder0.encodeInterface(exposedServices, 20, true);
    
    encoder0.encodeString(resolvedUrl, 24, false);
  }

  String toString() {
    return "ApplicationAcceptConnectionParams("
           "requestorUrl: $requestorUrl" ", "
           "services: $services" ", "
           "exposedServices: $exposedServices" ", "
           "resolvedUrl: $resolvedUrl" ")";
  }
}

class ApplicationRequestQuitParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  ApplicationRequestQuitParams() : super(kStructSize);

  static ApplicationRequestQuitParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ApplicationRequestQuitParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ApplicationRequestQuitParams result = new ApplicationRequestQuitParams();

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
    return "ApplicationRequestQuitParams("")";
  }
}
const int kApplication_initialize_name = 0;
const int kApplication_acceptConnection_name = 1;
const int kApplication_requestQuit_name = 2;

const String ApplicationName =
      'mojo::Application';

abstract class Application {
  void initialize(Object shell, List<String> args, String url);
  void acceptConnection(String requestorUrl, Object services, Object exposedServices, String resolvedUrl);
  void requestQuit();

}


class ApplicationProxyImpl extends bindings.Proxy {
  ApplicationProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ApplicationProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ApplicationProxyImpl.unbound() : super.unbound();

  static ApplicationProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ApplicationProxyImpl.fromEndpoint(endpoint);

  String get name => ApplicationName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "ApplicationProxyImpl($superString)";
  }
}


class _ApplicationProxyCalls implements Application {
  ApplicationProxyImpl _proxyImpl;

  _ApplicationProxyCalls(this._proxyImpl);
    void initialize(Object shell, List<String> args, String url) {
      assert(_proxyImpl.isBound);
      var params = new ApplicationInitializeParams();
      params.shell = shell;
      params.args = args;
      params.url = url;
      _proxyImpl.sendMessage(params, kApplication_initialize_name);
    }
  
    void acceptConnection(String requestorUrl, Object services, Object exposedServices, String resolvedUrl) {
      assert(_proxyImpl.isBound);
      var params = new ApplicationAcceptConnectionParams();
      params.requestorUrl = requestorUrl;
      params.services = services;
      params.exposedServices = exposedServices;
      params.resolvedUrl = resolvedUrl;
      _proxyImpl.sendMessage(params, kApplication_acceptConnection_name);
    }
  
    void requestQuit() {
      assert(_proxyImpl.isBound);
      var params = new ApplicationRequestQuitParams();
      _proxyImpl.sendMessage(params, kApplication_requestQuit_name);
    }
  
}


class ApplicationProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Application ptr;
  final String name = ApplicationName;

  ApplicationProxy(ApplicationProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ApplicationProxyCalls(proxyImpl);

  ApplicationProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ApplicationProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ApplicationProxyCalls(impl);
  }

  ApplicationProxy.fromHandle(core.MojoHandle handle) :
      impl = new ApplicationProxyImpl.fromHandle(handle) {
    ptr = new _ApplicationProxyCalls(impl);
  }

  ApplicationProxy.unbound() :
      impl = new ApplicationProxyImpl.unbound() {
    ptr = new _ApplicationProxyCalls(impl);
  }

  static ApplicationProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ApplicationProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "ApplicationProxy($impl)";
  }
}


class ApplicationStub extends bindings.Stub {
  Application _impl = null;

  ApplicationStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ApplicationStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ApplicationStub.unbound() : super.unbound();

  static ApplicationStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ApplicationStub.fromEndpoint(endpoint);

  static const String name = ApplicationName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kApplication_initialize_name:
        var params = ApplicationInitializeParams.deserialize(
            message.payload);
        _impl.initialize(params.shell, params.args, params.url);
        break;
      case kApplication_acceptConnection_name:
        var params = ApplicationAcceptConnectionParams.deserialize(
            message.payload);
        _impl.acceptConnection(params.requestorUrl, params.services, params.exposedServices, params.resolvedUrl);
        break;
      case kApplication_requestQuit_name:
        var params = ApplicationRequestQuitParams.deserialize(
            message.payload);
        _impl.requestQuit();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Application get impl => _impl;
      set impl(Application d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ApplicationStub($superString)";
  }
}


PK     8[tFj��  �  >   mojo/public/interfaces/application/service_provider.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library service_provider.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;


class ServiceProviderConnectToServiceParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  String interfaceName = null;
  core.MojoMessagePipeEndpoint pipe = null;

  ServiceProviderConnectToServiceParams() : super(kStructSize);

  static ServiceProviderConnectToServiceParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ServiceProviderConnectToServiceParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ServiceProviderConnectToServiceParams result = new ServiceProviderConnectToServiceParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.interfaceName = decoder0.decodeString(8, false);
    }
    {
      
      result.pipe = decoder0.decodeMessagePipeHandle(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(interfaceName, 8, false);
    
    encoder0.encodeMessagePipeHandle(pipe, 16, false);
  }

  String toString() {
    return "ServiceProviderConnectToServiceParams("
           "interfaceName: $interfaceName" ", "
           "pipe: $pipe" ")";
  }
}
const int kServiceProvider_connectToService_name = 0;

const String ServiceProviderName =
      'mojo::ServiceProvider';

abstract class ServiceProvider {
  void connectToService(String interfaceName, core.MojoMessagePipeEndpoint pipe);

}


class ServiceProviderProxyImpl extends bindings.Proxy {
  ServiceProviderProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ServiceProviderProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ServiceProviderProxyImpl.unbound() : super.unbound();

  static ServiceProviderProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ServiceProviderProxyImpl.fromEndpoint(endpoint);

  String get name => ServiceProviderName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "ServiceProviderProxyImpl($superString)";
  }
}


class _ServiceProviderProxyCalls implements ServiceProvider {
  ServiceProviderProxyImpl _proxyImpl;

  _ServiceProviderProxyCalls(this._proxyImpl);
    void connectToService(String interfaceName, core.MojoMessagePipeEndpoint pipe) {
      assert(_proxyImpl.isBound);
      var params = new ServiceProviderConnectToServiceParams();
      params.interfaceName = interfaceName;
      params.pipe = pipe;
      _proxyImpl.sendMessage(params, kServiceProvider_connectToService_name);
    }
  
}


class ServiceProviderProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ServiceProvider ptr;
  final String name = ServiceProviderName;

  ServiceProviderProxy(ServiceProviderProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ServiceProviderProxyCalls(proxyImpl);

  ServiceProviderProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ServiceProviderProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ServiceProviderProxyCalls(impl);
  }

  ServiceProviderProxy.fromHandle(core.MojoHandle handle) :
      impl = new ServiceProviderProxyImpl.fromHandle(handle) {
    ptr = new _ServiceProviderProxyCalls(impl);
  }

  ServiceProviderProxy.unbound() :
      impl = new ServiceProviderProxyImpl.unbound() {
    ptr = new _ServiceProviderProxyCalls(impl);
  }

  static ServiceProviderProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ServiceProviderProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "ServiceProviderProxy($impl)";
  }
}


class ServiceProviderStub extends bindings.Stub {
  ServiceProvider _impl = null;

  ServiceProviderStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ServiceProviderStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ServiceProviderStub.unbound() : super.unbound();

  static ServiceProviderStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ServiceProviderStub.fromEndpoint(endpoint);

  static const String name = ServiceProviderName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kServiceProvider_connectToService_name:
        var params = ServiceProviderConnectToServiceParams.deserialize(
            message.payload);
        _impl.connectToService(params.interfaceName, params.pipe);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ServiceProvider get impl => _impl;
      set impl(ServiceProvider d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ServiceProviderStub($superString)";
  }
}


PK     8[tFI��    3   mojo/public/interfaces/application/shell.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library shell.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;
import 'package:mojo/public/interfaces/application/service_provider.mojom.dart' as service_provider_mojom;


class ShellConnectToApplicationParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  String applicationUrl = null;
  Object services = null;
  Object exposedServices = null;

  ShellConnectToApplicationParams() : super(kStructSize);

  static ShellConnectToApplicationParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ShellConnectToApplicationParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ShellConnectToApplicationParams result = new ShellConnectToApplicationParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.applicationUrl = decoder0.decodeString(8, false);
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
    
    encoder0.encodeString(applicationUrl, 8, false);
    
    encoder0.encodeInterfaceRequest(services, 16, true);
    
    encoder0.encodeInterface(exposedServices, 20, true);
  }

  String toString() {
    return "ShellConnectToApplicationParams("
           "applicationUrl: $applicationUrl" ", "
           "services: $services" ", "
           "exposedServices: $exposedServices" ")";
  }
}
const int kShell_connectToApplication_name = 0;

const String ShellName =
      'mojo::Shell';

abstract class Shell {
  void connectToApplication(String applicationUrl, Object services, Object exposedServices);

}


class ShellProxyImpl extends bindings.Proxy {
  ShellProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ShellProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ShellProxyImpl.unbound() : super.unbound();

  static ShellProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ShellProxyImpl.fromEndpoint(endpoint);

  String get name => ShellName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "ShellProxyImpl($superString)";
  }
}


class _ShellProxyCalls implements Shell {
  ShellProxyImpl _proxyImpl;

  _ShellProxyCalls(this._proxyImpl);
    void connectToApplication(String applicationUrl, Object services, Object exposedServices) {
      assert(_proxyImpl.isBound);
      var params = new ShellConnectToApplicationParams();
      params.applicationUrl = applicationUrl;
      params.services = services;
      params.exposedServices = exposedServices;
      _proxyImpl.sendMessage(params, kShell_connectToApplication_name);
    }
  
}


class ShellProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Shell ptr;
  final String name = ShellName;

  ShellProxy(ShellProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ShellProxyCalls(proxyImpl);

  ShellProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ShellProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ShellProxyCalls(impl);
  }

  ShellProxy.fromHandle(core.MojoHandle handle) :
      impl = new ShellProxyImpl.fromHandle(handle) {
    ptr = new _ShellProxyCalls(impl);
  }

  ShellProxy.unbound() :
      impl = new ShellProxyImpl.unbound() {
    ptr = new _ShellProxyCalls(impl);
  }

  static ShellProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ShellProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "ShellProxy($impl)";
  }
}


class ShellStub extends bindings.Stub {
  Shell _impl = null;

  ShellStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ShellStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ShellStub.unbound() : super.unbound();

  static ShellStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ShellStub.fromEndpoint(endpoint);

  static const String name = ShellName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kShell_connectToApplication_name:
        var params = ShellConnectToApplicationParams.deserialize(
            message.payload);
        _impl.connectToApplication(params.applicationUrl, params.services, params.exposedServices);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Shell get impl => _impl;
      set impl(Shell d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ShellStub($superString)";
  }
}


PK     TlF:ĕI}  }  	           ��    main.dartPK     8[tF�`L��a  �a  .           ��  services/dart/test/pingpong_service.mojom.dartPK     8[tF'@x+  +  9           �j  mojo/public/interfaces/application/application.mojom.dartPK     8[tFj��  �  >           ���  mojo/public/interfaces/application/service_provider.mojom.dartPK     8[tFI��    3           �/�  mojo/public/interfaces/application/shell.mojom.dartPK      �  ��    