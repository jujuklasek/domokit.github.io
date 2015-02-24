#!mojo mojo:dart_content_handler
PK     KWTF�|譼  �  	   main.dart// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:mojo_application';
import 'dart:mojo_bindings';
import 'dart:mojo_core';

import 'package:services/dart/test/pingpong_service.mojom.dart';

class PingPongClientImpl extends PingPongClient {
  Completer _completer;
  int _count;

  PingPongClientImpl.unbound(this._count, this._completer) : super.unbound() {
    super.delegate = this;
  }

  void pong(int pongValue) {
    if (pongValue == _count) {
      _completer.complete(null);
      close();
    }
  }
}

class PingPongServiceImpl extends PingPongService {
  Application _application;
  PingPongClientProxy _proxy;

  PingPongServiceImpl(Application application, MojoMessagePipeEndpoint endpoint)
      : _application = application, super(endpoint) {
    super.delegate = this;
  }

  PingPongServiceImpl.fromStub(PingPongServiceStub stub)
      : super.fromStub(stub) {
    super.delegate = this;
  }

  void setClient(PingPongClientProxy proxy) {
    assert(_proxy == null);
    _proxy = proxy;
  }

  void ping(int pingValue) {
    if (_proxy != null) {
      _proxy.pong(pingValue + 1);
    }
  }

  pingTargetUrl(String url, int count, Function responseFactory) async {
    if (_application == null) {
      return responseFactory(false);
    }
    var completer = new Completer();
    var pingPongService = new PingPongServiceProxy.unbound();
    _application.connectToService(url, pingPongService);

    var pingPongClient = new PingPongClientImpl.unbound(count, completer);
    pingPongService.setClient(pingPongClient.stub);
    pingPongClient.listen();

    for (var i = 0; i < count; i++) {
      pingPongService.ping(i);
    }
    await completer.future;
    pingPongService.quit();

    return responseFactory(true);
  }

  pingTargetService(PingPongServiceProxy pingPongService,
                    int count,
                    Function responseFactory) async {
    var completer = new Completer();
    var client = new PingPongClientImpl.unbound(count, completer);
    pingPongService.setClient(client.stub);
    client.listen();

    for (var i = 0; i < count; i++) {
      pingPongService.ping(i);
    }
    await completer.future;
    pingPongService.quit();

    return responseFactory(true);
  }

  getPingPongService(PingPongServiceStub serviceStub) {
    var pingPongService = new PingPongServiceImpl.fromStub(serviceStub);
    pingPongService.listen();
  }

  void quit() {
    if (_proxy != null) {
      _proxy.close();
    }
    super.close();
    if (_application != null) {
      _application.close();
    }
  }
}

class PingPongApplication extends Application {
  PingPongApplication.fromHandle(MojoHandle handle) : super.fromHandle(handle);

  void acceptConnection(String requestorUrl, ApplicationConnection connection) {
    connection.provideService(PingPongService.name,
        (endpoint) => new PingPongServiceImpl(this, endpoint));
    connection.listen();
  }
}

main(List args) {
  MojoHandle appHandle = new MojoHandle(args[0]);
  String url = args[1];
  var pingPongApplication = new PingPongApplication.fromHandle(appHandle);
  pingPongApplication.listen();
}
PK     �uXFr/�.aS  aS  .   services/dart/test/pingpong_service.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library pingpong_service.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;


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
  static const String name = 'dart::PingPongService';
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
  static const String name = 'dart::PingPongClient';
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




PK     �uXF����#  �#  9   mojo/public/interfaces/application/application.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library application.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;
import 'package:mojo/public/interfaces/application/service_provider.mojom.dart' as service_provider_mojom;
import 'package:mojo/public/interfaces/application/shell.mojom.dart' as shell_mojom;


class ApplicationInitializeParams extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
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
        (mainDataHeader.version < 3)) {
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
}

class ApplicationAcceptConnectionParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
  String requestorUrl = null;
  Object services = null;
  Object exposedServices = null;

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
        (mainDataHeader.version < 3)) {
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
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(requestorUrl, 8, false);
    
    encoder0.encodeInterfaceRequest(services, 16, true);
    
    encoder0.encodeInterface(exposedServices, 20, true);
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
}
const int kApplication_initialize_name = 0;
const int kApplication_acceptConnection_name = 1;
const int kApplication_requestQuit_name = 2;

abstract class Application implements core.Listener {
  static const String name = 'mojo::Application';
  ApplicationStub stub;

  Application(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ApplicationStub(endpoint);

  Application.fromHandle(core.MojoHandle handle) :
      stub = new ApplicationStub.fromHandle(handle);

  Application.fromStub(this.stub);

  Application.unbound() :
      stub = new ApplicationStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  Application get delegate => stub.delegate;
  set delegate(Application d) {
    stub.delegate = d;
  }
  void initialize(Object shell, List<String> args, String url);
  void acceptConnection(String requestorUrl, Object services, Object exposedServices);
  void requestQuit();

}

class ApplicationProxy extends bindings.Proxy implements Application {
  ApplicationProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ApplicationProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ApplicationProxy.unbound() : super.unbound();

  String get name => Application.name;

  static ApplicationProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ApplicationProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void initialize(Object shell, List<String> args, String url) {
    var params = new ApplicationInitializeParams();
    params.shell = shell;
    params.args = args;
    params.url = url;
    sendMessage(params, kApplication_initialize_name);
  }

  void acceptConnection(String requestorUrl, Object services, Object exposedServices) {
    var params = new ApplicationAcceptConnectionParams();
    params.requestorUrl = requestorUrl;
    params.services = services;
    params.exposedServices = exposedServices;
    sendMessage(params, kApplication_acceptConnection_name);
  }

