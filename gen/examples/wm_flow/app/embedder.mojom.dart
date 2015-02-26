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

abstract class Embedder implements core.Listener {
  static const String name = 'examples::Embedder';
  EmbedderStub stub;

  Embedder(core.MojoMessagePipeEndpoint endpoint) :
      stub = new EmbedderStub(endpoint);

  Embedder.fromHandle(core.MojoHandle handle) :
      stub = new EmbedderStub.fromHandle(handle);

  Embedder.fromStub(this.stub);

  Embedder.unbound() :
      stub = new EmbedderStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen({Function onClosed}) =>
      stub.listen(onClosed: onClosed);

  Embedder get delegate => stub.delegate;
  set delegate(Embedder d) {
    stub.delegate = d;
  }
  Future<EmbedderHelloWorldResponseParams> helloWorld([Function responseFactory = null]);

}

class EmbedderProxy extends bindings.Proxy implements Embedder {
  EmbedderProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  EmbedderProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EmbedderProxy.unbound() : super.unbound();

  String get name => Embedder.name;

  static EmbedderProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EmbedderProxy(endpoint);

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
  Future<EmbedderHelloWorldResponseParams> helloWorld([Function responseFactory = null]) {
    var params = new EmbedderHelloWorldParams();
    return sendMessageWithRequestId(
        params,
        kEmbedder_helloWorld_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class EmbedderStub extends bindings.Stub {
  Embedder _delegate = null;

  EmbedderStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  EmbedderStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EmbedderStub.unbound() : super.unbound();

  static EmbedderStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EmbedderStub(endpoint);

  static const String name = Embedder.name;


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


