// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library echo_service.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;


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
}
const int kEchoService_echoString_name = 0;

abstract class EchoService implements core.Listener {
  static const String name = 'mojo::EchoService';
  EchoServiceStub stub;

  EchoService(core.MojoMessagePipeEndpoint endpoint) :
      stub = new EchoServiceStub(endpoint);

  EchoService.fromHandle(core.MojoHandle handle) :
      stub = new EchoServiceStub.fromHandle(handle);

  EchoService.fromStub(this.stub);

  EchoService.unbound() :
      stub = new EchoServiceStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  EchoService get delegate => stub.delegate;
  set delegate(EchoService d) {
    stub.delegate = d;
  }
  Future<EchoServiceEchoStringResponseParams> echoString(String value,[Function responseFactory = null]);

}

class EchoServiceProxy extends bindings.Proxy implements EchoService {
  EchoServiceProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  EchoServiceProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EchoServiceProxy.unbound() : super.unbound();

  String get name => EchoService.name;

  static EchoServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EchoServiceProxy(endpoint);

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
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  Future<EchoServiceEchoStringResponseParams> echoString(String value,[Function responseFactory = null]) {
    var params = new EchoServiceEchoStringParams();
    params.value = value;
    return sendMessageWithRequestId(
        params,
        kEchoService_echoString_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class EchoServiceStub extends bindings.Stub {
  EchoService _delegate = null;

  EchoServiceStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  EchoServiceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EchoServiceStub.unbound() : super.unbound();

  static EchoServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EchoServiceStub(endpoint);

  static const String name = EchoService.name;


  EchoServiceEchoStringResponseParams _EchoServiceEchoStringResponseParamsFactory(String value) {
    var result = new EchoServiceEchoStringResponseParams();
    result.value = value;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kEchoService_echoString_name:
        var params = EchoServiceEchoStringParams.deserialize(
            message.payload);
        return _delegate.echoString(params.value,_EchoServiceEchoStringResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kEchoService_echoString_name,
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

  EchoService get delegate => _delegate;
      set delegate(EchoService d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




