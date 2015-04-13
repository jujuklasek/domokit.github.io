// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library icu_data.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class IcuDataMapParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String sha1hash = null;

  IcuDataMapParams() : super(kVersions.last.size);

  static IcuDataMapParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IcuDataMapParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IcuDataMapParams result = new IcuDataMapParams();

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
      
      result.sha1hash = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(sha1hash, 8, false);
  }

  String toString() {
    return "IcuDataMapParams("
           "sha1hash: $sha1hash" ")";
  }
}

class IcuDataMapResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  core.MojoSharedBuffer icuData = null;

  IcuDataMapResponseParams() : super(kVersions.last.size);

  static IcuDataMapResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static IcuDataMapResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    IcuDataMapResponseParams result = new IcuDataMapResponseParams();

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
      
      result.icuData = decoder0.decodeSharedBufferHandle(8, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeSharedBufferHandle(icuData, 8, true);
  }

  String toString() {
    return "IcuDataMapResponseParams("
           "icuData: $icuData" ")";
  }
}
const int kIcuData_map_name = 0;

const String IcuDataName =
      'icu_data::IcuData';

abstract class IcuData {
  Future<IcuDataMapResponseParams> map(String sha1hash,[Function responseFactory = null]);

}


class IcuDataProxyImpl extends bindings.Proxy {
  IcuDataProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  IcuDataProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  IcuDataProxyImpl.unbound() : super.unbound();

  static IcuDataProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IcuDataProxyImpl.fromEndpoint(endpoint);

  String get name => IcuDataName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kIcuData_map_name:
        var r = IcuDataMapResponseParams.deserialize(
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
    return "IcuDataProxyImpl($superString)";
  }
}


class _IcuDataProxyCalls implements IcuData {
  IcuDataProxyImpl _proxyImpl;

  _IcuDataProxyCalls(this._proxyImpl);
    Future<IcuDataMapResponseParams> map(String sha1hash,[Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new IcuDataMapParams();
      params.sha1hash = sha1hash;
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kIcuData_map_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class IcuDataProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  IcuData ptr;
  final String name = IcuDataName;

  IcuDataProxy(IcuDataProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _IcuDataProxyCalls(proxyImpl);

  IcuDataProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new IcuDataProxyImpl.fromEndpoint(endpoint) {
    ptr = new _IcuDataProxyCalls(impl);
  }

  IcuDataProxy.fromHandle(core.MojoHandle handle) :
      impl = new IcuDataProxyImpl.fromHandle(handle) {
    ptr = new _IcuDataProxyCalls(impl);
  }

  IcuDataProxy.unbound() :
      impl = new IcuDataProxyImpl.unbound() {
    ptr = new _IcuDataProxyCalls(impl);
  }

  static IcuDataProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IcuDataProxy.fromEndpoint(endpoint);

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  String toString() {
    return "IcuDataProxy($impl)";
  }
}


class IcuDataStub extends bindings.Stub {
  IcuData _impl = null;

  IcuDataStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  IcuDataStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  IcuDataStub.unbound() : super.unbound();

  static IcuDataStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new IcuDataStub.fromEndpoint(endpoint);

  static const String name = IcuDataName;


  IcuDataMapResponseParams _IcuDataMapResponseParamsFactory(core.MojoSharedBuffer icuData) {
    var result = new IcuDataMapResponseParams();
    result.icuData = icuData;
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kIcuData_map_name:
        var params = IcuDataMapParams.deserialize(
            message.payload);
        return _impl.map(params.sha1hash,_IcuDataMapResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kIcuData_map_name,
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

  IcuData get impl => _impl;
      set impl(IcuData d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "IcuDataStub($superString)";
  }
}


