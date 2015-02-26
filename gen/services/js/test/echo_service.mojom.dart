// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library echo_service.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


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
}
const int kEchoService_echoString_name = 0;
const int kEchoService_shareEchoService_name = 1;
const int kEchoService_quit_name = 2;

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

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  EchoService get delegate => stub.delegate;
  set delegate(EchoService d) {
    stub.delegate = d;
  }
  Future<EchoServiceEchoStringResponseParams> echoString(String value,[Function responseFactory = null]);
  Future<EchoServiceShareEchoServiceResponseParams> shareEchoService([Function responseFactory = null]);
  void quit();

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
  Future<EchoServiceEchoStringResponseParams> echoString(String value,[Function responseFactory = null]) {
    var params = new EchoServiceEchoStringParams();
    params.value = value;
    return sendMessageWithRequestId(
        params,
        kEchoService_echoString_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<EchoServiceShareEchoServiceResponseParams> shareEchoService([Function responseFactory = null]) {
    var params = new EchoServiceShareEchoServiceParams();
    return sendMessageWithRequestId(
        params,
        kEchoService_shareEchoService_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  void quit() {
    var params = new EchoServiceQuitParams();
    sendMessage(params, kEchoService_quit_name);
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
  EchoServiceShareEchoServiceResponseParams _EchoServiceShareEchoServiceResponseParamsFactory(bool ok) {
    var result = new EchoServiceShareEchoServiceResponseParams();
    result.ok = ok;
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
      case kEchoService_shareEchoService_name:
        var params = EchoServiceShareEchoServiceParams.deserialize(
            message.payload);
        return _delegate.shareEchoService(_EchoServiceShareEchoServiceResponseParamsFactory).then((response) {
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
        _delegate.quit();
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


