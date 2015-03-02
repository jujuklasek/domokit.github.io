// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library browser_host.mojom;

import 'dart:async';
import 'mojo:bindings' as bindings;
import 'mojo:core' as core;


class BrowserHostNavigateToParams extends bindings.Struct {
  static const int kStructSize = 16;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 1);
  String url = null;

  BrowserHostNavigateToParams() : super(kStructSize);

  static BrowserHostNavigateToParams deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static BrowserHostNavigateToParams decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    BrowserHostNavigateToParams result = new BrowserHostNavigateToParams();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 1)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.url = decoder0.decodeString(8, false);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(url, 8, false);
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
      core.MojoMessagePipeEndpoint endpoint) : super(endpoint);

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
}


class _BrowserHostProxyCalls implements BrowserHost {
  BrowserHostProxyImpl _proxyImpl;

  _BrowserHostProxyCalls(this._proxyImpl);
    void navigateTo(String url) {
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

  void close() => impl.close();
}


class BrowserHostStub extends bindings.Stub {
  BrowserHost _delegate = null;

  BrowserHostStub.fromEndpoint(core.MojoMessagePipeEndpoint endpoint) :
      super(endpoint);

  BrowserHostStub.fromHandle(core.MojoHandle handle) :
      super.fromHandle(handle);

  BrowserHostStub.unbound() : super.unbound();

  static BrowserHostStub newFromEndpoint(
      core.MojoMessagePipeEndpoint endpoint) =>
      new BrowserHostStub.fromEndpoint(endpoint);

  static const String name = BrowserHostName;



  Future<bindings.Message> handleMessage(bindings.ServiceMessage message) {
    assert(_delegate != null);
    switch (message.header.type) {
      case kBrowserHost_navigateTo_name:
        var params = BrowserHostNavigateToParams.deserialize(
            message.payload);
        _delegate.navigateTo(params.url);
        break;
      default:
        throw new bindings.MojoCodecError("Unexpected message name");
        break;
    }
    return null;
  }

  BrowserHost get delegate => _delegate;
      set delegate(BrowserHost d) {
    assert(_delegate == null);
    _delegate = d;
  }
}


