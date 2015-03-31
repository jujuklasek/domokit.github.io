// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library network_test_service.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class NetworkTestServiceGetFileSizeParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String url = null;

  NetworkTestServiceGetFileSizeParams() : super(kVersions.last.size);

  static NetworkTestServiceGetFileSizeParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkTestServiceGetFileSizeParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkTestServiceGetFileSizeParams result = new NetworkTestServiceGetFileSizeParams();

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
    return "NetworkTestServiceGetFileSizeParams("
           "url: $url" ")";
  }
}

class NetworkTestServiceGetFileSizeResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  bool ok = false;
  int size = 0;

  NetworkTestServiceGetFileSizeResponseParams() : super(kVersions.last.size);

  static NetworkTestServiceGetFileSizeResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkTestServiceGetFileSizeResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkTestServiceGetFileSizeResponseParams result = new NetworkTestServiceGetFileSizeResponseParams();

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
      
      result.ok = decoder0.decodeBool(8, 0);
    }
    if (mainDataHeader.version >= 0) {
      
      result.size = decoder0.decodeUint64(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeBool(ok, 8, 0);
    
    encoder0.encodeUint64(size, 16);
  }

  String toString() {
    return "NetworkTestServiceGetFileSizeResponseParams("
           "ok: $ok" ", "
           "size: $size" ")";
  }
}

class NetworkTestServiceQuitParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  NetworkTestServiceQuitParams() : super(kVersions.last.size);

  static NetworkTestServiceQuitParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static NetworkTestServiceQuitParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    NetworkTestServiceQuitParams result = new NetworkTestServiceQuitParams();

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
    return "NetworkTestServiceQuitParams("")";
  }
}
const int kNetworkTestService_getFileSize_name = 0;
const int kNetworkTestService_quit_name = 1;

const String NetworkTestServiceName =
      'js::NetworkTestService';

abstract class NetworkTestService {
  Future<NetworkTestServiceGetFileSizeResponseParams> getFileSize(String url,[Function responseFactory = null]);
  void quit();

}


class NetworkTestServiceProxyImpl extends bindings.Proxy {
  NetworkTestServiceProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  NetworkTestServiceProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  NetworkTestServiceProxyImpl.unbound() : super.unbound();

  static NetworkTestServiceProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NetworkTestServiceProxyImpl.fromEndpoint(endpoint);

  String get name => NetworkTestServiceName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kNetworkTestService_getFileSize_name:
        var r = NetworkTestServiceGetFileSizeResponseParams.deserialize(
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
    return "NetworkTestServiceProxyImpl($superString)";
  }
}


class _NetworkTestServiceProxyCalls implements NetworkTestService {
  NetworkTestServiceProxyImpl _proxyImpl;

  _NetworkTestServiceProxyCalls(this._proxyImpl);
    Future<NetworkTestServiceGetFileSizeResponseParams> getFileSize(String url,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new NetworkTestServiceGetFileSizeParams();
      params.url = url;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kNetworkTestService_getFileSize_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void quit() {
      assert(_proxyImpl.isBound);
      var params = new NetworkTestServiceQuitParams();
      _proxyImpl.sendMessage(params, kNetworkTestService_quit_name);
    }
  
}


class NetworkTestServiceProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  NetworkTestService ptr;
  final String name = NetworkTestServiceName;

  NetworkTestServiceProxy(NetworkTestServiceProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _NetworkTestServiceProxyCalls(proxyImpl);

  NetworkTestServiceProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new NetworkTestServiceProxyImpl.fromEndpoint(endpoint) {
    ptr = new _NetworkTestServiceProxyCalls(impl);
  }

  NetworkTestServiceProxy.fromHandle(core.MojoHandle handle) :
      impl = new NetworkTestServiceProxyImpl.fromHandle(handle) {
    ptr = new _NetworkTestServiceProxyCalls(impl);
  }

  NetworkTestServiceProxy.unbound() :
      impl = new NetworkTestServiceProxyImpl.unbound() {
    ptr = new _NetworkTestServiceProxyCalls(impl);
  }

  static NetworkTestServiceProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NetworkTestServiceProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "NetworkTestServiceProxy($impl)";
  }
}


class NetworkTestServiceStub extends bindings.Stub {
  NetworkTestService _impl = null;

  NetworkTestServiceStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  NetworkTestServiceStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  NetworkTestServiceStub.unbound() : super.unbound();

  static NetworkTestServiceStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new NetworkTestServiceStub.fromEndpoint(endpoint);

  static const String name = NetworkTestServiceName;


  NetworkTestServiceGetFileSizeResponseParams _NetworkTestServiceGetFileSizeResponseParamsFactory(bool ok, int size) {
    var result = new NetworkTestServiceGetFileSizeResponseParams();
    result.ok = ok;
    result.size = size;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kNetworkTestService_getFileSize_name:
        var params = NetworkTestServiceGetFileSizeParams.deserialize(
            message.payload);
        return _impl.getFileSize(params.url,_NetworkTestServiceGetFileSizeResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kNetworkTestService_getFileSize_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kNetworkTestService_quit_name:
        var params = NetworkTestServiceQuitParams.deserialize(
            message.payload);
        _impl.quit();
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  NetworkTestService get impl => _impl;
      set impl(NetworkTestService d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "NetworkTestServiceStub($superString)";
  }
}


