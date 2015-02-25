// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library sample_interfaces.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;
final kLong = 4405;

final int Enum_VALUE = 0;


class ProviderEchoStringParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String a = null;

  ProviderEchoStringParams() : super(kStructSize);

  static ProviderEchoStringParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ProviderEchoStringParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ProviderEchoStringParams result = new ProviderEchoStringParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.a = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(a, 8, false);
  }
}

class ProviderEchoStringResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String a = null;

  ProviderEchoStringResponseParams() : super(kStructSize);

  static ProviderEchoStringResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ProviderEchoStringResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ProviderEchoStringResponseParams result = new ProviderEchoStringResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.a = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(a, 8, false);
  }
}

class ProviderEchoStringsParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  String a = null;
  String b = null;

  ProviderEchoStringsParams() : super(kStructSize);

  static ProviderEchoStringsParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ProviderEchoStringsParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ProviderEchoStringsParams result = new ProviderEchoStringsParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.a = decoder0.decodeString(8, false);
    }
    {
      
      result.b = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(a, 8, false);
    
    encoder0.encodeString(b, 16, false);
  }
}

class ProviderEchoStringsResponseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  String a = null;
  String b = null;

  ProviderEchoStringsResponseParams() : super(kStructSize);

  static ProviderEchoStringsResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ProviderEchoStringsResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ProviderEchoStringsResponseParams result = new ProviderEchoStringsResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.a = decoder0.decodeString(8, false);
    }
    {
      
      result.b = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(a, 8, false);
    
    encoder0.encodeString(b, 16, false);
  }
}

class ProviderEchoMessagePipeHandleParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  core.MojoMessagePipeEndpoint a = null;

  ProviderEchoMessagePipeHandleParams() : super(kStructSize);

  static ProviderEchoMessagePipeHandleParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ProviderEchoMessagePipeHandleParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ProviderEchoMessagePipeHandleParams result = new ProviderEchoMessagePipeHandleParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.a = decoder0.decodeMessagePipeHandle(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeMessagePipeHandle(a, 8, false);
  }
}

class ProviderEchoMessagePipeHandleResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  core.MojoMessagePipeEndpoint a = null;

  ProviderEchoMessagePipeHandleResponseParams() : super(kStructSize);

  static ProviderEchoMessagePipeHandleResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ProviderEchoMessagePipeHandleResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ProviderEchoMessagePipeHandleResponseParams result = new ProviderEchoMessagePipeHandleResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.a = decoder0.decodeMessagePipeHandle(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeMessagePipeHandle(a, 8, false);
  }
}

class ProviderEchoEnumParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int a = 0;

  ProviderEchoEnumParams() : super(kStructSize);

  static ProviderEchoEnumParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ProviderEchoEnumParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ProviderEchoEnumParams result = new ProviderEchoEnumParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.a = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(a, 8);
  }
}

class ProviderEchoEnumResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int a = 0;

  ProviderEchoEnumResponseParams() : super(kStructSize);

  static ProviderEchoEnumResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ProviderEchoEnumResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ProviderEchoEnumResponseParams result = new ProviderEchoEnumResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.a = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(a, 8);
  }
}
const int kProvider_echoString_name = 0;
const int kProvider_echoStrings_name = 1;
const int kProvider_echoMessagePipeHandle_name = 2;
const int kProvider_echoEnum_name = 3;

abstract class Provider implements core.Listener {
  static const String name = 'sample::Provider';
  ProviderStub stub;

  Provider(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ProviderStub(endpoint);

  Provider.fromHandle(core.MojoHandle handle) :
      stub = new ProviderStub.fromHandle(handle);

  Provider.fromStub(this.stub);

  Provider.unbound() :
      stub = new ProviderStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  Provider get delegate => stub.delegate;
  set delegate(Provider d) {
    stub.delegate = d;
  }
  Future<ProviderEchoStringResponseParams> echoString(String a,[Function responseFactory = null]);
  Future<ProviderEchoStringsResponseParams> echoStrings(String a,String b,[Function responseFactory = null]);
  Future<ProviderEchoMessagePipeHandleResponseParams> echoMessagePipeHandle(core.MojoMessagePipeEndpoint a,[Function responseFactory = null]);
  Future<ProviderEchoEnumResponseParams> echoEnum(int a,[Function responseFactory = null]);

}

class ProviderProxy extends bindings.Proxy implements Provider {
  ProviderProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ProviderProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ProviderProxy.unbound() : super.unbound();

