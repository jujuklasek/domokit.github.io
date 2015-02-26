// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library external_application_registrar.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;
import 'package:mojo/public/interfaces/application/application.mojom.dart' as application_mojom;


class ExternalApplicationRegistrarRegisterParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 2);
  String applicationUrl = null;
  List<String> args = null;

  ExternalApplicationRegistrarRegisterParams() : super(kStructSize);

  static ExternalApplicationRegistrarRegisterParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ExternalApplicationRegistrarRegisterParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ExternalApplicationRegistrarRegisterParams result = new ExternalApplicationRegistrarRegisterParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 2)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.applicationUrl = decoder0.decodeString(8, false);
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
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(applicationUrl, 8, false);
    
    if (args == null) {
      encoder0.encodeNullPointer(16, true);
    } else {
      var encoder1 = encoder0.encodePointerArray(args.length, 16, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < args.length; ++i0) {
        
        encoder1.encodeString(args[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }
}

class ExternalApplicationRegistrarRegisterResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  Object applicationRequest = null;

  ExternalApplicationRegistrarRegisterResponseParams() : super(kStructSize);

  static ExternalApplicationRegistrarRegisterResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ExternalApplicationRegistrarRegisterResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ExternalApplicationRegistrarRegisterResponseParams result = new ExternalApplicationRegistrarRegisterResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.applicationRequest = decoder0.decodeInterfaceRequest(8, false, application_mojom.ApplicationStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeInterfaceRequest(applicationRequest, 8, false);
  }
}
const int kExternalApplicationRegistrar_register_name = 0;

abstract class ExternalApplicationRegistrar implements core.Listener {
  static const String name = 'mojo::ExternalApplicationRegistrar';
  ExternalApplicationRegistrarStub stub;

  ExternalApplicationRegistrar(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ExternalApplicationRegistrarStub(endpoint);

  ExternalApplicationRegistrar.fromHandle(core.MojoHandle handle) :
      stub = new ExternalApplicationRegistrarStub.fromHandle(handle);

  ExternalApplicationRegistrar.fromStub(this.stub);

  ExternalApplicationRegistrar.unbound() :
      stub = new ExternalApplicationRegistrarStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  ExternalApplicationRegistrar get delegate => stub.delegate;
  set delegate(ExternalApplicationRegistrar d) {
    stub.delegate = d;
  }
  Future<ExternalApplicationRegistrarRegisterResponseParams> register(String applicationUrl,List<String> args,[Function responseFactory = null]);

}

class ExternalApplicationRegistrarProxy extends bindings.Proxy implements ExternalApplicationRegistrar {
  ExternalApplicationRegistrarProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ExternalApplicationRegistrarProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ExternalApplicationRegistrarProxy.unbound() : super.unbound();

  String get name => ExternalApplicationRegistrar.name;

  static ExternalApplicationRegistrarProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ExternalApplicationRegistrarProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kExternalApplicationRegistrar_register_name:
        var r = ExternalApplicationRegistrarRegisterResponseParams.deserialize(
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
  Future<ExternalApplicationRegistrarRegisterResponseParams> register(String applicationUrl,List<String> args,[Function responseFactory = null]) {
    var params = new ExternalApplicationRegistrarRegisterParams();
    params.applicationUrl = applicationUrl;
    params.args = args;
    return sendMessageWithRequestId(
        params,
        kExternalApplicationRegistrar_register_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class ExternalApplicationRegistrarStub extends bindings.Stub {
  ExternalApplicationRegistrar _delegate = null;

  ExternalApplicationRegistrarStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ExternalApplicationRegistrarStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ExternalApplicationRegistrarStub.unbound() : super.unbound();

  static ExternalApplicationRegistrarStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ExternalApplicationRegistrarStub(endpoint);

  static const String name = ExternalApplicationRegistrar.name;


  ExternalApplicationRegistrarRegisterResponseParams _ExternalApplicationRegistrarRegisterResponseParamsFactory(Object applicationRequest) {
    var result = new ExternalApplicationRegistrarRegisterResponseParams();
    result.applicationRequest = applicationRequest;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kExternalApplicationRegistrar_register_name:
        var params = ExternalApplicationRegistrarRegisterParams.deserialize(
            message.payload);
        return _delegate.register(params.applicationUrl,params.args,_ExternalApplicationRegistrarRegisterResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kExternalApplicationRegistrar_register_name,
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

  ExternalApplicationRegistrar get delegate => _delegate;
      set delegate(ExternalApplicationRegistrar d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




