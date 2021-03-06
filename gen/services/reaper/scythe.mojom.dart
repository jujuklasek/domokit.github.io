// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library scythe.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class ScytheKillApplicationParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String url = null;

  ScytheKillApplicationParams() : super(kVersions.last.size);

  static ScytheKillApplicationParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ScytheKillApplicationParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ScytheKillApplicationParams result = new ScytheKillApplicationParams();

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
    if (mainDataHeader.version >= 0) {
      
      result.url = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(url, 8, false);
  }

  String toString() {
    return "ScytheKillApplicationParams("
           "url: $url" ")";
  }
}

class ScythePingParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  ScythePingParams() : super(kVersions.last.size);

  static ScythePingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ScythePingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ScythePingParams result = new ScythePingParams();

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
    return "ScythePingParams("")";
  }
}

class ScythePingResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  ScythePingResponseParams() : super(kVersions.last.size);

  static ScythePingResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ScythePingResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ScythePingResponseParams result = new ScythePingResponseParams();

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
    return "ScythePingResponseParams("")";
  }
}
const int kScythe_killApplication_name = 0;
const int kScythe_ping_name = 1;

const String ScytheName =
      'reaper::Scythe';

abstract class Scythe {
  void killApplication(String url);
  Future<ScythePingResponseParams> ping([Function responseFactory = null]);

}


class ScytheProxyImpl extends bindings.Proxy {
  ScytheProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ScytheProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ScytheProxyImpl.unbound() : super.unbound();

  static ScytheProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ScytheProxyImpl.fromEndpoint(endpoint);

  String get name => ScytheName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kScythe_ping_name:
        var r = ScythePingResponseParams.deserialize(
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
    return "ScytheProxyImpl($superString)";
  }
}


class _ScytheProxyCalls implements Scythe {
  ScytheProxyImpl _proxyImpl;

  _ScytheProxyCalls(this._proxyImpl);
    void killApplication(String url) {
      assert(_proxyImpl.isBound);
      var params = new ScytheKillApplicationParams();
      params.url = url;
      _proxyImpl.sendMessage(params, kScythe_killApplication_name);
    }
  
    Future<ScythePingResponseParams> ping([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new ScythePingParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kScythe_ping_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class ScytheProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Scythe ptr;
  final String name = ScytheName;

  ScytheProxy(ScytheProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ScytheProxyCalls(proxyImpl);

  ScytheProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ScytheProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ScytheProxyCalls(impl);
  }

  ScytheProxy.fromHandle(core.MojoHandle handle) :
      impl = new ScytheProxyImpl.fromHandle(handle) {
    ptr = new _ScytheProxyCalls(impl);
  }

  ScytheProxy.unbound() :
      impl = new ScytheProxyImpl.unbound() {
    ptr = new _ScytheProxyCalls(impl);
  }

  static ScytheProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ScytheProxy.fromEndpoint(endpoint);

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  String toString() {
    return "ScytheProxy($impl)";
  }
}


class ScytheStub extends bindings.Stub {
  Scythe _impl = null;

  ScytheStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ScytheStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ScytheStub.unbound() : super.unbound();

  static ScytheStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ScytheStub.fromEndpoint(endpoint);

  static const String name = ScytheName;


  ScythePingResponseParams _ScythePingResponseParamsFactory() {
    var result = new ScythePingResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kScythe_killApplication_name:
        var params = ScytheKillApplicationParams.deserialize(
            message.payload);
        _impl.killApplication(params.url);
        break;
      case kScythe_ping_name:
        var params = ScythePingParams.deserialize(
            message.payload);
        return _impl.ping(_ScythePingResponseParamsFactory).then((response) {
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

  Scythe get impl => _impl;
      set impl(Scythe d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ScytheStub($superString)";
  }
}


