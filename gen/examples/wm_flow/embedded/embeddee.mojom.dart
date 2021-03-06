// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library embeddee.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class EmbeddeeHelloBackParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  EmbeddeeHelloBackParams() : super(kVersions.last.size);

  static EmbeddeeHelloBackParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EmbeddeeHelloBackParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EmbeddeeHelloBackParams result = new EmbeddeeHelloBackParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "EmbeddeeHelloBackParams("")";
  }
}

class EmbeddeeHelloBackResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  EmbeddeeHelloBackResponseParams() : super(kVersions.last.size);

  static EmbeddeeHelloBackResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static EmbeddeeHelloBackResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    EmbeddeeHelloBackResponseParams result = new EmbeddeeHelloBackResponseParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if (mainDataHeader.version <= kVersions.last.version) {
      // Scan in reverse order to optimize for more recent versions.
      for (int i = kVersions.length - 1; i >= 0; --i) {
        if (mainDataHeader.version >= kVersions[i].version) {
          if (mainDataHeader.size != kVersions[i].size)
            throw new bindings.MojoCodecError(
                'Header doesn\'t correspond to any known version.');
        }
      }
    } else if (mainDataHeader.size < kVersions.last.size) {
      throw new bindings.MojoCodecError(
        'Message newer than the last known version cannot be shorter than '
        'required by the last known version.');
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    encoder.getStructEncoderAtOffset(kVersions.last);
  }

  String toString() {
    return "EmbeddeeHelloBackResponseParams("")";
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
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

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
    return "EmbeddeeProxyImpl($superString)";
  }
}


class _EmbeddeeProxyCalls implements Embeddee {
  EmbeddeeProxyImpl _proxyImpl;

  _EmbeddeeProxyCalls(this._proxyImpl);
    Future<EmbeddeeHelloBackResponseParams> helloBack([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
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

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  String toString() {
    return "EmbeddeeProxy($impl)";
  }
}


class EmbeddeeStub extends bindings.Stub {
  Embeddee _impl = null;

  EmbeddeeStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  EmbeddeeStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

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
    assert(_impl != null);
    switch (message.header.type) {
      case kEmbeddee_helloBack_name:
        var params = EmbeddeeHelloBackParams.deserialize(
            message.payload);
        return _impl.helloBack(_EmbeddeeHelloBackResponseParamsFactory).then((response) {
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

  Embeddee get impl => _impl;
      set impl(Embeddee d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "EmbeddeeStub($superString)";
  }
}


