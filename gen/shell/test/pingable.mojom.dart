// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library pingable.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class PingablePingParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String message = null;

  PingablePingParams() : super(kVersions.last.size);

  static PingablePingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static PingablePingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    PingablePingParams result = new PingablePingParams();

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
      
      result.message = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(message, 8, false);
  }

  String toString() {
    return "PingablePingParams("
           "message: $message" ")";
  }
}

class PingablePingResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(32, 0)
  ];
  String appUrl = null;
  String connectionUrl = null;
  String message = null;

  PingablePingResponseParams() : super(kVersions.last.size);

  static PingablePingResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static PingablePingResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    PingablePingResponseParams result = new PingablePingResponseParams();

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
      
      result.appUrl = decoder0.decodeString(8, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.connectionUrl = decoder0.decodeString(16, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.message = decoder0.decodeString(24, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(appUrl, 8, false);
    
    encoder0.encodeString(connectionUrl, 16, false);
    
    encoder0.encodeString(message, 24, false);
  }

  String toString() {
    return "PingablePingResponseParams("
           "appUrl: $appUrl" ", "
           "connectionUrl: $connectionUrl" ", "
           "message: $message" ")";
  }
}
const int kPingable_ping_name = 0;

const String PingableName =
      'mojo::Pingable';

abstract class Pingable {
  Future<PingablePingResponseParams> ping(String message,[Function responseFactory = null]);

}


class PingableProxyImpl extends bindings.Proxy {
  PingableProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  PingableProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  PingableProxyImpl.unbound() : super.unbound();

  static PingableProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new PingableProxyImpl.fromEndpoint(endpoint);

  String get name => PingableName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kPingable_ping_name:
        var r = PingablePingResponseParams.deserialize(
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
    return "PingableProxyImpl($superString)";
  }
}


class _PingableProxyCalls implements Pingable {
  PingableProxyImpl _proxyImpl;

  _PingableProxyCalls(this._proxyImpl);
    Future<PingablePingResponseParams> ping(String message,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new PingablePingParams();
      params.message = message;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kPingable_ping_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class PingableProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Pingable ptr;
  final String name = PingableName;

  PingableProxy(PingableProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _PingableProxyCalls(proxyImpl);

  PingableProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new PingableProxyImpl.fromEndpoint(endpoint) {
    ptr = new _PingableProxyCalls(impl);
  }

  PingableProxy.fromHandle(core.MojoHandle handle) :
      impl = new PingableProxyImpl.fromHandle(handle) {
    ptr = new _PingableProxyCalls(impl);
  }

  PingableProxy.unbound() :
      impl = new PingableProxyImpl.unbound() {
    ptr = new _PingableProxyCalls(impl);
  }

  static PingableProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new PingableProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "PingableProxy($impl)";
  }
}


class PingableStub extends bindings.Stub {
  Pingable _impl = null;

  PingableStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  PingableStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  PingableStub.unbound() : super.unbound();

  static PingableStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new PingableStub.fromEndpoint(endpoint);

  static const String name = PingableName;


  PingablePingResponseParams _PingablePingResponseParamsFactory(String appUrl, String connectionUrl, String message) {
    var result = new PingablePingResponseParams();
    result.appUrl = appUrl;
    result.connectionUrl = connectionUrl;
    result.message = message;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kPingable_ping_name:
        var params = PingablePingParams.deserialize(
            message.payload);
        return _impl.ping(params.message,_PingablePingResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kPingable_ping_name,
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

  Pingable get impl => _impl;
      set impl(Pingable d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "PingableStub($superString)";
  }
}


