// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library echo.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;


class EchoEchoStringParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String value = null;

  EchoEchoStringParams() : super(kStructSize);

  static EchoEchoStringParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EchoEchoStringParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoEchoStringParams result = new EchoEchoStringParams();

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

class EchoEchoStringResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String value = null;

  EchoEchoStringResponseParams() : super(kStructSize);

  static EchoEchoStringResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EchoEchoStringResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EchoEchoStringResponseParams result = new EchoEchoStringResponseParams();

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
const int kEcho_echoString_name = 0;

abstract class Echo implements core.Listener {
  static const String name = 'mojo::examples::Echo';
  EchoStub stub;

  Echo(core.MojoMessagePipeEndpoint endpoint) :
      stub = new EchoStub(endpoint);

  Echo.fromHandle(core.MojoHandle handle) :
      stub = new EchoStub.fromHandle(handle);

  Echo.fromStub(this.stub);

  Echo.unbound() :
      stub = new EchoStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  Echo get delegate => stub.delegate;
  set delegate(Echo d) {
    stub.delegate = d;
  }
  Future<EchoEchoStringResponseParams> echoString(String value,[Function responseFactory = null]);

}

class EchoProxy extends bindings.Proxy implements Echo {
  EchoProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  EchoProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EchoProxy.unbound() : super.unbound();

  String get name => Echo.name;

  static EchoProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EchoProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kEcho_echoString_name:
        var r = EchoEchoStringResponseParams.deserialize(
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
  Future<EchoEchoStringResponseParams> echoString(String value,[Function responseFactory = null]) {
    var params = new EchoEchoStringParams();
    params.value = value;
    return sendMessageWithRequestId(
        params,
        kEcho_echoString_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class EchoStub extends bindings.Stub {
  Echo _delegate = null;

  EchoStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  EchoStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EchoStub.unbound() : super.unbound();

  static EchoStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EchoStub(endpoint);

  static const String name = Echo.name;


  EchoEchoStringResponseParams _EchoEchoStringResponseParamsFactory(String value) {
    var result = new EchoEchoStringResponseParams();
    result.value = value;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kEcho_echoString_name:
        var params = EchoEchoStringParams.deserialize(
            message.payload);
        return _delegate.echoString(params.value,_EchoEchoStringResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kEcho_echoString_name,
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

  Echo get delegate => _delegate;
      set delegate(Echo d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




