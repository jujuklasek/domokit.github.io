// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library external_application_registrar.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;
import 'package:mojo/public/interfaces/application/application.mojom.dart' as application_mojom;


class ExternalApplicationRegistrarRegisterParams extends bindings.Struct {
  static const int kStructSize = 24;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
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
        (mainDataHeader.version < 0)) {
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

  String toString() {
    return "ExternalApplicationRegistrarRegisterParams("
           "applicationUrl: $applicationUrl" ", "
           "args: $args" ")";
  }
}

class ExternalApplicationRegistrarRegisterResponseParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
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
        (mainDataHeader.version < 0)) {
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

  String toString() {
    return "ExternalApplicationRegistrarRegisterResponseParams("
           "applicationRequest: $applicationRequest" ")";
  }
}
const int kExternalApplicationRegistrar_register_name = 0;

const String ExternalApplicationRegistrarName =
      'mojo::ExternalApplicationRegistrar';

abstract class ExternalApplicationRegistrar {
  Future<ExternalApplicationRegistrarRegisterResponseParams> register(String applicationUrl,List<String> args,[Function responseFactory = null]);

}


class ExternalApplicationRegistrarProxyImpl extends bindings.Proxy {
  ExternalApplicationRegistrarProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ExternalApplicationRegistrarProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ExternalApplicationRegistrarProxyImpl.unbound() : super.unbound();

  static ExternalApplicationRegistrarProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ExternalApplicationRegistrarProxyImpl.fromEndpoint(endpoint);

  String get name => ExternalApplicationRegistrarName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kExternalApplicationRegistrar_register_name:
        var r = ExternalApplicationRegistrarRegisterResponseParams.deserialize(
            message.payload);
        if (!message.header.hasRequestId) {
          throw 'Expected a message with a valid request Id.';
        }
        Completer c = completerMap[message.header.requestId];
        if (c == null) {
          throw 'Message had unknown request Id: ${message.header.requestId}';
        }
        completerMap.remove(message.header.requestId);
        assert(!c.isCompleted);
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "ExternalApplicationRegistrarProxyImpl($superString)";
  }
}


class _ExternalApplicationRegistrarProxyCalls implements ExternalApplicationRegistrar {
  ExternalApplicationRegistrarProxyImpl _proxyImpl;

  _ExternalApplicationRegistrarProxyCalls(this._proxyImpl);
    Future<ExternalApplicationRegistrarRegisterResponseParams> register(String applicationUrl,List<String> args,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new ExternalApplicationRegistrarRegisterParams();
      params.applicationUrl = applicationUrl;
      params.args = args;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kExternalApplicationRegistrar_register_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class ExternalApplicationRegistrarProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ExternalApplicationRegistrar ptr;
  final String name = ExternalApplicationRegistrarName;

  ExternalApplicationRegistrarProxy(ExternalApplicationRegistrarProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ExternalApplicationRegistrarProxyCalls(proxyImpl);

  ExternalApplicationRegistrarProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ExternalApplicationRegistrarProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ExternalApplicationRegistrarProxyCalls(impl);
  }

  ExternalApplicationRegistrarProxy.fromHandle(core.MojoHandle handle) :
      impl = new ExternalApplicationRegistrarProxyImpl.fromHandle(handle) {
    ptr = new _ExternalApplicationRegistrarProxyCalls(impl);
  }

  ExternalApplicationRegistrarProxy.unbound() :
      impl = new ExternalApplicationRegistrarProxyImpl.unbound() {
    ptr = new _ExternalApplicationRegistrarProxyCalls(impl);
  }

  static ExternalApplicationRegistrarProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ExternalApplicationRegistrarProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "ExternalApplicationRegistrarProxy($impl)";
  }
}


class ExternalApplicationRegistrarStub extends bindings.Stub {
  ExternalApplicationRegistrar _impl = null;

  ExternalApplicationRegistrarStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ExternalApplicationRegistrarStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ExternalApplicationRegistrarStub.unbound() : super.unbound();

  static ExternalApplicationRegistrarStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ExternalApplicationRegistrarStub.fromEndpoint(endpoint);

  static const String name = ExternalApplicationRegistrarName;


  ExternalApplicationRegistrarRegisterResponseParams _ExternalApplicationRegistrarRegisterResponseParamsFactory(Object applicationRequest) {
    var result = new ExternalApplicationRegistrarRegisterResponseParams();
    result.applicationRequest = applicationRequest;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kExternalApplicationRegistrar_register_name:
        var params = ExternalApplicationRegistrarRegisterParams.deserialize(
            message.payload);
        return _impl.register(params.applicationUrl,params.args,_ExternalApplicationRegistrarRegisterResponseParamsFactory).then((response) {
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

  ExternalApplicationRegistrar get impl => _impl;
      set impl(ExternalApplicationRegistrar d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ExternalApplicationRegistrarStub($superString)";
  }
}


