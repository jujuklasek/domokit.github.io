// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library example_service.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class ExampleServicePingParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int pingValue = 0;

  ExampleServicePingParams() : super(kVersions.last.size);

  static ExampleServicePingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ExampleServicePingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ExampleServicePingParams result = new ExampleServicePingParams();

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
      
      result.pingValue = decoder0.decodeUint16(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeUint16(pingValue, 8);
  }

  String toString() {
    return "ExampleServicePingParams("
           "pingValue: $pingValue" ")";
  }
}

class ExampleServicePingResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int pongValue = 0;

  ExampleServicePingResponseParams() : super(kVersions.last.size);

  static ExampleServicePingResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static ExampleServicePingResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    ExampleServicePingResponseParams result = new ExampleServicePingResponseParams();

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
      
      result.pongValue = decoder0.decodeUint16(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeUint16(pongValue, 8);
  }

  String toString() {
    return "ExampleServicePingResponseParams("
           "pongValue: $pongValue" ")";
  }
}
const int kExampleService_ping_name = 0;

const String ExampleServiceName =
      'mojo::ExampleService';

abstract class ExampleService {
  Future<ExampleServicePingResponseParams> ping(int pingValue,[Function responseFactory = null]);

}


class ExampleServiceProxyImpl extends bindings.Proxy {
  ExampleServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  ExampleServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  ExampleServiceProxyImpl.unbound() : super.unbound();

  static ExampleServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ExampleServiceProxyImpl.fromEndpoint(endpoint);

  String get name => ExampleServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kExampleService_ping_name:
        var r = ExampleServicePingResponseParams.deserialize(
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
    return "ExampleServiceProxyImpl($superString)";
  }
}


class _ExampleServiceProxyCalls implements ExampleService {
  ExampleServiceProxyImpl _proxyImpl;

  _ExampleServiceProxyCalls(this._proxyImpl);
    Future<ExampleServicePingResponseParams> ping(int pingValue,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new ExampleServicePingParams();
      params.pingValue = pingValue;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kExampleService_ping_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class ExampleServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  ExampleService ptr;
  final String name = ExampleServiceName;

  ExampleServiceProxy(ExampleServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _ExampleServiceProxyCalls(proxyImpl);

  ExampleServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new ExampleServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _ExampleServiceProxyCalls(impl);
  }

  ExampleServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new ExampleServiceProxyImpl.fromHandle(handle) {
    ptr = new _ExampleServiceProxyCalls(impl);
  }

  ExampleServiceProxy.unbound() :
      impl = new ExampleServiceProxyImpl.unbound() {
    ptr = new _ExampleServiceProxyCalls(impl);
  }

  static ExampleServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ExampleServiceProxy.fromEndpoint(endpoint);

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  String toString() {
    return "ExampleServiceProxy($impl)";
  }
}


class ExampleServiceStub extends bindings.Stub {
  ExampleService _impl = null;

  ExampleServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  ExampleServiceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  ExampleServiceStub.unbound() : super.unbound();

  static ExampleServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new ExampleServiceStub.fromEndpoint(endpoint);

  static const String name = ExampleServiceName;


  ExampleServicePingResponseParams _ExampleServicePingResponseParamsFactory(int pongValue) {
    var result = new ExampleServicePingResponseParams();
    result.pongValue = pongValue;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kExampleService_ping_name:
        var params = ExampleServicePingParams.deserialize(
            message.payload);
        return _impl.ping(params.pingValue,_ExampleServicePingResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kExampleService_ping_name,
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

  ExampleService get impl => _impl;
      set impl(ExampleService d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "ExampleServiceStub($superString)";
  }
}


