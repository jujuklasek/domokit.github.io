// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library sample_factory.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/public/interfaces/bindings/tests/sample_import.mojom.dart' as sample_import_mojom;


class Request extends bindings.Struct {
  static const int kStructSize = 32;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 4);
  int x = 0;
  core.MojoMessagePipeEndpoint pipe = null;
  List<core.MojoMessagePipeEndpoint> morePipes = null;
  Object obj = null;

  Request() : super(kStructSize);

  static Request deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static Request decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Request result = new Request();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 4)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.x = decoder0.decodeInt32(8);
    }
    {
      
      result.pipe = decoder0.decodeMessagePipeHandle(12, true);
    }
    {
      
      result.morePipes = decoder0.decodeMessagePipeHandleArray(16, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    }
    {
      
      result.obj = decoder0.decodeServiceInterface(24, true, sample_import_mojom.ImportedInterfaceProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(x, 8);
    
    encoder0.encodeMessagePipeHandle(pipe, 12, true);
    
    encoder0.encodeMessagePipeHandleArray(morePipes, 16, bindings.kArrayNullable, bindings.kUnspecifiedArrayLength);
    
    encoder0.encodeInterface(obj, 24, true);
  }
}

class Response extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  int x = 0;
  core.MojoMessagePipeEndpoint pipe = null;

  Response() : super(kStructSize);

  static Response deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static Response decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Response result = new Response();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.x = decoder0.decodeInt32(8);
    }
    {
      
      result.pipe = decoder0.decodeMessagePipeHandle(12, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInt32(x, 8);
    
    encoder0.encodeMessagePipeHandle(pipe, 12, true);
  }
}

class NamedObjectSetNameParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String name = null;

  NamedObjectSetNameParams() : super(kStructSize);

  static NamedObjectSetNameParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NamedObjectSetNameParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NamedObjectSetNameParams result = new NamedObjectSetNameParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(name, 8, false);
  }
}

class NamedObjectGetNameParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  NamedObjectGetNameParams() : super(kStructSize);

  static NamedObjectGetNameParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NamedObjectGetNameParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NamedObjectGetNameParams result = new NamedObjectGetNameParams();

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

class NamedObjectGetNameResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String name = null;

  NamedObjectGetNameResponseParams() : super(kStructSize);

  static NamedObjectGetNameResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NamedObjectGetNameResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NamedObjectGetNameResponseParams result = new NamedObjectGetNameResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.name = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(name, 8, false);
  }
}

class FactoryDoStuffParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  Request request = null;
  core.MojoMessagePipeEndpoint pipe = null;

  FactoryDoStuffParams() : super(kStructSize);

  static FactoryDoStuffParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static FactoryDoStuffParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FactoryDoStuffParams result = new FactoryDoStuffParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.request = Request.decode(decoder1);
    }
    {
      
      result.pipe = decoder0.decodeMessagePipeHandle(16, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(request, 8, false);
    
    encoder0.encodeMessagePipeHandle(pipe, 16, true);
  }
}

class FactoryDoStuffResponseParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  Response response = null;
  String text = null;

  FactoryDoStuffResponseParams() : super(kStructSize);

  static FactoryDoStuffResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static FactoryDoStuffResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FactoryDoStuffResponseParams result = new FactoryDoStuffResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      var decoder1 = decoder0.decodePointer(8, false);
      result.response = Response.decode(decoder1);
    }
    {
      
      result.text = decoder0.decodeString(16, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeStruct(response, 8, false);
    
    encoder0.encodeString(text, 16, false);
  }
}

class FactoryDoStuff2Params extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  core.MojoDataPipeConsumer pipe = null;

  FactoryDoStuff2Params() : super(kStructSize);

  static FactoryDoStuff2Params deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static FactoryDoStuff2Params decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FactoryDoStuff2Params result = new FactoryDoStuff2Params();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.pipe = decoder0.decodeConsumerHandle(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeConsumerHandle(pipe, 8, false);
  }
}