  void requestQuit() {
    var params = new ApplicationRequestQuitParams();
    sendMessage(params, kApplication_requestQuit_name);
  }

}

class ApplicationStub extends bindings.Stub {
  Application _delegate = null;

  ApplicationStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ApplicationStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ApplicationStub.unbound() : super.unbound();

  static ApplicationStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ApplicationStub(endpoint);

  static const String name = Application.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kApplication_initialize_name:
        var params = ApplicationInitializeParams.deserialize(
            message.payload);
        _delegate.initialize(params.shell, params.args, params.url);
        break;
      case kApplication_acceptConnection_name:
        var params = ApplicationAcceptConnectionParams.deserialize(
            message.payload);
        _delegate.acceptConnection(params.requestorUrl, params.services, params.exposedServices);
        break;
      case kApplication_requestQuit_name:
        var params = ApplicationRequestQuitParams.deserialize(
            message.payload);
        _delegate.requestQuit();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Application get delegate => _delegate;
      set delegate(Application d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




PK     �uXF���;  ;  >   mojo/public/interfaces/application/service_provider.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library service_provider.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;


class ServiceProviderConnectToServiceParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
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
        (mainDataHeader.version < 2)) {
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
}
const int kServiceProvider_connectToService_name = 0;

abstract class ServiceProvider implements core.Listener {
  static const String name = 'mojo::ServiceProvider';
  ServiceProviderStub stub;

  ServiceProvider(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ServiceProviderStub(endpoint);

  ServiceProvider.fromHandle(core.MojoHandle handle) :
      stub = new ServiceProviderStub.fromHandle(handle);

  ServiceProvider.fromStub(this.stub);

  ServiceProvider.unbound() :
      stub = new ServiceProviderStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  ServiceProvider get delegate => stub.delegate;
  set delegate(ServiceProvider d) {
    stub.delegate = d;
  }
  void connectToService(String interfaceName, core.MojoMessagePipeEndpoint pipe);

}

class ServiceProviderProxy extends bindings.Proxy implements ServiceProvider {
  ServiceProviderProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ServiceProviderProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ServiceProviderProxy.unbound() : super.unbound();

  String get name => ServiceProvider.name;

  static ServiceProviderProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ServiceProviderProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void connectToService(String interfaceName, core.MojoMessagePipeEndpoint pipe) {
    var params = new ServiceProviderConnectToServiceParams();
    params.interfaceName = interfaceName;
    params.pipe = pipe;
    sendMessage(params, kServiceProvider_connectToService_name);
  }

}

class ServiceProviderStub extends bindings.Stub {
  ServiceProvider _delegate = null;

  ServiceProviderStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ServiceProviderStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ServiceProviderStub.unbound() : super.unbound();

  static ServiceProviderStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ServiceProviderStub(endpoint);

  static const String name = ServiceProvider.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kServiceProvider_connectToService_name:
        var params = ServiceProviderConnectToServiceParams.deserialize(
            message.payload);
        _delegate.connectToService(params.interfaceName, params.pipe);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  ServiceProvider get delegate => _delegate;
      set delegate(ServiceProvider d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




PK     �uXFO|��  �  3   mojo/public/interfaces/application/shell.mojom.dart// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library shell.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;
import 'package:mojo/public/interfaces/application/service_provider.mojom.dart' as service_provider_mojom;


class ShellConnectToApplicationParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 3);
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
        (mainDataHeader.version < 3)) {
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
}
const int kShell_connectToApplication_name = 0;

abstract class Shell implements core.Listener {
  static const String name = 'mojo::Shell';
  ShellStub stub;

  Shell(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ShellStub(endpoint);

  Shell.fromHandle(core.MojoHandle handle) :
      stub = new ShellStub.fromHandle(handle);

  Shell.fromStub(this.stub);

  Shell.unbound() :
      stub = new ShellStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  Shell get delegate => stub.delegate;
  set delegate(Shell d) {
    stub.delegate = d;
  }
  void connectToApplication(String applicationUrl, Object services, Object exposedServices);

}

class ShellProxy extends bindings.Proxy implements Shell {
  ShellProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ShellProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ShellProxy.unbound() : super.unbound();

  String get name => Shell.name;

  static ShellProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ShellProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void connectToApplication(String applicationUrl, Object services, Object exposedServices) {
    var params = new ShellConnectToApplicationParams();
    params.applicationUrl = applicationUrl;
    params.services = services;
    params.exposedServices = exposedServices;
    sendMessage(params, kShell_connectToApplication_name);
  }

}

class ShellStub extends bindings.Stub {
  Shell _delegate = null;

  ShellStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ShellStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ShellStub.unbound() : super.unbound();

  static ShellStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ShellStub(endpoint);

  static const String name = Shell.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kShell_connectToApplication_name:
        var params = ShellConnectToApplicationParams.deserialize(
            message.payload);
        _delegate.connectToApplication(params.applicationUrl, params.services, params.exposedServices);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  Shell get delegate => _delegate;
      set delegate(Shell d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




PK     KWTF�|譼  �  	           ��    main.dartPK     �uXFr/�.aS  aS  .           ��  services/dart/test/pingpong_service.mojom.dartPK     �uXF����#  �#  9           ��`  mojo/public/interfaces/application/application.mojom.dartPK     �uXF���;  ;  >           �ׄ  mojo/public/interfaces/application/service_provider.mojom.dartPK     �uXFO|��  �  3           �n�  mojo/public/interfaces/application/shell.mojom.dartPK      �  ��    