// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library browser_host.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class BrowserHostNavigateToParams extends bindings.Struct {
  static const List<bindings.StructDataHeader> kVersions = const [
    const bindings.StructDataHeader(16, 0)
  ];
  String url = null;

  BrowserHostNavigateToParams() : super(kVersions.last.size);

  static BrowserHostNavigateToParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static BrowserHostNavigateToParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    BrowserHostNavigateToParams result = new BrowserHostNavigateToParams();

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
    return "BrowserHostNavigateToParams("
           "url: $url" ")";
  }
}
const int kBrowserHost_navigateTo_name = 0;

const String BrowserHostName =
      'mojo::examples::BrowserHost';

abstract class BrowserHost {
  void navigateTo(String url);

}


class BrowserHostProxyImpl extends bindings.Proxy {
  BrowserHostProxyImpl.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) : super.fromEndpoint(endpoint);

  BrowserHostProxyImpl.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  BrowserHostProxyImpl.unbound() : super.unbound();

  static BrowserHostProxyImpl newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new BrowserHostProxyImpl.fromEndpoint(endpoint);

  String get name => BrowserHostName;

  void handleResponse(bindings.ServiceMessage message) {
    switch (message.header.type) {
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
  }

  String toString() {
    var superString = super.toString();
    return "BrowserHostProxyImpl($superString)";
  }
}


class _BrowserHostProxyCalls implements BrowserHost {
  BrowserHostProxyImpl _proxyImpl;

  _BrowserHostProxyCalls(this._proxyImpl);
    void navigateTo(String url) {
      assert(_proxyImpl.isBound);
      var params = new BrowserHostNavigateToParams();
      params.url = url;
      _proxyImpl.sendMessage(params, kBrowserHost_navigateTo_name);
    }
  
}


class BrowserHostProxy implements bindings.ProxyBase {
  final bindings.Proxy impl;
  BrowserHost ptr;
  final String name = BrowserHostName;

  BrowserHostProxy(BrowserHostProxyImpl proxyImpl) :
      impl = proxyImpl,
      ptr = new _BrowserHostProxyCalls(proxyImpl);

  BrowserHostProxy.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) :
      impl = new BrowserHostProxyImpl.fromEndpoint(endpoint) {
    ptr = new _BrowserHostProxyCalls(impl);
  }

  BrowserHostProxy.fromHandle(core.MojoHandle handle) :
      impl = new BrowserHostProxyImpl.fromHandle(handle) {
    ptr = new _BrowserHostProxyCalls(impl);
  }

  BrowserHostProxy.unbound() :
      impl = new BrowserHostProxyImpl.unbound() {
    ptr = new _BrowserHostProxyCalls(impl);
  }

  static BrowserHostProxy newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new BrowserHostProxy.fromEndpoint(endpoint);

  Future close({bool immediate: false}) => impl.close(immediate: immediate);

  String toString() {
    return "BrowserHostProxy($impl)";
  }
}


class BrowserHostStub extends bindings.Stub {
  BrowserHost _impl = null;

  BrowserHostStub.fromEndpoint(
      core.MojoMessagePipeEndpoint endpoint, [this._impl])
      : super.fromEndpoint(endpoint);

  BrowserHostStub.fromHandle(core.MojoHandle handle, [this._impl])
      : super.fromHandle(handle);

  BrowserHostStub.unbound() : super.unbound();

  static BrowserHostStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new BrowserHostStub.fromEndpoint(endpoint);

  static const String name = BrowserHostName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_impl != null);
    switch (message.header.type) {
      case kBrowserHost_navigateTo_name:
        var params = BrowserHostNavigateToParams.deserialize(
            message.payload);
        _impl.navigateTo(params.url);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  BrowserHost get impl => _impl;
      set impl(BrowserHost d) {
    assert(_impl == null);
    _impl = d;
  }

  String toString() {
    var superString = super.toString();
    return "BrowserHostStub($superString)";
  }
}