class FactoryDoStuff2ResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String text = null;

  FactoryDoStuff2ResponseParams() : super(kStructSize);

  static FactoryDoStuff2ResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static FactoryDoStuff2ResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FactoryDoStuff2ResponseParams result = new FactoryDoStuff2ResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.text = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(text, 8, false);
  }
}

class FactoryCreateNamedObjectParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object obj = null;

  FactoryCreateNamedObjectParams() : super(kStructSize);

  static FactoryCreateNamedObjectParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static FactoryCreateNamedObjectParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FactoryCreateNamedObjectParams result = new FactoryCreateNamedObjectParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.obj = decoder0.decodeInterfaceRequest(8, false, NamedObjectStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(obj, 8, false);
  }
}

class FactoryRequestImportedInterfaceParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object obj = null;

  FactoryRequestImportedInterfaceParams() : super(kStructSize);

  static FactoryRequestImportedInterfaceParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static FactoryRequestImportedInterfaceParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FactoryRequestImportedInterfaceParams result = new FactoryRequestImportedInterfaceParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.obj = decoder0.decodeInterfaceRequest(8, false, sample_import_mojom.ImportedInterfaceStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(obj, 8, false);
  }
}

class FactoryRequestImportedInterfaceResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object obj = null;

  FactoryRequestImportedInterfaceResponseParams() : super(kStructSize);

  static FactoryRequestImportedInterfaceResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static FactoryRequestImportedInterfaceResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FactoryRequestImportedInterfaceResponseParams result = new FactoryRequestImportedInterfaceResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.obj = decoder0.decodeInterfaceRequest(8, false, sample_import_mojom.ImportedInterfaceStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(obj, 8, false);
  }
}

class FactoryTakeImportedInterfaceParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object obj = null;

  FactoryTakeImportedInterfaceParams() : super(kStructSize);

  static FactoryTakeImportedInterfaceParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static FactoryTakeImportedInterfaceParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FactoryTakeImportedInterfaceParams result = new FactoryTakeImportedInterfaceParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.obj = decoder0.decodeServiceInterface(8, false, sample_import_mojom.ImportedInterfaceProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(obj, 8, false);
  }
}

class FactoryTakeImportedInterfaceResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object obj = null;

  FactoryTakeImportedInterfaceResponseParams() : super(kStructSize);

  static FactoryTakeImportedInterfaceResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static FactoryTakeImportedInterfaceResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    FactoryTakeImportedInterfaceResponseParams result = new FactoryTakeImportedInterfaceResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.obj = decoder0.decodeServiceInterface(8, false, sample_import_mojom.ImportedInterfaceProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterface(obj, 8, false);
  }
}
const int kNamedObject_setName_name = 0;
const int kNamedObject_getName_name = 1;

const String NamedObjectName =
      'sample::NamedObject';

abstract class NamedObject {
  void setName(String name);
  Future<NamedObjectGetNameResponseParams> getName([Function responseFactory = null]);

}


class NamedObjectProxyImpl extends bindings.Proxy {
  NamedObjectProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  NamedObjectProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NamedObjectProxyImpl.unbound() : super.unbound();

  static NamedObjectProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NamedObjectProxyImpl.fromEndpoint(endpoint);

  String get name => NamedObjectName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kNamedObject_getName_name:
        var r = NamedObjectGetNameResponseParams.deserialize(
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
}


class _NamedObjectProxyCalls implements NamedObject {
  NamedObjectProxyImpl _proxyImpl;

  _NamedObjectProxyCalls(this._proxyImpl);
    void setName(String name) {
      var params = new NamedObjectSetNameParams();
      params.name = name;
      _proxyImpl.sendMessage(params, kNamedObject_setName_name);
    }
  
