// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library embeddee.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class EmbeddeeHelloBackParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  EmbeddeeHelloBackParams() : super(kStructSize);

  static EmbeddeeHelloBackParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EmbeddeeHelloBackParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EmbeddeeHelloBackParams result = new EmbeddeeHelloBackParams();

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

class EmbeddeeHelloBackResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  EmbeddeeHelloBackResponseParams() : super(kStructSize);

  static EmbeddeeHelloBackResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EmbeddeeHelloBackResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EmbeddeeHelloBackResponseParams result = new EmbeddeeHelloBackResponseParams();

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
const int kEmbeddee_helloBack_name = 0;

const String EmbeddeeName =
      'examples::Embeddee';

abstract class Embeddee {
  Future<EmbeddeeHelloBackResponseParams> helloBack([Function responseFactory = null]);

}


class EmbeddeeProxyImpl extends bindings.Proxy {
  EmbeddeeProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  EmbeddeeProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EmbeddeeProxyImpl.unbound() : super.unbound();

  static EmbeddeeProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EmbeddeeProxyImpl.fromEndpoint(endpoint);

  String get name => EmbeddeeName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kEmbeddee_helloBack_name:
        var r = EmbeddeeHelloBackResponseParams.deserialize(
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


class _EmbeddeeProxyCalls implements Embeddee {
  EmbeddeeProxyImpl _proxyImpl;

  _EmbeddeeProxyCalls(this._proxyImpl);
    Future<EmbeddeeHelloBackResponseParams> helloBack([Function responseFactory = null]) {
      var params = new EmbeddeeHelloBackParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kEmbeddee_helloBack_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class EmbeddeeProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Embeddee ptr;
  final String name = EmbeddeeName;

  EmbeddeeProxy(EmbeddeeProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _EmbeddeeProxyCalls(proxyImpl);

  EmbeddeeProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new EmbeddeeProxyImpl.fromEndpoint(endpoint) {
    ptr = new _EmbeddeeProxyCalls(impl);
  }

  EmbeddeeProxy.fromHandle(core.MojoHandle handle) :
      impl = new EmbeddeeProxyImpl.fromHandle(handle) {
    ptr = new _EmbeddeeProxyCalls(impl);
  }

  EmbeddeeProxy.unbound() :
      impl = new EmbeddeeProxyImpl.unbound() {
    ptr = new _EmbeddeeProxyCalls(impl);
  }

  static EmbeddeeProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EmbeddeeProxy.fromEndpoint(endpoint);

  void close() => impl.close();
}


class EmbeddeeStub extends bindings.Stub {
  Embeddee _delegate = null;

  EmbeddeeStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  EmbeddeeStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EmbeddeeStub.unbound() : super.unbound();

  static EmbeddeeStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EmbeddeeStub.fromEndpoint(endpoint);

  static const String name = EmbeddeeName;


  EmbeddeeHelloBackResponseParams _EmbeddeeHelloBackResponseParamsFactory() {
    var result = new EmbeddeeHelloBackResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kEmbeddee_helloBack_name:
        var params = EmbeddeeHelloBackParams.deserialize(
            message.payload);
        return _delegate.helloBack(_EmbeddeeHelloBackResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kEmbeddee_helloBack_name,
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

  Embeddee get delegate => _delegate;
      set delegate(Embeddee d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


