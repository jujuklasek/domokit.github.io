// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library embedder.mojom;

import 'dart:async';
import 'dart:mojo.bindings' as bindings;
import 'dart:mojo.core' as core;


class EmbedderHelloWorldParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  EmbedderHelloWorldParams() : super(kStructSize);

  static EmbedderHelloWorldParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EmbedderHelloWorldParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EmbedderHelloWorldParams result = new EmbedderHelloWorldParams();

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

  String toString() {
    return "EmbedderHelloWorldParams("")";
  }
}

class EmbedderHelloWorldResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  EmbedderHelloWorldResponseParams() : super(kStructSize);

  static EmbedderHelloWorldResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EmbedderHelloWorldResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EmbedderHelloWorldResponseParams result = new EmbedderHelloWorldResponseParams();

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

  String toString() {
    return "EmbedderHelloWorldResponseParams("")";
  }
}
const int kEmbedder_helloWorld_name = 0;

const String EmbedderName =
      'examples::Embedder';

abstract class Embedder {
  Future<EmbedderHelloWorldResponseParams> helloWorld([Function responseFactory = null]);

}


class EmbedderProxyImpl extends bindings.Proxy {
  EmbedderProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  EmbedderProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EmbedderProxyImpl.unbound() : super.unbound();

  static EmbedderProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EmbedderProxyImpl.fromEndpoint(endpoint);

  String get name => EmbedderName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kEmbedder_helloWorld_name:
        var r = EmbedderHelloWorldResponseParams.deserialize(
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
    return "EmbedderProxyImpl($superString)";
  }
}


class _EmbedderProxyCalls implements Embedder {
  EmbedderProxyImpl _proxyImpl;

  _EmbedderProxyCalls(this._proxyImpl);
    Future<EmbedderHelloWorldResponseParams> helloWorld([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new EmbedderHelloWorldParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kEmbedder_helloWorld_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class EmbedderProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Embedder ptr;
  final String name = EmbedderName;

  EmbedderProxy(EmbedderProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _EmbedderProxyCalls(proxyImpl);

  EmbedderProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new EmbedderProxyImpl.fromEndpoint(endpoint) {
    ptr = new _EmbedderProxyCalls(impl);
  }

  EmbedderProxy.fromHandle(core.MojoHandle handle) :
      impl = new EmbedderProxyImpl.fromHandle(handle) {
    ptr = new _EmbedderProxyCalls(impl);
  }

  EmbedderProxy.unbound() :
      impl = new EmbedderProxyImpl.unbound() {
    ptr = new _EmbedderProxyCalls(impl);
  }

  static EmbedderProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EmbedderProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "EmbedderProxy($impl)";
  }
}


class EmbedderStub extends bindings.Stub {
  Embedder _impl = null;

  EmbedderStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  EmbedderStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  EmbedderStub.unbound() : super.unbound();

  static EmbedderStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EmbedderStub.fromEndpoint(endpoint);

  static const String name = EmbedderName;


  EmbedderHelloWorldResponseParams _EmbedderHelloWorldResponseParamsFactory() {
    var result = new EmbedderHelloWorldResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kEmbedder_helloWorld_name:
        var params = EmbedderHelloWorldParams.deserialize(
            message.payload);
        return _impl.helloWorld(_EmbedderHelloWorldResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kEmbedder_helloWorld_name,
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

  Embedder get impl => _impl;
      set impl(Embedder d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "EmbedderStub($superString)";
  }
}