  String get name => Provider.name;

  static ProviderProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ProviderProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kProvider_echoString_name:
        var r = ProviderEchoStringResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kProvider_echoStrings_name:
        var r = ProviderEchoStringsResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kProvider_echoMessagePipeHandle_name:
        var r = ProviderEchoMessagePipeHandleResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kProvider_echoEnum_name:
        var r = ProviderEchoEnumResponseParams.deserialize(
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
  Future<ProviderEchoStringResponseParams> echoString(String a,[Function responseFactory = null]) {
    var params = new ProviderEchoStringParams();
    params.a = a;
    return sendMessageWithRequestId(
        params,
        kProvider_echoString_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ProviderEchoStringsResponseParams> echoStrings(String a,String b,[Function responseFactory = null]) {
    var params = new ProviderEchoStringsParams();
    params.a = a;
    params.b = b;
    return sendMessageWithRequestId(
        params,
        kProvider_echoStrings_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ProviderEchoMessagePipeHandleResponseParams> echoMessagePipeHandle(core.MojoMessagePipeEndpoint a,[Function responseFactory = null]) {
    var params = new ProviderEchoMessagePipeHandleParams();
    params.a = a;
    return sendMessageWithRequestId(
        params,
        kProvider_echoMessagePipeHandle_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<ProviderEchoEnumResponseParams> echoEnum(int a,[Function responseFactory = null]) {
    var params = new ProviderEchoEnumParams();
    params.a = a;
    return sendMessageWithRequestId(
        params,
        kProvider_echoEnum_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class ProviderStub extends bindings.Stub {
  Provider _delegate = null;

  ProviderStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ProviderStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ProviderStub.unbound() : super.unbound();

  static ProviderStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ProviderStub(endpoint);

  static const String name = Provider.name;


  ProviderEchoStringResponseParams _ProviderEchoStringResponseParamsFactory(String a) {
    var result = new ProviderEchoStringResponseParams();
    result.a = a;
    return result;
  }
  ProviderEchoStringsResponseParams _ProviderEchoStringsResponseParamsFactory(String a, String b) {
    var result = new ProviderEchoStringsResponseParams();
    result.a = a;
    result.b = b;
    return result;
  }
  ProviderEchoMessagePipeHandleResponseParams _ProviderEchoMessagePipeHandleResponseParamsFactory(core.MojoMessagePipeEndpoint a) {
    var result = new ProviderEchoMessagePipeHandleResponseParams();
    result.a = a;
    return result;
  }
  ProviderEchoEnumResponseParams _ProviderEchoEnumResponseParamsFactory(int a) {
    var result = new ProviderEchoEnumResponseParams();
    result.a = a;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kProvider_echoString_name:
        var params = ProviderEchoStringParams.deserialize(
            message.payload);
        return _delegate.echoString(params.a,_ProviderEchoStringResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kProvider_echoString_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kProvider_echoStrings_name:
        var params = ProviderEchoStringsParams.deserialize(
            message.payload);
        return _delegate.echoStrings(params.a,params.b,_ProviderEchoStringsResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kProvider_echoStrings_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kProvider_echoMessagePipeHandle_name:
        var params = ProviderEchoMessagePipeHandleParams.deserialize(
            message.payload);
        return _delegate.echoMessagePipeHandle(params.a,_ProviderEchoMessagePipeHandleResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kProvider_echoMessagePipeHandle_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kProvider_echoEnum_name:
        var params = ProviderEchoEnumParams.deserialize(
            message.payload);
        return _delegate.echoEnum(params.a,_ProviderEchoEnumResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kProvider_echoEnum_name,
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

  Provider get delegate => _delegate;
      set delegate(Provider d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



