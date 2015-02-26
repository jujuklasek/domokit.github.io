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

abstract class Embeddee implements core.Listener {
  static const String name = 'examples::Embeddee';
  EmbeddeeStub stub;

  Embeddee(core.MojoMessagePipeEndpoint endpoint) :
      stub = new EmbeddeeStub(endpoint);

  Embeddee.fromHandle(core.MojoHandle handle) :
      stub = new EmbeddeeStub.fromHandle(handle);

  Embeddee.fromStub(this.stub);

  Embeddee.unbound() :
      stub = new EmbeddeeStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  Embeddee get delegate => stub.delegate;
  set delegate(Embeddee d) {
    stub.delegate = d;
  }
  Future<EmbeddeeHelloBackResponseParams> helloBack([Function responseFactory = null]);

}

class EmbeddeeProxy extends bindings.Proxy implements Embeddee {
  EmbeddeeProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  EmbeddeeProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EmbeddeeProxy.unbound() : super.unbound();

  String get name => Embeddee.name;

  static EmbeddeeProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EmbeddeeProxy(endpoint);

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
  Future<EmbeddeeHelloBackResponseParams> helloBack([Function responseFactory = null]) {
    var params = new EmbeddeeHelloBackParams();
    return sendMessageWithRequestId(
        params,
        kEmbeddee_helloBack_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class EmbeddeeStub extends bindings.Stub {
  Embeddee _delegate = null;

  EmbeddeeStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  EmbeddeeStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  EmbeddeeStub.unbound() : super.unbound();

  static EmbeddeeStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new EmbeddeeStub(endpoint);

  static const String name = Embeddee.name;


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




