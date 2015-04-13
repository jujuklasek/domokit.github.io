// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library diagnostics.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;
import 'package:services/reaper/reaper.mojom.dart' as reaper_mojom;
import 'package:services/reaper/scythe.mojom.dart' as scythe_mojom;


class Node extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(40, 0)
  ];
  String appUrl = null;
  int nodeId = 0;
  int otherId = 0;
  String otherAppUrl = null;
  bool isSource = false;

  Node() : super(kVersions.last.size);

  static Node deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static Node decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    Node result = new Node();

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
      
      result.nodeId = decoder0.decodeUint32(16);
    }
    if (mainDataHeader.version >= 0) {
      
      result.otherId = decoder0.decodeUint32(20);
    }
    if (mainDataHeader.version >= 0) {
      
      result.otherAppUrl = decoder0.decodeString(24, false);
    }
    if (mainDataHeader.version >= 0) {
      
      result.isSource = decoder0.decodeBool(32, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(appUrl, 8, false);
    
    encoder0.encodeUint32(nodeId, 16);
    
    encoder0.encodeUint32(otherId, 20);
    
    encoder0.encodeString(otherAppUrl, 24, false);
    
    encoder0.encodeBool(isSource, 32, 0);
  }

  String toString() {
    return "Node("
           "appUrl: $appUrl" ", "
           "nodeId: $nodeId" ", "
           "otherId: $otherId" ", "
           "otherAppUrl: $otherAppUrl" ", "
           "isSource: $isSource" ")";
  }
}

class DiagnosticsDumpNodesParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  DiagnosticsDumpNodesParams() : super(kVersions.last.size);

  static DiagnosticsDumpNodesParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DiagnosticsDumpNodesParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DiagnosticsDumpNodesParams result = new DiagnosticsDumpNodesParams();

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
    return "DiagnosticsDumpNodesParams("")";
  }
}

class DiagnosticsDumpNodesResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  List<Node> nodes = null;

  DiagnosticsDumpNodesResponseParams() : super(kVersions.last.size);

  static DiagnosticsDumpNodesResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DiagnosticsDumpNodesResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DiagnosticsDumpNodesResponseParams result = new DiagnosticsDumpNodesResponseParams();

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
      
      var decoder1 = decoder0.decodePointer(8, false);
      {
        var si1 = decoder1.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
        result.nodes = new List<Node>(si1.numElements);
        for (int i1 = 0; i1 < si1.numElements; ++i1) {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
          result.nodes[i1] = Node.decode(decoder2);
        }
      }
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    if (nodes == null) {
      encoder0.encodeNullPointer(8, false);
    } else {
      var encoder1 = encoder0.encodePointerArray(nodes.length, 8, bindings.kUnspecifiedArrayLength);
      for (int i0 = 0; i0 < nodes.length; ++i0) {
        
        encoder1.encodeStruct(nodes[i0], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i0, false);
      }
    }
  }

  String toString() {
    return "DiagnosticsDumpNodesResponseParams("
           "nodes: $nodes" ")";
  }
}

class DiagnosticsResetParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  DiagnosticsResetParams() : super(kVersions.last.size);

  static DiagnosticsResetParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DiagnosticsResetParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DiagnosticsResetParams result = new DiagnosticsResetParams();

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
    return "DiagnosticsResetParams("")";
  }
}

class DiagnosticsGetReaperForAppParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String appUrl = null;
  Object reaper = null;

  DiagnosticsGetReaperForAppParams() : super(kVersions.last.size);

  static DiagnosticsGetReaperForAppParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DiagnosticsGetReaperForAppParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DiagnosticsGetReaperForAppParams result = new DiagnosticsGetReaperForAppParams();

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
      
      result.reaper = decoder0.decodeInterfaceRequest(16, false, reaper_mojom.ReaperStub.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(appUrl, 8, false);
    
    encoder0.encodeInterfaceRequest(reaper, 16, false);
  }

  String toString() {
    return "DiagnosticsGetReaperForAppParams("
           "appUrl: $appUrl" ", "
           "reaper: $reaper" ")";
  }
}

class DiagnosticsSetIsRootParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(24, 0)
  ];
  String appUrl = null;
  bool isRoot = false;

  DiagnosticsSetIsRootParams() : super(kVersions.last.size);

  static DiagnosticsSetIsRootParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DiagnosticsSetIsRootParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DiagnosticsSetIsRootParams result = new DiagnosticsSetIsRootParams();

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
      
      result.isRoot = decoder0.decodeBool(16, 0);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeString(appUrl, 8, false);
    
    encoder0.encodeBool(isRoot, 16, 0);
  }

  String toString() {
    return "DiagnosticsSetIsRootParams("
           "appUrl: $appUrl" ", "
           "isRoot: $isRoot" ")";
  }
}

class DiagnosticsSetScytheParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  Object scythe = null;

  DiagnosticsSetScytheParams() : super(kVersions.last.size);

  static DiagnosticsSetScytheParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DiagnosticsSetScytheParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DiagnosticsSetScytheParams result = new DiagnosticsSetScytheParams();

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
      
      result.scythe = decoder0.decodeServiceInterface(8, false, scythe_mojom.ScytheProxy.newFromEndpoint);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInterface(scythe, 8, false);
  }

  String toString() {
    return "DiagnosticsSetScytheParams("
           "scythe: $scythe" ")";
  }
}

class DiagnosticsPingParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  DiagnosticsPingParams() : super(kVersions.last.size);

  static DiagnosticsPingParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DiagnosticsPingParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DiagnosticsPingParams result = new DiagnosticsPingParams();

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
    return "DiagnosticsPingParams("")";
  }
}

class DiagnosticsPingResponseParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  DiagnosticsPingResponseParams() : super(kVersions.last.size);

  static DiagnosticsPingResponseParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DiagnosticsPingResponseParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DiagnosticsPingResponseParams result = new DiagnosticsPingResponseParams();

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
    return "DiagnosticsPingResponseParams("")";
  }
}
const int kDiagnostics_dumpNodes_name = 0;
const int kDiagnostics_reset_name = 1;
const int kDiagnostics_getReaperForApp_name = 2;
const int kDiagnostics_setIsRoot_name = 3;
const int kDiagnostics_setScythe_name = 4;
const int kDiagnostics_ping_name = 5;

const String DiagnosticsName =
      'reaper::Diagnostics';

abstract class Diagnostics {
  Future<DiagnosticsDumpNodesResponseParams> dumpNodes([Function responseFactory = null]);
  void reset();
  void getReaperForApp(String appUrl, Object reaper);
  void setIsRoot(String appUrl, bool isRoot);
  void setScythe(Object scythe);
  Future<DiagnosticsPingResponseParams> ping([Function responseFactory = null]);

}


class DiagnosticsProxyImpl extends bindings.Proxy {
  DiagnosticsProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  DiagnosticsProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  DiagnosticsProxyImpl.unbound() : super.unbound();

  static DiagnosticsProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DiagnosticsProxyImpl.fromEndpoint(endpoint);

  String get name => DiagnosticsName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      case kDiagnostics_dumpNodes_name:
        var r = DiagnosticsDumpNodesResponseParams.deserialize(
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
      case kDiagnostics_ping_name:
        var r = DiagnosticsPingResponseParams.deserialize(
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
    return "DiagnosticsProxyImpl($superString)";
  }
}


class _DiagnosticsProxyCalls implements Diagnostics {
  DiagnosticsProxyImpl _proxyImpl;

