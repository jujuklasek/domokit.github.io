// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library regression_tests.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;

final int EnumWithReference_k_STEREO_AND_KEYBOARD_MIC = 30;
final int EnumWithReference_k_MAX = EnumWithReference_k_STEREO_AND_KEYBOARD_MIC;

final int EnumWithLowercase_PlanarF16 = 0;
final int EnumWithLowercase_PlanarF32 = EnumWithLowercase_PlanarF16 + 1;

final int EnumWithNumbers_k_2_1 = 4;

final int EnumWithK_K = 0;


class Edge extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Vertex v = null;

  Edge() : super(kStructSize);

  static Edge deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static Edge decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Edge result = new Edge();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.v = Vertex.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(v, 8, true);
  }
}

class Vertex extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  EmptyStruct e = null;

  Vertex() : super(kStructSize);

  static Vertex deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static Vertex decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Vertex result = new Vertex();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.e = EmptyStruct.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(e, 8, true);
  }
}

class EmptyStruct extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  EmptyStruct() : super(kStructSize);

  static EmptyStruct deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EmptyStruct decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EmptyStruct result = new EmptyStruct();

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

class A extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  B b = null;

  A() : super(kStructSize);

  static A deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static A decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    A result = new A();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.b = B.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(b, 8, true);
  }
}

class B extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  A a = null;

  B() : super(kStructSize);

  static B deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static B decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    B result = new B();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, true);
      result.a = A.decode(decoder1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(a, 8, true);
  }
}

class CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseParams() : super(kStructSize);

  static CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseParams result = new CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseParams();

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

class CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseResponseParams() : super(kStructSize);

  static CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseResponseParams result = new CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseResponseParams();

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

class CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  bool b = false;

  CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams() : super(kStructSize);

  static CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams result = new CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.b = decoder0.decodeBool(8, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(b, 8, 0);
  }
}

class CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams() : super(kStructSize);

  static CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams result = new CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams();

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

class CheckNameCollisionWithNameCollisionParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  bool message = false;
  bool response = false;

  CheckNameCollisionWithNameCollisionParams() : super(kStructSize);

  static CheckNameCollisionWithNameCollisionParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CheckNameCollisionWithNameCollisionParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CheckNameCollisionWithNameCollisionParams result = new CheckNameCollisionWithNameCollisionParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.message = decoder0.decodeBool(8, 0);
    }
    {
      
      result.response = decoder0.decodeBool(8, 1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(message, 8, 0);
    
    encoder0.encodeBool(response, 8, 1);
  }
}

class CheckNameCollisionWithNameCollisionResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  bool message = false;
  bool response = false;

  CheckNameCollisionWithNameCollisionResponseParams() : super(kStructSize);

  static CheckNameCollisionWithNameCollisionResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static CheckNameCollisionWithNameCollisionResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    CheckNameCollisionWithNameCollisionResponseParams result = new CheckNameCollisionWithNameCollisionResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.message = decoder0.decodeBool(8, 0);
    }
    {
      
      result.response = decoder0.decodeBool(8, 1);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeBool(message, 8, 0);
    
    encoder0.encodeBool(response, 8, 1);
  }
}
const int kCheckMethodWithEmptyResponse_withouParameterAndEmptyResponse_name = 0;
const int kCheckMethodWithEmptyResponse_withParameterAndEmptyResponse_name = 1;

abstract class CheckMethodWithEmptyResponse implements core.Listener {
  static const String name = 'regression_tests::CheckMethodWithEmptyResponse';
  CheckMethodWithEmptyResponseStub stub;

  CheckMethodWithEmptyResponse(core.MojoMessagePipeEndpoint endpoint) :
      stub = new CheckMethodWithEmptyResponseStub(endpoint);

  CheckMethodWithEmptyResponse.fromHandle(core.MojoHandle handle) :
      stub = new CheckMethodWithEmptyResponseStub.fromHandle(handle);

  CheckMethodWithEmptyResponse.fromStub(this.stub);

  CheckMethodWithEmptyResponse.unbound() :
      stub = new CheckMethodWithEmptyResponseStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  CheckMethodWithEmptyResponse get delegate => stub.delegate;
  set delegate(CheckMethodWithEmptyResponse d) {
    stub.delegate = d;
  }
  Future<CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseResponseParams> withouParameterAndEmptyResponse([Function responseFactory = null]);
  Future<CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams> withParameterAndEmptyResponse(bool b,[Function responseFactory = null]);

}

class CheckMethodWithEmptyResponseProxy extends bindings.Proxy implements CheckMethodWithEmptyResponse {
  CheckMethodWithEmptyResponseProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CheckMethodWithEmptyResponseProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CheckMethodWithEmptyResponseProxy.unbound() : super.unbound();

  String get name => CheckMethodWithEmptyResponse.name;

  static CheckMethodWithEmptyResponseProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CheckMethodWithEmptyResponseProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kCheckMethodWithEmptyResponse_withouParameterAndEmptyResponse_name:
        var r = CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kCheckMethodWithEmptyResponse_withParameterAndEmptyResponse_name:
        var r = CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams.deserialize(
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
  Future<CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseResponseParams> withouParameterAndEmptyResponse([Function responseFactory = null]) {
    var params = new CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseParams();
    return sendMessageWithRequestId(
        params,
        kCheckMethodWithEmptyResponse_withouParameterAndEmptyResponse_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
  Future<CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams> withParameterAndEmptyResponse(bool b,[Function responseFactory = null]) {
    var params = new CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams();
    params.b = b;
    return sendMessageWithRequestId(
        params,
        kCheckMethodWithEmptyResponse_withParameterAndEmptyResponse_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class CheckMethodWithEmptyResponseStub extends bindings.Stub {
  CheckMethodWithEmptyResponse _delegate = null;

  CheckMethodWithEmptyResponseStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CheckMethodWithEmptyResponseStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CheckMethodWithEmptyResponseStub.unbound() : super.unbound();

  static CheckMethodWithEmptyResponseStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CheckMethodWithEmptyResponseStub(endpoint);

  static const String name = CheckMethodWithEmptyResponse.name;


  CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseResponseParams _CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseResponseParamsFactory() {
    var result = new CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseResponseParams();
    return result;
  }
  CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams _CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParamsFactory() {
    var result = new CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kCheckMethodWithEmptyResponse_withouParameterAndEmptyResponse_name:
        var params = CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseParams.deserialize(
            message.payload);
        return _delegate.withouParameterAndEmptyResponse(_CheckMethodWithEmptyResponseWithouParameterAndEmptyResponseResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kCheckMethodWithEmptyResponse_withouParameterAndEmptyResponse_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kCheckMethodWithEmptyResponse_withParameterAndEmptyResponse_name:
        var params = CheckMethodWithEmptyResponseWithParameterAndEmptyResponseParams.deserialize(
            message.payload);
        return _delegate.withParameterAndEmptyResponse(params.b,_CheckMethodWithEmptyResponseWithParameterAndEmptyResponseResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kCheckMethodWithEmptyResponse_withParameterAndEmptyResponse_name,
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

  CheckMethodWithEmptyResponse get delegate => _delegate;
      set delegate(CheckMethodWithEmptyResponse d) {
    assert(_delegate == null);
    _delegate = d;
  }
}



const int kCheckNameCollision_withNameCollision_name = 0;

abstract class CheckNameCollision implements core.Listener {
  static const String name = 'regression_tests::CheckNameCollision';
  CheckNameCollisionStub stub;

  CheckNameCollision(core.MojoMessagePipeEndpoint endpoint) :
      stub = new CheckNameCollisionStub(endpoint);

  CheckNameCollision.fromHandle(core.MojoHandle handle) :
      stub = new CheckNameCollisionStub.fromHandle(handle);

  CheckNameCollision.fromStub(this.stub);

  CheckNameCollision.unbound() :
      stub = new CheckNameCollisionStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  CheckNameCollision get delegate => stub.delegate;
  set delegate(CheckNameCollision d) {
    stub.delegate = d;
  }
  Future<CheckNameCollisionWithNameCollisionResponseParams> withNameCollision(bool message,bool response,[Function responseFactory = null]);

}

class CheckNameCollisionProxy extends bindings.Proxy implements CheckNameCollision {
  CheckNameCollisionProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CheckNameCollisionProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CheckNameCollisionProxy.unbound() : super.unbound();

  String get name => CheckNameCollision.name;

  static CheckNameCollisionProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CheckNameCollisionProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kCheckNameCollision_withNameCollision_name:
        var r = CheckNameCollisionWithNameCollisionResponseParams.deserialize(
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
  Future<CheckNameCollisionWithNameCollisionResponseParams> withNameCollision(bool message,bool response,[Function responseFactory = null]) {
    var params = new CheckNameCollisionWithNameCollisionParams();
    params.message = message;
    params.response = response;
    return sendMessageWithRequestId(
        params,
        kCheckNameCollision_withNameCollision_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class CheckNameCollisionStub extends bindings.Stub {
  CheckNameCollision _delegate = null;

  CheckNameCollisionStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  CheckNameCollisionStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  CheckNameCollisionStub.unbound() : super.unbound();

  static CheckNameCollisionStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new CheckNameCollisionStub(endpoint);

  static const String name = CheckNameCollision.name;


  CheckNameCollisionWithNameCollisionResponseParams _CheckNameCollisionWithNameCollisionResponseParamsFactory(bool message, bool response) {
    var result = new CheckNameCollisionWithNameCollisionResponseParams();
    result.message = message;
    result.response = response;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kCheckNameCollision_withNameCollision_name:
        var params = CheckNameCollisionWithNameCollisionParams.deserialize(
            message.payload);
        return _delegate.withNameCollision(params.message,params.response,_CheckNameCollisionWithNameCollisionResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kCheckNameCollision_withNameCollision_name,
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

  CheckNameCollision get delegate => _delegate;
      set delegate(CheckNameCollision d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




