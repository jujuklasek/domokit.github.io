// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library transfer.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class TransferCompleteParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  int applicationSecret = 0;
  int node = 0;

  TransferCompleteParams() : super(kVersions.last.size);

  static TransferCompleteParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TransferCompleteParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TransferCompleteParams result = new TransferCompleteParams();

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
      
      result.applicationSecret = decoder0.decodeUint64(8);
    }
    if (mainDataHeader.version >= 0) {
      
      result.node = decoder0.decodeUint32(16);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeUint64(applicationSecret, 8);
    
    encoder0.encodeUint32(node, 16);
  }

  String toString() {
    return "TransferCompleteParams("
           "applicationSecret: $applicationSecret" ", "
           "node: $node" ")";
  }
}

class TransferPingParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TransferPingParams() : super(kVersions.last.size);

  static TransferPingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TransferPingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TransferPingParams result = new TransferPingParams();

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
    return "TransferPingParams("")";
  }
}

class TransferPingResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  TransferPingResponseParams() : super(kVersions.last.size);

  static TransferPingResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static TransferPingResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    TransferPingResponseParams result = new TransferPingResponseParams();

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
    return "TransferPingResponseParams("")";
  }
}
const int kTransfer_complete_name = 0;
const int kTransfer_ping_name = 1;

const String TransferName =
      'reaper::Transfer';

abstract class Transfer {
  void complete(int applicationSecret, int node);
  Future<TransferPingResponseParams> ping([Function responseFactory = null]);

}


class TransferProxyImpl extends bindings.Proxy {
  TransferProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  TransferProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  TransferProxyImpl.unbound() : super.unbound();

  static TransferProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TransferProxyImpl.fromEndpoint(endpoint);

  String get name => TransferName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kTransfer_ping_name:
        var r = TransferPingResponseParams.deserialize(
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
    return "TransferProxyImpl($superString)";
  }
}


class _TransferProxyCalls implements Transfer {
  TransferProxyImpl _proxyImpl;

  _TransferProxyCalls(this._proxyImpl);
    void complete(int applicationSecret, int node) {
      assert(_proxyImpl.isBound);
      var params = new TransferCompleteParams();
      params.applicationSecret = applicationSecret;
      params.node = node;
      _proxyImpl.sendMessage(params, kTransfer_complete_name);
    }
  
    Future<TransferPingResponseParams> ping([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new TransferPingParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kTransfer_ping_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class TransferProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Transfer ptr;
  final String name = TransferName;

  TransferProxy(TransferProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _TransferProxyCalls(proxyImpl);

  TransferProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new TransferProxyImpl.fromEndpoint(endpoint) {
    ptr = new _TransferProxyCalls(impl);
  }

  TransferProxy.fromHandle(core.MojoHandle handle) :
      impl = new TransferProxyImpl.fromHandle(handle) {
    ptr = new _TransferProxyCalls(impl);
  }

  TransferProxy.unbound() :
      impl = new TransferProxyImpl.unbound() {
    ptr = new _TransferProxyCalls(impl);
  }

  static TransferProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TransferProxy.fromEndpoint(endpoint);

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  String toString() {
    return "TransferProxy($impl)";
  }
}


class TransferStub extends bindings.Stub {
  Transfer _impl = null;

  TransferStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  TransferStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  TransferStub.unbound() : super.unbound();

  static TransferStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new TransferStub.fromEndpoint(endpoint);

  static const String name = TransferName;


  TransferPingResponseParams _TransferPingResponseParamsFactory() {
    var result = new TransferPingResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kTransfer_complete_name:
        var params = TransferCompleteParams.deserialize(
            message.payload);
        _impl.complete(params.applicationSecret, params.node);
        break;
      case kTransfer_ping_name:
        var params = TransferPingParams.deserialize(
            message.payload);
        return _impl.ping(_TransferPingResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kTransfer_ping_name,
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

  Transfer get impl => _impl;
      set impl(Transfer d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "TransferStub($superString)";
  }
}