  _DiagnosticsProxyCalls(this._proxyImpl);
    Future<DiagnosticsDumpNodesResponseParams> dumpNodes([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new DiagnosticsDumpNodesParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kDiagnostics_dumpNodes_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
    void reset() {
      assert(_proxyImpl.isBound);
      var params = new DiagnosticsResetParams();
      _proxyImpl.sendMessage(params, kDiagnostics_reset_name);
    }
  
    void getReaperForApp(String appUrl, Object reaper) {
      assert(_proxyImpl.isBound);
      var params = new DiagnosticsGetReaperForAppParams();
      params.appUrl = appUrl;
      params.reaper = reaper;
      _proxyImpl.sendMessage(params, kDiagnostics_getReaperForApp_name);
    }
  
    void setIsRoot(String appUrl, bool isRoot) {
      assert(_proxyImpl.isBound);
      var params = new DiagnosticsSetIsRootParams();
      params.appUrl = appUrl;
      params.isRoot = isRoot;
      _proxyImpl.sendMessage(params, kDiagnostics_setIsRoot_name);
    }
  
    void setScythe(Object scythe) {
      assert(_proxyImpl.isBound);
      var params = new DiagnosticsSetScytheParams();
      params.scythe = scythe;
      _proxyImpl.sendMessage(params, kDiagnostics_setScythe_name);
    }
  
    Future<DiagnosticsPingResponseParams> ping([Function responseFactory = null]) {
      assert(_proxyImpl.isBound);
      var params = new DiagnosticsPingParams();
      return _proxyImpl.sendMessageWithRequestId(
          params,
          kDiagnostics_ping_name,
          -1,
          bindings.MessageHeader.kMessageExpectsResponse);
    }
}


class DiagnosticsProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  Diagnostics ptr;
  final String name = DiagnosticsName;

  DiagnosticsProxy(DiagnosticsProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _DiagnosticsProxyCalls(proxyImpl);

  DiagnosticsProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new DiagnosticsProxyImpl.fromEndpoint(endpoint) {
    ptr = new _DiagnosticsProxyCalls(impl);
  }

  DiagnosticsProxy.fromHandle(core.MojoHandle handle) :
      impl = new DiagnosticsProxyImpl.fromHandle(handle) {
    ptr = new _DiagnosticsProxyCalls(impl);
  }

  DiagnosticsProxy.unbound() :
      impl = new DiagnosticsProxyImpl.unbound() {
    ptr = new _DiagnosticsProxyCalls(impl);
  }

  static DiagnosticsProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DiagnosticsProxy.fromEndpoint(endpoint);

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  String toString() {
    return "DiagnosticsProxy($impl)";
  }
}


class DiagnosticsStub extends bindings.Stub {
  Diagnostics _impl = null;

  DiagnosticsStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  DiagnosticsStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  DiagnosticsStub.unbound() : super.unbound();

  static DiagnosticsStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DiagnosticsStub.fromEndpoint(endpoint);

  static const String name = DiagnosticsName;


  DiagnosticsDumpNodesResponseParams _DiagnosticsDumpNodesResponseParamsFactory(List<Node> nodes) {
    var result = new DiagnosticsDumpNodesResponseParams();
    result.nodes = nodes;
    return result;
  }
  DiagnosticsPingResponseParams _DiagnosticsPingResponseParamsFactory() {
    var result = new DiagnosticsPingResponseParams();
    return result;
  }

  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kDiagnostics_dumpNodes_name:
        var params = DiagnosticsDumpNodesParams.deserialize(
            message.payload);
        return _impl.dumpNodes(_DiagnosticsDumpNodesResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kDiagnostics_dumpNodes_name,
                message.header.requestId,
                bindings.MessageHeader.kMessageIsResponse);
          }
        });
        break;
      case kDiagnostics_reset_name:
        var params = DiagnosticsResetParams.deserialize(
            message.payload);
        _impl.reset();
        break;
      case kDiagnostics_getReaperForApp_name:
        var params = DiagnosticsGetReaperForAppParams.deserialize(
            message.payload);
        _impl.getReaperForApp(params.appUrl, params.reaper);
        break;
      case kDiagnostics_setIsRoot_name:
        var params = DiagnosticsSetIsRootParams.deserialize(
            message.payload);
        _impl.setIsRoot(params.appUrl, params.isRoot);
        break;
      case kDiagnostics_setScythe_name:
        var params = DiagnosticsSetScytheParams.deserialize(
            message.payload);
        _impl.setScythe(params.scythe);
        break;
      case kDiagnostics_ping_name:
        var params = DiagnosticsPingParams.deserialize(
            message.payload);
        return _impl.ping(_DiagnosticsPingResponseParamsFactory).then((response) {
          if (response != null) {
            return buildResponseWithId(
                response,
                kDiagnostics_ping_name,
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

  Diagnostics get impl => _impl;
      set impl(Diagnostics d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "DiagnosticsStub($superString)";
  }
}


