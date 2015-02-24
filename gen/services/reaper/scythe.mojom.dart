// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library scythe.mojom;

import 'dart:async';
import 'dart:mojo_bindings' as bindings;
import 'dart:mojo_core' as core;


class ScytheKillApplicationParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String url = null;

  ScytheKillApplicationParams() : super(kStructSize);

  static ScytheKillApplicationParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ScytheKillApplicationParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ScytheKillApplicationParams result = new ScytheKillApplicationParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.url = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(url, 8, false);
  }
}

class ScythePingParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  ScythePingParams() : super(kStructSize);

  static ScythePingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ScythePingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ScythePingParams result = new ScythePingParams();

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

class ScythePingResponseParams extends bindings.Struct {
  static const int kStructSize = 8;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);

  ScythePingResponseParams() : super(kStructSize);

  static ScythePingResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ScythePingResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ScythePingResponseParams result = new ScythePingResponseParams();

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
const int kScythe_killApplication_name = 0;
const int kScythe_ping_name = 1;

abstract class Scythe implements core.Listener {
  static const String name = 'reaper::Scythe';
  ScytheStub stub;

  Scythe(core.MojoMessagePipeEndpoint endpoint) :
      stub = new ScytheStub(endpoint);

  Scythe.fromHandle(core.MojoHandle handle) :
      stub = new ScytheStub.fromHandle(handle);

  Scythe.fromStub(this.stub);

  Scythe.unbound() :
      stub = new ScytheStub.unbound();

  void close({bool nodefer : false}) => stub.close(nodefer: nodefer);

  StreamSubscription<int> listen() => stub.listen();

  Scythe get delegate => stub.delegate;
  set delegate(Scythe d) {
    stub.delegate = d;
  }
  void killApplication(String url);
  Future<ScythePingResponseParams> ping([Function responseFactory = null]);

}

class ScytheProxy extends bindings.Proxy implements Scythe {
  ScytheProxy(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ScytheProxy.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ScytheProxy.unbound() : super.unbound();

  String get name => Scythe.name;

  static ScytheProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ScytheProxy(endpoint);

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kScythe_ping_name:
        var r = ScythePingResponseParams.deserialize(
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
  void killApplication(String url) {
    var params = new ScytheKillApplicationParams();
    params.url = url;
    sendMessage(params, kScythe_killApplication_name);
  }

  Future<ScythePingResponseParams> ping([Function responseFactory = null]) {
    var params = new ScythePingParams();
    return sendMessageWithRequestId(
        params,
        kScythe_ping_name,
        -1,
        bindings.MessageHeader.kMessageExpectsResponse);
  }
}

class ScytheStub extends bindings.Stub {
  Scythe _delegate = null;

  ScytheStub(core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

  ScytheStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ScytheStub.unbound() : super.unbound();

  static ScytheStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ScytheStub(endpoint);

  static const String name = Scythe.name;


  ScythePingResponseParams _ScythePingResponseParamsFactory() {
    var result = new ScythePingResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kScythe_killApplication_name:
        var params = ScytheKillApplicationParams.deserialize(
            message.payload);
        _delegate.killApplication(params.url);
        break;
      case kScythe_ping_name:
        var params = ScythePingParams.deserialize(
            message.payload);
        return _delegate.ping(_ScythePingResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kScythe_ping_name,
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

  Scythe get delegate => _delegate;
      set delegate(Scythe d) {
    assert(_delegate == null);
    _delegate = d;
  }
}




