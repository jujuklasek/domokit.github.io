// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library example_service.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;


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

abstract class ExampleService implements core.Listener {
  static const String name = 'mojo::ExampleService';
  ExampleServiceStub stub;

  ExampleService(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ExampleServiceStub(endpoint);

  ExampleService.fromHandle(core.MojoHandle handle) :
      stub = new ExampleServiceStub.fromHandle(handle);

  ExampleService.fromStub(this.stub);

  ExampleService.unbound() :
      stub = new ExampleServiceStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  ExampleService get delegate => stub.delegate;
  set delegate(ExampleService d) {
    stub.delegate = d;
  }
  Future<ExampleServicePingResponseParams> ping(int pingValue,[Function responseFactory = null]);

}

class ExampleServiceProxy extends bindings.Proxy implements ExampleService {
  ExampleServiceProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ExampleServiceProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ExampleServiceProxy.unbound() : super.unbound();

  String get name => ExampleService.name;

  static ExampleServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ExampleServiceProxy(endpoint);

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
  Future<ExampleServicePingResponseParams> ping(int pingValue,[Function responseFactory = null]) {
    var params = new ExampleServicePingParams();
    params.pingValue = pingValue;
    return sendMessageWithRequestId(
        params,
        kExampleService_ping_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class ExampleServiceStub extends bindings.Stub {
  ExampleService _delegate = null;

  ExampleServiceStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ExampleServiceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ExampleServiceStub.unbound() : super.unbound();

  static ExampleServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ExampleServiceStub(endpoint);

  static const String name = ExampleService.name;


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