    Future<NamedObjectGetNameResponseParams> getName([Function responseFactory = null]) {
      var params = new NamedObjectGetNameParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kNamedObject_getName_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class NamedObjectProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  NamedObject ptr;
  final String name = NamedObjectName;

  NamedObjectProxy(NamedObjectProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _NamedObjectProxyCalls(proxyImpl);

  NamedObjectProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new NamedObjectProxyImpl.fromEndpoint(endpoint) {
    ptr = new _NamedObjectProxyCalls(impl);
  }

  NamedObjectProxy.fromHandle(core.MojoHandle handle) :
      impl = new NamedObjectProxyImpl.fromHandle(handle) {
    ptr = new _NamedObjectProxyCalls(impl);
  }

  NamedObjectProxy.unbound() :
      impl = new NamedObjectProxyImpl.unbound() {
    ptr = new _NamedObjectProxyCalls(impl);
  }

  static NamedObjectProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NamedObjectProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class NamedObjectStub extends bindings.Stub {
  NamedObject _delegate = null;

  NamedObjectStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  NamedObjectStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NamedObjectStub.unbound() : super.unbound();

  static NamedObjectStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NamedObjectStub.fromEndpoint(endpoint);

  static const String name = NamedObjectName;


  NamedObjectGetNameResponseParams _NamedObjectGetNameResponseParamsFactory(String name) {
    var result = new NamedObjectGetNameResponseParams();
    result.name = name;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kNamedObject_setName_name:
        var params = NamedObjectSetNameParams.deserialize(
            message.payload);
        _delegate.setName(params.name);
        break;
      case kNamedObject_getName_name:
        var params = NamedObjectGetNameParams.deserialize(
            message.payload);
        return _delegate.getName(_NamedObjectGetNameResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kNamedObject_getName_name,
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

  NamedObject get delegate => _delegate;
      set delegate(NamedObject d) {
    assert(_delegate == null);
    _delegate = d;
  }
}

const int kFactory_doStuff_name = 0;
const int kFactory_doStuff2_name = 1;
const int kFactory_createNamedObject_name = 2;
const int kFactory_requestImportedInterface_name = 3;
const int kFactory_takeImportedInterface_name = 4;

const String FactoryName =
      'sample::Factory';

abstract class Factory {
  Future<FactoryDoStuffResponseParams> doStuff(Request request,core.MojoMessagePipeEndpoint pipe,[Function responseFactory = null]);
  Future<FactoryDoStuff2ResponseParams> doStuff2(core.MojoDataPipeConsumer pipe,[Function responseFactory = null]);
  void createNamedObject(Object obj);
  Future<FactoryRequestImportedInterfaceResponseParams> requestImportedInterface(Object obj,[Function responseFactory = null]);
  Future<FactoryTakeImportedInterfaceResponseParams> takeImportedInterface(Object obj,[Function responseFactory = null]);

}


class FactoryProxyImpl extends bindings.Proxy {
  FactoryProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  FactoryProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  FactoryProxyImpl.unbound() : super.unbound();

  static FactoryProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new FactoryProxyImpl.fromEndpoint(endpoint);

  String get name => FactoryName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kFactory_doStuff_name:
        var r = FactoryDoStuffResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kFactory_doStuff2_name:
        var r = FactoryDoStuff2ResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kFactory_requestImportedInterface_name:
        var r = FactoryRequestImportedInterfaceResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      case kFactory_takeImportedInterface_name:
        var r = FactoryTakeImportedInterfaceResponseParams.deserialize(
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
}


class _FactoryProxyCalls implements Factory {
  FactoryProxyImpl _proxyImpl;

  _FactoryProxyCalls(this._proxyImpl);
    Future<FactoryDoStuffResponseParams> doStuff(Request request,core.MojoMessagePipeEndpoint pipe,[Function responseFactory = null]) {
      var params = new FactoryDoStuffParams();
      params.request = request;
      params.pipe = pipe;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kFactory_doStuff_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<FactoryDoStuff2ResponseParams> doStuff2(core.MojoDataPipeConsumer pipe,[Function responseFactory = null]) {
      var params = new FactoryDoStuff2Params();
      params.pipe = pipe;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kFactory_doStuff2_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void createNamedObject(Object obj) {
      var params = new FactoryCreateNamedObjectParams();
      params.obj = obj;
      _proxyImpl.sendMessage(params, kFactory_createNamedObject_name);
    }
  
    Future<FactoryRequestImportedInterfaceResponseParams> requestImportedInterface(Object obj,[Function responseFactory = null]) {
      var params = new FactoryRequestImportedInterfaceParams();
      params.obj = obj;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kFactory_requestImportedInterface_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    Future<FactoryTakeImportedInterfaceResponseParams> takeImportedInterface(Object obj,[Function responseFactory = null]) {
      var params = new FactoryTakeImportedInterfaceParams();
      params.obj = obj;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kFactory_takeImportedInterface_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class FactoryProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Factory ptr;
  final String name = FactoryName;

  FactoryProxy(FactoryProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _FactoryProxyCalls(proxyImpl);

  FactoryProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new FactoryProxyImpl.fromEndpoint(endpoint) {
    ptr = new _FactoryProxyCalls(impl);
  }

  FactoryProxy.fromHandle(core.MojoHandle handle) :
      impl = new FactoryProxyImpl.fromHandle(handle) {
    ptr = new _FactoryProxyCalls(impl);
  }

  FactoryProxy.unbound() :
      impl = new FactoryProxyImpl.unbound() {
    ptr = new _FactoryProxyCalls(impl);
  }

  static FactoryProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new FactoryProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class FactoryStub extends bindings.Stub {
  Factory _delegate = null;

  FactoryStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  FactoryStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  FactoryStub.unbound() : super.unbound();

  static FactoryStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new FactoryStub.fromEndpoint(endpoint);

  static const String name = FactoryName;


  FactoryDoStuffResponseParams _FactoryDoStuffResponseParamsFactory(Response response, String text) {
    var result = new FactoryDoStuffResponseParams();
    result.response = response;
    result.text = text;
    return result;
  }
  FactoryDoStuff2ResponseParams _FactoryDoStuff2ResponseParamsFactory(String text) {
    var result = new FactoryDoStuff2ResponseParams();
    result.text = text;
    return result;
  }
  FactoryRequestImportedInterfaceResponseParams _FactoryRequestImportedInterfaceResponseParamsFactory(Object obj) {
    var result = new FactoryRequestImportedInterfaceResponseParams();
    result.obj = obj;
    return result;
  }
  FactoryTakeImportedInterfaceResponseParams _FactoryTakeImportedInterfaceResponseParamsFactory(Object obj) {
    var result = new FactoryTakeImportedInterfaceResponseParams();
    result.obj = obj;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kFactory_doStuff_name:
        var params = FactoryDoStuffParams.deserialize(
            message.payload);
        return _delegate.doStuff(params.request,params.pipe,_FactoryDoStuffResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kFactory_doStuff_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kFactory_doStuff2_name:
        var params = FactoryDoStuff2Params.deserialize(
            message.payload);
        return _delegate.doStuff2(params.pipe,_FactoryDoStuff2ResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kFactory_doStuff2_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kFactory_createNamedObject_name:
        var params = FactoryCreateNamedObjectParams.deserialize(
            message.payload);
        _delegate.createNamedObject(params.obj);
        break;
      case kFactory_requestImportedInterface_name:
        var params = FactoryRequestImportedInterfaceParams.deserialize(
            message.payload);
        return _delegate.requestImportedInterface(params.obj,_FactoryRequestImportedInterfaceResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kFactory_requestImportedInterface_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kFactory_takeImportedInterface_name:
        var params = FactoryTakeImportedInterfaceParams.deserialize(
            message.payload);
        return _delegate.takeImportedInterface(params.obj,_FactoryTakeImportedInterfaceResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kFactory_takeImportedInterface_name,
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

  Factory get delegate => _delegate;
      set delegate(Factory d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


