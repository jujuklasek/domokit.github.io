// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library embedder.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


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
}
const int kEmbedder_helloWorld_name = 0;

const String EmbedderName =
      'examples::Embedder';

abstract class Embedder {
  Future<EmbedderHelloWorldResponseParams> helloWorld([Function responseFactory = null]);

}


class EmbedderProxyImpl extends bindings.Proxy {
  EmbedderProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

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
        completerMap[message.header.requestId] = null;
        c.complete(r);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }
}


class _EmbedderProxyCalls implements Embedder {
  EmbedderProxyImpl _proxyImpl;

  _EmbedderProxyCalls(this._proxyImpl);
    Future<EmbedderHelloWorldResponseParams> helloWorld([Function responseFactory = null]) {
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

  void close() => impl.close();
}


class EmbedderStub extends bindings.Stub {
  Embedder _delegate = null;

  EmbedderStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  EmbedderStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

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
    assert(_delegate != null);
    switch (message.header.type) {
      case kEmbedder_helloWorld_name:
        var params = EmbedderHelloWorldParams.deserialize(
            message.payload);
        return _delegate.helloWorld(_EmbedderHelloWorldResponseParamsFactory).then((response) {
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

  Embedder get delegate => _delegate;
      set delegate(Embedder d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


