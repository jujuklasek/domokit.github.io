// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library debug_panel_host.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;
import 'package:mojo/services/navigation/public/interfaces/navigation.mojom.dart' as navigation_mojom;


class DebugPanelHostCloseTopWindowParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(8, 0)
  ];

  DebugPanelHostCloseTopWindowParams() : super(kVersions.last.size);

  static DebugPanelHostCloseTopWindowParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DebugPanelHostCloseTopWindowParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DebugPanelHostCloseTopWindowParams result = new DebugPanelHostCloseTopWindowParams();

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
    return "DebugPanelHostCloseTopWindowParams("")";
  }
}

class DebugPanelHostNavigateToParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String url = null;

  DebugPanelHostNavigateToParams() : super(kVersions.last.size);

  static DebugPanelHostNavigateToParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DebugPanelHostNavigateToParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DebugPanelHostNavigateToParams result = new DebugPanelHostNavigateToParams();

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
    return "DebugPanelHostNavigateToParams("
           "url: $url" ")";
  }
}

class DebugPanelHostSetNavigationTargetParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  int target = 0;

  DebugPanelHostSetNavigationTargetParams() : super(kVersions.last.size);

  static DebugPanelHostSetNavigationTargetParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static DebugPanelHostSetNavigationTargetParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    DebugPanelHostSetNavigationTargetParams result = new DebugPanelHostSetNavigationTargetParams();

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
      
      result.target = decoder0.decodeInt32(8);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kVersions.last);
    
    encoder0.encodeInt32(target, 8);
  }

  String toString() {
    return "DebugPanelHostSetNavigationTargetParams("
           "target: $target" ")";
  }
}
const int kDebugPanelHost_closeTopWindow_name = 0;
const int kDebugPanelHost_navigateTo_name = 1;
const int kDebugPanelHost_setNavigationTarget_name = 2;

const String DebugPanelHostName =
      'mojo::examples::DebugPanelHost';

abstract class DebugPanelHost {
  void closeTopWindow();
  void navigateTo(String url);
  void setNavigationTarget(int target);

}


class DebugPanelHostProxyImpl extends bindings.Proxy {
  DebugPanelHostProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  DebugPanelHostProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  DebugPanelHostProxyImpl.unbound() : super.unbound();

  static DebugPanelHostProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DebugPanelHostProxyImpl.fromEndpoint(endpoint);

  String get name => DebugPanelHostName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "DebugPanelHostProxyImpl($superString)";
  }
}


class _DebugPanelHostProxyCalls implements DebugPanelHost {
  DebugPanelHostProxyImpl _proxyImpl;

  _DebugPanelHostProxyCalls(this._proxyImpl);
    void closeTopWindow() {
      assert(_proxyImpl.isBound);
      var params = new DebugPanelHostCloseTopWindowParams();
      _proxyImpl.sendMessage(params, kDebugPanelHost_closeTopWindow_name);
    }
  
    void navigateTo(String url) {
      assert(_proxyImpl.isBound);
      var params = new DebugPanelHostNavigateToParams();
      params.url = url;
      _proxyImpl.sendMessage(params, kDebugPanelHost_navigateTo_name);
    }
  
    void setNavigationTarget(int target) {
      assert(_proxyImpl.isBound);
      var params = new DebugPanelHostSetNavigationTargetParams();
      params.target = target;
      _proxyImpl.sendMessage(params, kDebugPanelHost_setNavigationTarget_name);
    }
  
}


class DebugPanelHostProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  DebugPanelHost ptr;
  final String name = DebugPanelHostName;

  DebugPanelHostProxy(DebugPanelHostProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _DebugPanelHostProxyCalls(proxyImpl);

  DebugPanelHostProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new DebugPanelHostProxyImpl.fromEndpoint(endpoint) {
    ptr = new _DebugPanelHostProxyCalls(impl);
  }

  DebugPanelHostProxy.fromHandle(core.MojoHandle handle) :
      impl = new DebugPanelHostProxyImpl.fromHandle(handle) {
    ptr = new _DebugPanelHostProxyCalls(impl);
  }

  DebugPanelHostProxy.unbound() :
      impl = new DebugPanelHostProxyImpl.unbound() {
    ptr = new _DebugPanelHostProxyCalls(impl);
  }

  static DebugPanelHostProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DebugPanelHostProxy.fromEndpoint(endpoint);

  Future close({bool nodefer: false}) => impl.close(nodefer: nodefer);

  String toString() {
    return "DebugPanelHostProxy($impl)";
  }
}


class DebugPanelHostStub extends bindings.Stub {
  DebugPanelHost _impl = null;

  DebugPanelHostStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  DebugPanelHostStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  DebugPanelHostStub.unbound() : super.unbound();

  static DebugPanelHostStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new DebugPanelHostStub.fromEndpoint(endpoint);

  static const String name = DebugPanelHostName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kDebugPanelHost_closeTopWindow_name:
        var params = DebugPanelHostCloseTopWindowParams.deserialize(
            message.payload);
        _impl.closeTopWindow();
        break;
      case kDebugPanelHost_navigateTo_name:
        var params = DebugPanelHostNavigateToParams.deserialize(
            message.payload);
        _impl.navigateTo(params.url);
        break;
      case kDebugPanelHost_setNavigationTarget_name:
        var params = DebugPanelHostSetNavigationTargetParams.deserialize(
            message.payload);
        _impl.setNavigationTarget(params.target);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  DebugPanelHost get impl => _impl;
      set impl(DebugPanelHost d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "DebugPanelHostStub($superString)";
  }
}


