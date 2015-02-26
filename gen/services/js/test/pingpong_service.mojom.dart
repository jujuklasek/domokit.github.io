// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library pingpong_service.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class PingPongServiceSetClientParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class PingPongServicePingParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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

class PingPongServicePingTargetUrlParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}

class PingPongServicePingTargetUrlResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
}

class PingPongServicePingTargetServiceParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}

class PingPongServicePingTargetServiceResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
}

class PingPongServiceGetPingPongServiceParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
        (mainDataHeader.version < 1)) {
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
}

class PingPongClientPongParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
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
const int kPingPongService_setClient_name = 0;
const int kPingPongService_ping_name = 1;
const int kPingPongService_pingTargetUrl_name = 2;
const int kPingPongService_pingTargetService_name = 3;
const int kPingPongService_getPingPongService_name = 4;
const int kPingPongService_quit_name = 5;

abstract class PingPongService implements core.Listener {
  static const String name = 'js::PingPongService';
  PingPongServiceStub stub;

  PingPongService(core.MojoMessagePipeEndpoint endpoint) :
      stub = new PingPongServiceStub(endpoint);

  PingPongService.fromHandle(core.MojoHandle handle) :
      stub = new PingPongServiceStub.fromHandle(handle);

  PingPongService.fromStub(this.stub);

  PingPongService.unbound() :
      stub = new PingPongServiceStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  PingPongService get delegate => stub.delegate;
  set delegate(PingPongService d) {
    stub.delegate = d;
  }
  void setClient(Object client);
  void ping(int pingValue);
  Future<PingPongServicePingTargetUrlResponseParams> pingTargetUrl(String url,int count,[Function responseFactory = null]);
  Future<PingPongServicePingTargetServiceResponseParams> pingTargetService(Object service,int count,[Function responseFactory = null]);
  void getPingPongService(Object service);
  void quit();

}

class PingPongServiceProxy extends bindings.Proxy implements PingPongService {
  PingPongServiceProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  PingPongServiceProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  PingPongServiceProxy.unbound() : super.unbound();

  String get name => PingPongService.name;

  static PingPongServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new PingPongServiceProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kPingPongService_pingTargetUrl_name:
        var r = PingPongServicePingTargetUrlResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kPingPongService_pingTargetService_name:
        var r = PingPongServicePingTargetServiceResponseParams.deserialize(
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
  void setClient(Object client) {
    var params = new PingPongServiceSetClientParams();
    params.client = client;
    sendMessage(params, kPingPongService_setClient_name);
  }

  void ping(int pingValue) {
    var params = new PingPongServicePingParams();
    params.pingValue = pingValue;
    sendMessage(params, kPingPongService_ping_name);
  }

  Future<PingPongServicePingTargetUrlResponseParams> pingTargetUrl(String url,int count,[Function responseFactory = null]) {
    var params = new PingPongServicePingTargetUrlParams();
    params.url = url;
    params.count = count;
    return sendMessageWithRequestId(
        params,
        kPingPongService_pingTargetUrl_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<PingPongServicePingTargetServiceResponseParams> pingTargetService(Object service,int count,[Function responseFactory = null]) {
    var params = new PingPongServicePingTargetServiceParams();
    params.service = service;
    params.count = count;
    return sendMessageWithRequestId(
        params,
        kPingPongService_pingTargetService_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  void getPingPongService(Object service) {
    var params = new PingPongServiceGetPingPongServiceParams();
    params.service = service;
    sendMessage(params, kPingPongService_getPingPongService_name);
  }

  void quit() {
    var params = new PingPongServiceQuitParams();
    sendMessage(params, kPingPongService_quit_name);
  }

}

class PingPongServiceStub extends bindings.Stub {
  PingPongService _delegate = null;

  PingPongServiceStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  PingPongServiceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  PingPongServiceStub.unbound() : super.unbound();

  static PingPongServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new PingPongServiceStub(endpoint);

  static const String name = PingPongService.name;


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
    assert(_delegate != null);
    switch (message.header.type) {
      case kPingPongService_setClient_name:
        var params = PingPongServiceSetClientParams.deserialize(
            message.payload);
        _delegate.setClient(params.client);
        break;
      case kPingPongService_ping_name:
        var params = PingPongServicePingParams.deserialize(
            message.payload);
        _delegate.ping(params.pingValue);
        break;
      case kPingPongService_pingTargetUrl_name:
        var params = PingPongServicePingTargetUrlParams.deserialize(
            message.payload);
        return _delegate.pingTargetUrl(params.url,params.count,_PingPongServicePingTargetUrlResponseParamsFactory).then((response) {
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
        return _delegate.pingTargetService(params.service,params.count,_PingPongServicePingTargetServiceResponseParamsFactory).then((response) {
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
        _delegate.getPingPongService(params.service);
        break;
      case kPingPongService_quit_name:
        var params = PingPongServiceQuitParams.deserialize(
            message.payload);
        _delegate.quit();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  PingPongService get delegate => _delegate;
      set delegate(PingPongService d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kPingPongClient_pong_name = 0;

abstract class PingPongClient implements core.Listener {
  static const String name = 'js::PingPongClient';
  PingPongClientStub stub;

  PingPongClient(core.MojoMessagePipeEndpoint endpoint) :
      stub = new PingPongClientStub(endpoint);

  PingPongClient.fromHandle(core.MojoHandle handle) :
      stub = new PingPongClientStub.fromHandle(handle);

  PingPongClient.fromStub(this.stub);

  PingPongClient.unbound() :
      stub = new PingPongClientStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  PingPongClient get delegate => stub.delegate;
  set delegate(PingPongClient d) {
    stub.delegate = d;
  }
  void pong(int pongValue);

}

class PingPongClientProxy extends bindings.Proxy implements PingPongClient {
  PingPongClientProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  PingPongClientProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  PingPongClientProxy.unbound() : super.unbound();

  String get name => PingPongClient.name;

  static PingPongClientProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new PingPongClientProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void pong(int pongValue) {
    var params = new PingPongClientPongParams();
    params.pongValue = pongValue;
    sendMessage(params, kPingPongClient_pong_name);
  }

}

class PingPongClientStub extends bindings.Stub {
  PingPongClient _delegate = null;

  PingPongClientStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  PingPongClientStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  PingPongClientStub.unbound() : super.unbound();

  static PingPongClientStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new PingPongClientStub(endpoint);

  static const String name = PingPongClient.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kPingPongClient_pong_name:
        var params = PingPongClientPongParams.deserialize(
            message.payload);
        _delegate.pong(params.pongValue);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  PingPongClient get delegate => _delegate;
      set delegate(PingPongClient d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




