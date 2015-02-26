// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library indirect_service_demo.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class IntegerServiceIncrementParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  IntegerServiceIncrementParams() : super(kStructSize);

  static IntegerServiceIncrementParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IntegerServiceIncrementParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IntegerServiceIncrementParams result = new IntegerServiceIncrementParams();

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

class IntegerServiceIncrementResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  int value = 0;

  IntegerServiceIncrementResponseParams() : super(kStructSize);

  static IntegerServiceIncrementResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IntegerServiceIncrementResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IntegerServiceIncrementResponseParams result = new IntegerServiceIncrementResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.value = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(value, 8);
  }
}

class IndirectIntegerServiceSetParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object service = null;

  IndirectIntegerServiceSetParams() : super(kStructSize);

  static IndirectIntegerServiceSetParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IndirectIntegerServiceSetParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IndirectIntegerServiceSetParams result = new IndirectIntegerServiceSetParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.service = decoder0.decodeServiceInterface(8, true, IntegerServiceProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(service, 8, true);
  }
}

class IndirectIntegerServiceGetParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object service = null;

  IndirectIntegerServiceGetParams() : super(kStructSize);

  static IndirectIntegerServiceGetParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IndirectIntegerServiceGetParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IndirectIntegerServiceGetParams result = new IndirectIntegerServiceGetParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.service = decoder0.decodeInterfaceRequest(8, true, IntegerServiceStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(service, 8, true);
  }
}
const int kIntegerService_increment_name = 0;

abstract class IntegerService implements core.Listener {
  static const String name = 'mojo::examples::IntegerService';
  IntegerServiceStub stub;

  IntegerService(core.MojoMessagePipeEndpoint endpoint) :
      stub = new IntegerServiceStub(endpoint);

  IntegerService.fromHandle(core.MojoHandle handle) :
      stub = new IntegerServiceStub.fromHandle(handle);

  IntegerService.fromStub(this.stub);

  IntegerService.unbound() :
      stub = new IntegerServiceStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  IntegerService get delegate => stub.delegate;
  set delegate(IntegerService d) {
    stub.delegate = d;
  }
  Future<IntegerServiceIncrementResponseParams> increment([Function responseFactory = null]);

}

class IntegerServiceProxy extends bindings.Proxy implements IntegerService {
  IntegerServiceProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  IntegerServiceProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IntegerServiceProxy.unbound() : super.unbound();

  String get name => IntegerService.name;

  static IntegerServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IntegerServiceProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kIntegerService_increment_name:
        var r = IntegerServiceIncrementResponseParams.deserialize(
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
  Future<IntegerServiceIncrementResponseParams> increment([Function responseFactory = null]) {
    var params = new IntegerServiceIncrementParams();
    return sendMessageWithRequestId(
        params,
        kIntegerService_increment_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class IntegerServiceStub extends bindings.Stub {
  IntegerService _delegate = null;

  IntegerServiceStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  IntegerServiceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IntegerServiceStub.unbound() : super.unbound();

  static IntegerServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IntegerServiceStub(endpoint);

  static const String name = IntegerService.name;


  IntegerServiceIncrementResponseParams _IntegerServiceIncrementResponseParamsFactory(int value) {
    var result = new IntegerServiceIncrementResponseParams();
    result.value = value;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kIntegerService_increment_name:
        var params = IntegerServiceIncrementParams.deserialize(
            message.payload);
        return _delegate.increment(_IntegerServiceIncrementResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kIntegerService_increment_name,
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

  IntegerService get delegate => _delegate;
      set delegate(IntegerService d) {
    assert(_delegate == null);
    _delegate = d;
  }
}

const int kIndirectIntegerService_set_name = 0;
const int kIndirectIntegerService_get_name = 1;

abstract class IndirectIntegerService implements core.Listener {
  static const String name = 'mojo::examples::IndirectIntegerService';
  IndirectIntegerServiceStub stub;

  IndirectIntegerService(core.MojoMessagePipeEndpoint endpoint) :
      stub = new IndirectIntegerServiceStub(endpoint);

  IndirectIntegerService.fromHandle(core.MojoHandle handle) :
      stub = new IndirectIntegerServiceStub.fromHandle(handle);

  IndirectIntegerService.fromStub(this.stub);

  IndirectIntegerService.unbound() :
      stub = new IndirectIntegerServiceStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  IndirectIntegerService get delegate => stub.delegate;
  set delegate(IndirectIntegerService d) {
    stub.delegate = d;
  }
  void set(Object service);
  void get(Object service);

}

class IndirectIntegerServiceProxy extends bindings.Proxy implements IndirectIntegerService {
  IndirectIntegerServiceProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  IndirectIntegerServiceProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IndirectIntegerServiceProxy.unbound() : super.unbound();

  String get name => IndirectIntegerService.name;

  static IndirectIntegerServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IndirectIntegerServiceProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
  void set(Object service) {
    var params = new IndirectIntegerServiceSetParams();
    params.service = service;
    sendMessage(params, kIndirectIntegerService_set_name);
  }

  void get(Object service) {
    var params = new IndirectIntegerServiceGetParams();
    params.service = service;
    sendMessage(params, kIndirectIntegerService_get_name);
  }

}

class IndirectIntegerServiceStub extends bindings.Stub {
  IndirectIntegerService _delegate = null;

  IndirectIntegerServiceStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  IndirectIntegerServiceStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IndirectIntegerServiceStub.unbound() : super.unbound();

  static IndirectIntegerServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IndirectIntegerServiceStub(endpoint);

  static const String name = IndirectIntegerService.name;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kIndirectIntegerService_set_name:
        var params = IndirectIntegerServiceSetParams.deserialize(
            message.payload);
        _delegate.set(params.service);
        break;
      case kIndirectIntegerService_get_name:
        var params = IndirectIntegerServiceGetParams.deserialize(
            message.payload);
        _delegate.get(params.service);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  IndirectIntegerService get delegate => _delegate;
      set delegate(IndirectIntegerService d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


